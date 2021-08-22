<?php

namespace App\Classe;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Session\Flash\FlashBagInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class Cart 
{
    private $session;
    private $entityManager;
    private $flashBagInterface;

    public function __construct(SessionInterface $session, EntityManagerInterface $entityManager, FlashBagInterface $flashBagInterface) {
        $this->session = $session;
        $this->entityManager = $entityManager;
        $this->flashBagInterface = $flashBagInterface;
    }

    public function get() {
        return $this->session->get('cart');
    }

    public function getFull() {
        $completeCart = [];

        if (!is_null($this->get())) {
            foreach ($this->get() as $id => $quantity) {
                $completeCart[] = [
                    'product' => $this->entityManager->getRepository(Product::class)->findOneById($id),
                    'quantity' => $quantity
                ];
            }
        }
        return $completeCart;
    }

    public function add($id, $quantity) {
        $cart = $this->session->get('cart');

        $product = $this->entityManager->getRepository(Product::class)->findOneById($id);
        if ($product->getStock() < $quantity) {
            $this->flashBagInterface->add('error', 'Impossible d\'ajouter cette quantité au panier. Stock restant : ' . $product->getStock());
        } else {
            if (!empty($cart[$id])) {
                $cart[$id] += $quantity;
            } else {
                $cart[$id] = $quantity;
            }
        }

        return $this->session->set('cart', $cart);
    } 

    public function change($id, $operator) {
        $cart = $this->session->get('cart');

        $product = $this->entityManager->getRepository(Product::class)->findOneById($id);

        if (isset($cart[$id]) AND $cart[$id] >= 0) {
            switch ($operator) {
                case 'minus':
                    if ($cart[$id] >= 2) {
                        $cart[$id]--;
                    } else {
                        return $this->remove($id);
                    }
                break;

                case 'plus':
                    if (($product->getStock() - $cart[$id]) < 1) {
                        $this->flashBagInterface->add('error', 'Impossible d\'augmenter la quantité du panier - Quantité insuffisante');
                    } else {
                        $cart[$id]++;
                    }
                break;
            }
        } else {
            $cart[$id] = 1;
        }

        return $this->session->set('cart', $cart);
    }

    public function remove($id) {
        $cart = $this->session->get('cart');

        if (isset($cart[$id])) {
            unset($cart[$id]);
        }

        return $this->session->set('cart', $cart);
    }

    public function delete() {
        return $this->session->remove('cart');
    }
}