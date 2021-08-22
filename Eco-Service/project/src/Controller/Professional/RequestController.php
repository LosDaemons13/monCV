<?php

namespace App\Controller\Professional;

use App\Entity\Customer;
use App\Entity\Request as RequestEntity;
use App\Form\RequestType;
use App\Repository\RequestStatusRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request as HttpRequest;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class RequestController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager, Security $security){
        $this->entityManager = $entityManager;
        $this->customer = $entityManager->getRepository(Customer::class)->find($security->getUser());
    }
    /**
     * @Route("request", name="request")
     */
    public function index(HttpRequest $httpRequest, RequestStatusRepository $requestStatusRepository): Response
    {
        if (!$this->customer->getCompanyName() OR !$this->customer->getCompanySiret()) {
            // Redirect to Account => Must have companyName and companySiret
            $this->addFlash('error', 'Merci de renseigner les informations de votre entreprise (Raison sociale et SIRET)');
            return $this->redirectToRoute('app_account_edit_customer', ['id' => $this->customer->getUser()->getId()]);
        }
        $requestEntity = new RequestEntity();
        $form = $this->createForm(RequestType::class, $requestEntity);
        $form->handleRequest($httpRequest);

        if ($form->isSubmitted() && $form->isValid()) {
            if (!$this->customer) {
                $this->addFlash('error', 'Votre compte ne vous permet pas d\'effectuer de demande de devis');
                return $this->redirectToRoute('professional_home');
            }
            $requestEntity->setCustomer($this->customer);
            $requestEntity->setStatus($requestStatusRepository->find(1));

            $this->entityManager->persist($requestEntity);
            $this->entityManager->flush();

            $this->addFlash('success', 'Votre requête a été envoyée. Nous reviendrons vers vous prochainement');
        }

        return $this->render('professional/request/index.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
