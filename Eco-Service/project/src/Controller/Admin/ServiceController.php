<?php

namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Service;
use Symfony\Component\HttpFoundation\Request as HttpRequest;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Request as RequestEntity;
use App\Entity\Worker;
use App\Form\ServiceType;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Core\Security;
use App\Classe\File;
use App\Entity\ServicePicture;

/**
 * @Route("/service")
 */
class ServiceController extends AbstractController
{
    private $worker;
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager, Security $security){
        $this->entityManager = $entityManager;
        $this->worker = $entityManager->getRepository(Worker::class)->find($security->getUser());

    }

    /**
     * @Route("/", name="service_index", methods={"GET"})
     */
    public function index(): Response
    {
        return $this->render('admin/service/index.html.twig');
    }

    /**
     * @Route("/get-all-service", name="service_get_all_service", methods={"GET","POST"})
     * @param Request $request
     * @return Response
     */
    public function getAllService(Request $request): Response
    {
        $data = [];

        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();

            $query = $em->createQuery(
                '
                SELECT S.id, S.label,S.description, S.createdAt
                FROM App\Entity\Service S
                ORDER BY S.createdAt ASC
                '
            );
            $data = $query->getArrayResult();

            foreach($data as $k => $v){
                $data[$k]['createdAt'] = $v['createdAt']->format('Y-m-d H:i:s');


                //Actions button (view, edit, delete)
                $data[$k]['actions'] = '<a data-toggle="tooltip" title="Voir" class="text-dark" href="/admin/service/'.$v['id'].'"><i class="fas fa-eye mr-2"></i></a>';
                $data[$k]['actions'] .= '<a data-toggle="tooltip" title="Éditer" class="text-dark" href="/admin/service/'.$v['id'].'/edit"><i class="fas fa-pen mr-2"></i></a>';
            }
        }

        $result = [
            'data' => $data
        ];
        return new JsonResponse($result);
    }

        /**
     * @Route("/new", name="service_new", methods={"GET","POST"})
     */
    public function new(Request $request, File $file): Response
    {
        $service = new Service();
        $form = $this->createForm(ServiceType::class, $service);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if (!$this->worker) {
                return $this->redirectToRoute('admin_service_index');
            }
            $service->setCreatedBy($this->worker);
            
            // Upload service and create new servicePictures
            $i = 1;
            foreach ($form->get('images')->getData() as $image) {
                $picture = $file->upload($image);
                $servicePicture = new ServicePicture();
                $servicePicture->setPicture($picture)->setService($service)->setPosition($i);
                $this->entityManager->persist($servicePicture);
                $i++;
            }

            $this->entityManager->persist($service);
            $this->entityManager->flush();

            return $this->redirectToRoute('admin_service_index');
        }

        return $this->render('admin/service/new_show_edit.html.twig', [
            'service' => $service,
            'form' => $form->createView(),
        ]);
    }

        /**
     * @Route("/{id}", name="service_show", methods={"GET"})
     */
    public function show(Service $service): Response
    {
        return $this->render('admin/service/new_show_edit.html.twig', [
            'service' => $service,
        ]);
    }



        /**
     * @Route("/{id}/edit", name="service_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Service $service): Response
    {
        $form = $this->createForm(ServiceType::class, $service);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if (!$this->worker) {
                return $this->redirectToRoute('admin_service_index');
            }
            $service->setUpdatedBy($this->worker);
            $this->entityManager->flush();

            return $this->redirectToRoute('admin_service_index');
        }

        return $this->render('admin/service/new_show_edit.html.twig', [
            'service' => $service,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="service_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Service $service): Response
    {
        if ($this->isCsrfTokenValid('delete'.$service->getId(), $request->request->get('_token'))) {
            
            if (!$this->worker) {
                return $this->redirectToRoute('admin_service_index');
            }
            $service->setDeletedBy($this->worker);
            $service->setDeletedAt(new \DateTime("now"));
            $this->entityManager->flush();
        }

        return $this->redirectToRoute('admin_service_index');
    }
}
