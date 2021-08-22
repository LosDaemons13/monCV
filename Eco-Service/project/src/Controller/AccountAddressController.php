<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Classe\UserManager;
use App\Entity\Address;
use App\Entity\Customer;
use App\Entity\User;
use App\Form\AddressType;
use App\Form\UserType;
use App\Repository\AddressRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class AccountAddressController extends AbstractController
{
    private $entityManager;

    private $customer;

    public function __construct(EntityManagerInterface $entityManager, Security $security){
        $this->entityManager = $entityManager;

        $this->customer = $entityManager->getRepository(Customer::class)->find($security->getUser());
    }

    /**
     * @Route("/account/address", name="app_account_address")
     */
    public function index(): Response
    {
        return $this->render('account/address/index.html.twig');
    }

    /**
     * @Route("/account/address/new", name="app_account_address_new")
     */
    public function new(Cart $cart, Request $request): Response
    {
        $address = new Address();
        $form = $this->createForm(AddressType::class, $address);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if (!$this->customer) {
                return $this->redirectToRoute('app_account');
            }
            $address->setCreatedBy($this->customer);
            
            $this->entityManager->persist($address);
            $this->entityManager->flush();
            $this->addFlash('success', 'Votre adresse a été ajoutée');

            if ($cart->get()) {
                return $this->redirectToRoute('individual_purchase');
            }

            return $this->redirectToRoute('app_account_address');
        }

        return $this->render('account/address/add_edit.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/account/address/edit/{id}", name="app_account_address_edit")
     */
    public function edit(Request $request, AddressRepository $addressRepository, $id): Response
    {
        $address = $addressRepository->find($id);

        $form = $this->createForm(AddressType::class, $address);
        $form->handleRequest($request);

        if (!$address OR $address->getCreatedBy() != $this->customer) {
            $this->addFlash('error', 'Impossible de modifier cette adresse');
            return $this->redirectToRoute('app_account_address');
        }
        if ($form->isSubmitted() && $form->isValid()) {
            if (!$this->customer) {
                $this->addFlash('error', 'Vous n\'êtes pas client');
                return $this->redirectToRoute('app_account_address');
            }
            $this->entityManager->flush();
            $this->addFlash('success', 'Votre adresse a été modifiée');
            return $this->redirectToRoute('app_account_address');
        }

        return $this->render('account/address/add_edit.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/account/address/delete/{id}", name="app_account_address_delete")
     */
    public function delete(Request $request, AddressRepository $addressRepository, $id): Response
    {
        $address = $addressRepository->find($id);

        if (!$address OR $address->getCreatedBy() != $this->customer) {
            $this->addFlash('error', 'Impossible de supprimer cette adresse');
            return $this->redirectToRoute('app_account_address');
        }

        $address->setDeletedAt(new \DateTime("now"));
        $this->entityManager->flush();
        $this->addFlash('success', 'Votre adresse a été supprimée');

        return $this->redirectToRoute('app_account_address');
    }
}
