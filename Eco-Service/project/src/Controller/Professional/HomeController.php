<?php

namespace App\Controller\Professional;

use App\Repository\ServiceRepository;
use App\Entity\Service;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class HomeController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager){
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/", name="home")
     * @param ServiceRepository $serviceRepository
     * @return Response
     */
    public function index(ServiceRepository $serviceRepository): Response
    {
        return $this->render('professional/home/index.html.twig', [
            'services' => $serviceRepository->findBy(['deletedAt' => null])
        ]);
    }

    /**
     * @Route("/service/{id}", name="service")
     * @param $id
     * @param ServiceRepository $serviceRepository
     * @return Response
     */
    public function show($id, ServiceRepository $serviceRepository): Response
    {
        $service = $this->entityManager->getRepository(Service::class)->find($id);

        return $this->render('professional/home/show.html.twig', [
            'service' => $service,
            'services' => $serviceRepository->findBy(['deletedAt' => null])
        ]);
    }
}
