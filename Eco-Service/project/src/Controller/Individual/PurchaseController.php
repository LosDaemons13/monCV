<?php

namespace App\Controller\Individual;

use App\Classe\Cart;
use App\Entity\Customer;
use App\Entity\Product;
use App\Entity\Purchase;
use App\Entity\PurchaseProduct;
use App\Entity\PurchaseStatus;
use App\Entity\User;
use App\Form\PurchaseType;
use App\Repository\AddressRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class PurchaseController extends AbstractController
{
    private $entityManager;

    private $customer;

    public function __construct(EntityManagerInterface $entityManager, Security $security){
        $this->entityManager = $entityManager;
        $this->customer = $entityManager->getRepository(Customer::class)->find($security->getUser());
    }

    /**
     * @Route("/purchase", name="purchase")
     * @param AddressRepository $addressRepository
     * @param Cart $cart
     * @param Request $request
     * @return Response
     */
    public function index(AddressRepository $addressRepository, Cart $cart, Request $request): Response
    {
        if (!$this->customer) {
            $this->addFlash('error', 'Votre compte ne vous permet pas de passer de commande');
            return $this->redirectToRoute('individual_cart');
        } elseif (!$cart->getFull()) {
            $this->addFlash('error', 'Votre panier est vide');
            return $this->redirectToRoute('individual_cart');
        } elseif (!$this->customer->getAddresses()->getValues()) {
            $this->addFlash('warning', "Vous n'avez pas d'adresse. Merci d'en ajouter une");
            return $this->redirectToRoute('app_account_address_new');
        } 

        $form = $this->createForm(PurchaseType::class, null, [
            'customer' => $addressRepository->findBy(['createdBy' => $this->customer, 'deletedAt' => null])
        ]);

        return $this->render('individual/purchase/index.html.twig', [
            'cart' => $cart->getFull(),
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/purchase/validation", name="purchase_validation", methods="POST")
     * @param AddressRepository $addressRepository
     * @param Cart $cart
     * @param Request $request
     * @return Response
     */
    public function new(AddressRepository $addressRepository, Cart $cart, Request $request): Response
    {
        $form = $this->createForm(PurchaseType::class, null, [
            'customer' => $addressRepository->findBy(['createdBy' => $this->customer, 'deletedAt' => null])
        ]);
        $form->handleRequest($request);

        if ($form->isSubmitted() AND $form->isValid()){
            $delivery = $form->get('address')->getData();
            $deliveryContent = $delivery->getFirstName().' '.$delivery->getLastName();
            $deliveryContent .= '<br/>'.$delivery->getStreetNumber().' '.$delivery->getStreet();
            $deliveryContent .= '<br/>'.$delivery->getPostalCode().' '.$delivery->getCity();
            $deliveryContent .= '<br/>'.$delivery->getCountry();

            $previousNotValidatedPurchases = $this->entityManager->getRepository(Purchase::class)->findPreviousNotValidatedPurchases();
            foreach ($previousNotValidatedPurchases as $purchaseToRemove) {
                $this->entityManager->remove($purchaseToRemove);
            }

            $purchase = new Purchase();
            $purchase->setCustomer($this->customer);
            $purchase->setStatus($this->entityManager->getRepository(PurchaseStatus::class)->findOneById(1));
            $purchase->setAddress($form['address']->getData());
            $this->entityManager->persist($purchase);

            foreach ($cart->getFull() as $product) {
                $purchaseProduct = new PurchaseProduct();
                $purchaseProduct->setProduct($product['product']);
                $purchaseProduct->setPurchase($purchase);
                $purchaseProduct->setQuantity($product['quantity']);

                $changeProductStock = $this->entityManager->getRepository(Product::class)->findOneById($product['product']->getId());
                $changeProductStock->setStock($changeProductStock->getStock() - $product['quantity']);

                $this->entityManager->persist($changeProductStock);
                $this->entityManager->persist($purchaseProduct);
            }

            $this->entityManager->flush();

            return $this->render('individual/purchase/new.html.twig', [
                'cart' => $cart->getFull(),
                'delivery' => $deliveryContent,
                'purchase' => $purchase,
                'purchaseId' => $purchase->getId()
            ]);
        }

        return $this->redirectToRoute('individual_cart');    
    }

    /**
     * @Route("/purchase/success/{stripeSessionId}", name="purchase_payment_success")
     * @param $stripeSessionId
     * @param Cart $cart
     * @param MailerInterface $mailer
     * @return Response
     * @throws TransportExceptionInterface
     */
    public function paymentSuccess($stripeSessionId, Cart $cart, MailerInterface $mailer): Response
    {
        $purchase = $this->entityManager->getRepository(Purchase::class)->findOneByStripeSessionId($stripeSessionId);

        
        if (!$purchase OR $purchase->getCustomer() != $this->customer) {
            $this->addFlash('error', 'Une erreur est apparue lors du traitement de votre commande - Merci de contacter le Service Clients');
            return $this->redirectToRoute('individual_purchase');
        }

        $isNotPaidStatus = $this->entityManager->getRepository(PurchaseStatus::class)->findOneById(1);
        if ($purchase->getStatus() == $isNotPaidStatus) {
            $isPaidStatus = $this->entityManager->getRepository(PurchaseStatus::class)->findOneById(2);
            $purchase->setStatus($isPaidStatus);
            $this->entityManager->flush();
        }
        
        $cart->delete();

        $user = $this->entityManager->getRepository(User::class)->findOneById($purchase->getCustomer()->getUser());

        $email = (new Email())
            ->from('contact@eco-service.pac.center')
            ->to($user->getEmail())
            ->subject('Éco-Service | Confirmation de votre paiement')
            ->text("M./Mme ".$user->getFirstname()." ".$user->getLastname().", nous vous confirmons que votre paiement sur notre plate-forme Éco-Service à bien été pris en compte. Votre commande est désormais en attente de préparation. Vous recevrez un email lorsque celle-ci sera expédié. L'équipe Éco-Service vous remercie pour votre confiance et espère vous revoir bientôt !");
        $mailer->send($email);

        return $this->render('individual/purchase/success.html.twig', [
            'purchase' => $purchase
        ]);
    }

    /**
     * @Route("/purchase/error/{stripeSessionId}", name="purchase_payment_error")
     * @param $stripeSessionId
     * @param Cart $cart
     * @param MailerInterface $mailer
     * @return Response
     */
    public function paymentError($stripeSessionId, Cart $cart, MailerInterface $mailer): Response
    {
        $purchase = $this->entityManager->getRepository(Purchase::class)->findOneByStripeSessionId($stripeSessionId);
        if (!$purchase OR $purchase->getCustomer() != $this->customer) {
            $this->addFlash('error', 'Une erreur est apparue lors du traitement de votre commande - Merci de contacter le Service Clients');
            return $this->redirectToRoute('individual_purchase');
        }

        foreach ($cart->getFull() as $product) {
            $changeProductStock = $this->entityManager->getRepository(Product::class)->findOneById($product['product']->getId());
            $changeProductStock->setStock($changeProductStock->getStock() + $product['quantity']);

            $this->entityManager->persist($changeProductStock);
        }

        $purchase->setCanceledAt(new \DateTime("now"));
        $this->entityManager->flush();

        $user = $this->entityManager->getRepository(User::class)->findOneById($purchase->getCustomer()->getUser());

        $email = (new Email())
            ->from('contact@eco-service.pac.center')
            ->to($user->getEmail())
            ->subject('Éco-Service | Tentative de paiement échoué')
            ->text("M./Mme ".$user->getFirstname()." ".$user->getLastname().", votre paiement sur notre plate-forme Éco-Service n'a pas pu aboutir à cause d'une erreur pendant la procédure. Vous pouvez réessayer dès maintenant. Si le problème persiste, veuillez contacter un administrateur.");
        $mailer->send($email);
        
        return $this->render('individual/purchase/error.html.twig', [
            'purchase' => $purchase
        ]);
    }
}
