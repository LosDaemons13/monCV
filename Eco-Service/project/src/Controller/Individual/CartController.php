<?php

namespace App\Controller\Individual;

use App\Classe\Cart;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    /**
     * @Route("/cart", name="cart")
     * @param Cart $cart
     * @param ProductRepository $productRepository
     * @return Response
     */
    public function index(Cart $cart, ProductRepository $productRepository): Response
    {        
        return $this->render('individual/cart/index.html.twig', [
            'cart' => $cart->getFull()
        ]);
    }

    /**
     * @Route("/cart/add/{id}/{quantity}", name="add_to_cart")
     * @param Cart $cart
     * @param $id
     * @param $quantity
     * @return Response
     */
    public function add(Cart $cart, $id, $quantity): Response
    {
        $cart->add($id, $quantity);
        return $this->redirectToRoute('individual_products', ['category_id' => 'all']);
    }

    /**
     * @Route("/cart/change/{id}/{operator}", name="change_quantity_in_cart")
     * @param Cart $cart
     * @param $id
     * @param $operator
     * @return Response
     */
    public function change(Cart $cart, $id, $operator): Response
    {
        $cart->change($id, $operator);
        return $this->redirectToRoute('individual_cart');
    }

    /**
     * @Route("/cart/remove/{id}", name="remove_from_cart")
     * @param Cart $cart
     * @param $id
     * @return Response
     */
    public function remove(Cart $cart, $id): Response
    {
        $cart->remove($id);
        return $this->redirectToRoute('individual_cart');
    }

    /**
     * @Route("/cart/delete", name="remove_cart")
     * @param Cart $cart
     * @return Response
     */
    public function delete(Cart $cart): Response
    {
        $cart->delete();
        return $this->redirectToRoute('individual_cart');
    }
}
