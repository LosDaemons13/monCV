<?php

namespace App\Controller;

use App\Classe\UserManager;
use App\Entity\User;
use App\Form\UserType;
use App\Repository\CustomerRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Mime\Email;

class AccountController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager){
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/register", name="app_register")
     * @param Request $request
     * @param UserManager $userManager
     * @param MailerInterface $mailer
     * @return Response
     * @throws TransportExceptionInterface
     */
    public function register(Request $request, UserManager $userManager, MailerInterface $mailer): Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() AND $form->isValid()){
            if ($userManager->new($user, $form, 'customer')) {
                $this->addFlash('success', 'Votre compte a été créé avec succès');

                $form_data = $form->getData();
                $email = (new Email())
                    ->from('contact@eco-service.pac.center')
                    ->to($form_data->getEmail())
                    ->subject('Éco-Service | Validation de votre adresse email')
                    ->text("M./Mme ".$form_data->getFirstname()." ".$form_data->getLastname().", vous venez de compléter notre formulaire d'inscription sur notre site internet Éco-Service. Pour finaliser votre inscription, veuillez valider votre adresse email en cliquant sur ce lien : http://localhost:8741/verify_account/".$form_data->getId().'. A bientôt !');
                $mailer->send($email);
            } else {
                $this->addFlash('error', 'Vous ne pouvez pas créer de compte avec cette adresse e-mail - Adresse e-mail déjà utilisée');
            }
        }

        return $this->render('account/register.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/verify_account/{id}", name="app_verify_account")
     * @param $id
     * @param UserRepository $userRepository
     * @param CustomerRepository $customerRepository
     * @return Response
     */
    public function verify_account($id, UserRepository $userRepository, CustomerRepository $customerRepository): Response
    {
        $user = $userRepository->findOneById($id);
        $customer = $customerRepository->findOneByUser($user);
        $customer->setEmailVerified(1);
        $this->entityManager->flush();
        return $this->render('account/verify_account.html.twig');
    }

    /**
     * @Route("/account", name="app_account")
     */
    public function index(): Response
    {
        return $this->render('account/index.html.twig');
    }

    /**
     * @Route("/account/edit-customer/{id}", name="app_account_edit_customer")
     * @param $id
     * @param Request $request
     * @param UserRepository $userRepository
     * @param CustomerRepository $customerRepository
     * @return Response
     */
    public function editCustomer($id, Request $request, UserRepository $userRepository, CustomerRepository $customerRepository): Response
    {
        $user = $userRepository->findOneById($id);
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() AND $form->isValid()){
            $customer = $customerRepository->findOneByUser($user);
            $customer->setCompanyName($form['company_name']->getData());
            $customer->setCompanySiret($form['company_siret']->getData());

            $this->entityManager->flush();
            $this->addFlash('success', 'Vos informations ont été mises à jour');
        }

        return $this->render('account/edit_customer.html.twig', [
            'form' => $form->createView(),
            'user' => $user
        ]);
    }
}
