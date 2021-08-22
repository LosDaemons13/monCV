<?php

namespace App\Controller\Individual;

use App\Classe\Cart;
use App\Entity\Purchase;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Checkout\Session;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class StripeController extends AbstractController
{
    /**
     * @Route("/purchase/create-session/{purchaseId}", name="stripe_create_session")
     * @param EntityManagerInterface $entityManager
     * @param Cart $cart
     * @param $purchaseId
     * @return JsonResponse
     */
    public function index(EntityManagerInterface $entityManager, Cart $cart, $purchaseId): JsonResponse
    {
        $YOUR_DOMAIN = 'http://localhost:8741';
        $productsForStripe = [];

        foreach ($cart->getFull() as $product) {
            $picture = $product['product']->getProductPictures()->first()->getPicture();
            $productsForStripe[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'unit_amount' => $product['product']->getPrice()*100,
                    'product_data' => [
                        'name' => $product['product']->getLabel(),
                        'images' => [$YOUR_DOMAIN."/assets/uploads/" . $picture->getId() . "." . $picture->getExtension()],
                    ],
                ],
                'quantity' => $product['quantity'],
            ];
        }

        Stripe::setApiKey('sk_test_51IQqLmBbRCcpIJeacisHMJCcqzDmo9horC1dSelWFcS8nqE7W3DBwTxfX6yVonF7dPJs4UalMx5EyGP2WHFUUlAV00stfYM14W');

        $checkout_session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [
                $productsForStripe
                ],
            'mode' => 'payment',
            'success_url' => $YOUR_DOMAIN . '/individual/purchase/success/{CHECKOUT_SESSION_ID}',
            'cancel_url' => $YOUR_DOMAIN . '/individual/purchase/error/{CHECKOUT_SESSION_ID}',
        ]);

        $purchase = $entityManager->getRepository(Purchase::class)->findOneById($purchaseId);
        $purchase->setStripeSessionId($checkout_session->id);
        $entityManager->flush();

        return new JsonResponse([
            'id' => $checkout_session->id
        ]);
    }
}
