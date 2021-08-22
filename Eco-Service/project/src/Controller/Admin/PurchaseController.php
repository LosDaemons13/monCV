<?php

namespace App\Controller\Admin;

use App\Entity\Purchase;
use App\Entity\PurchaseStatus;
use App\Form\PurchaseType;
use App\Repository\PurchaseRepository;
use App\Repository\PurchaseStatusRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route("/purchase")
 */
class PurchaseController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager){
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/", name="purchase_index", methods={"GET"})
     */
    public function index(PurchaseRepository $purchaseRepository, PurchaseStatusRepository $purchaseStatusRepository): Response
    {
        return $this->render('admin/purchase/index.html.twig');
    }

            /**
     * @Route("/get-all-purchases", name="purchase_get_all_purchases", methods={"GET","POST"})
     * @param Request $request
     * @return Response
     */
    public function getAllPurchases(Request $request): Response
    {
        $data = [];

        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();

            $query = $em->createQuery(
                '
                SELECT P.id, U.firstname, S.label, P.createdAt, P.canceledAt
                FROM App\Entity\Purchase P
                JOIN App\Entity\User U 
                JOIN App\Entity\PurchaseStatus S
                WHERE U.id = P.customer
                AND S.id = P.status
                ORDER BY P.createdAt ASC
                '
            );
            $data = $query->getArrayResult();

            foreach($data as $k => $v){
                $data[$k]['createdAt'] = $v['createdAt']->format('Y-m-d H:i:s');


                //Actions button (view, edit, delete)
                $data[$k]['actions'] = '<a data-toggle="tooltip" title="Voir" class="text-dark" href="/admin/product/'.$v['id'].'"><i class="fas fa-eye mr-2"></i></a>';
                $data[$k]['actions'] .= '<a data-toggle="tooltip" title="Éditer" class="text-dark" href="/admin/product/'.$v['id'].'/edit"><i class="fas fa-pen mr-2"></i></a>';
            }
        }

        $result = [
            'data' => $data
        ];
        return new JsonResponse($result);
    }

    
    /**
     * @Route("/{id}", name="purchase_show", methods={"GET"})
     */
    public function show(Purchase $purchase, PurchaseStatusRepository $purchaseStatusRepository): Response
    {
        return $this->render('admin/purchase/show.html.twig', [
            'purchase' => $purchase,
            'purchaseStatus' => $purchaseStatusRepository->findAll()
        ]);
    }

    /**
     * @Route("/{id}/edit", name="purchase_edit", methods={"POST"})
     */
    public function edit(Purchase $purchase, Request $request, $id): Response
    {
        $purchaseStatus = $this->entityManager->getRepository(PurchaseStatus::class)->find($request->get('status')[$id]);
        $purchase->setStatus($purchaseStatus);
        $this->entityManager->flush();
        return $this->redirectToRoute('admin_purchase_index');
    }

    /**
     * @Route("/{id}", name="purchase_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Purchase $purchase): Response
    {
        if ($this->isCsrfTokenValid('delete'.$purchase->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($purchase);
            $entityManager->flush();
        }

        return $this->redirectToRoute('admin_purchase_index');
    }
}
