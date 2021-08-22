<?php

namespace App\Controller\Admin;

use App\Entity\Request as RequestEntity;
use App\Entity\RequestStatus;
use App\Repository\RequestStatusRepository;
use App\Repository\RequestRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Request as HttpRequest;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route("/request")
 */
class RequestController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager){
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/", name="request_index", methods={"GET"})
     */
    public function index(RequestRepository $requestRepository, RequestStatusRepository $requestStatusRepository): Response
    {
        return $this->render('admin/request/index.html.twig');
    }



    /**
     * @Route("/get-all-request", name="request_get_all_request", methods={"GET","POST"})
     * @param Request $request
     * @return Response
     */
    public function getAllRequest(Request $request): Response
    {
        $data = [];

        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();

            $query = $em->createQuery(
                '
                SELECT R.id, C.companyName, S.label, R.message, R.createdAt, St.label AS Rlabel
                FROM App\Entity\Request R
                JOIN App\Entity\Customer C 
                JOIN App\Entity\Service S
                JOIN App\Entity\RequestStatus St
                WHERE R.customer = C.user
                AND S.id = R.service
                AND St.id = R.status
                ORDER BY R.createdAt ASC
                '
            );
            $data = $query->getArrayResult();

            foreach($data as $k => $v){
                $data[$k]['createdAt'] = $v['createdAt']->format('Y-m-d H:i:s');


                //Actions button (view, edit, delete)
                $data[$k]['actions'] = '<a data-toggle="tooltip" title="Voir" class="text-dark" href="/admin/request/'.$v['id'].'"><i class="fas fa-eye mr-2"></i></a>';
                $data[$k]['actions'] .= '<a data-toggle="tooltip" title="Éditer" class="text-dark" href="/admin/request/'.$v['id'].'/edit"><i class="fas fa-pen mr-2"></i></a>';
            }
        }

        $result = [
            'data' => $data
        ];
        return new JsonResponse($result);
    }


    /**
     * @Route("/{id}", name="request_show", methods={"GET"})
     */
    public function show(RequestEntity $requestEntity, RequestStatusRepository $requestStatusRepository): Response
    {
        return $this->render('admin/request/show.html.twig', [
            'request' => $requestEntity,
            'requestStatus' => $requestStatusRepository->findAll()
        ]);
    }

    /**
     * @Route("/{id}/edit", name="request_edit", methods={"POST"})
     */
    public function edit(RequestEntity $requestEntity, HttpRequest $httpRequest, $id): Response
    {
        $requestStatus = $this->entityManager->getRepository(RequestStatus::class)->find($httpRequest->get('status')[$id]);
        $requestEntity->setStatus($requestStatus);
        $this->entityManager->flush();
        return $this->redirectToRoute('admin_request_index');
    }

    /**
     * @Route("/{id}", name="request_delete", methods={"DELETE"})
     */
    public function delete(RequestEntity $requestEntity, HttpRequest $httpRequest): Response
    {
        if ($this->isCsrfTokenValid('delete'.$requestEntity->getId(), $httpRequest->requestEntity->get('_token'))) {
            $this->entityManager->remove($requestEntity);
            $this->entityManager->flush();
        }

        return $this->redirectToRoute('admin_request_index');
    }
}
