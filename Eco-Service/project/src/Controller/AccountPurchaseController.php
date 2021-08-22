<?php

namespace App\Controller;

use App\Entity\Purchase;
use App\Entity\PurchaseStatus;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccountPurchaseController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager){
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/account/purchase", name="app_account_purchase")
     */
    public function index(): Response
    {
        $notPaidStatus = $this->entityManager->getRepository(PurchaseStatus::class)->findOneById(1);
        
        return $this->render('account/purchase/index.html.twig', [
            'notPaidStatus' => $notPaidStatus
        ]);
    }
}
