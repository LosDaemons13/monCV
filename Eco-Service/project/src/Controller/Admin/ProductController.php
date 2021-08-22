<?php

namespace App\Controller\Admin;

use App\Classe\File;
use App\Entity\Product;
use App\Entity\ProductPicture;
use App\Entity\Worker;
use App\Form\ProductType;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route("/product")
 */
class ProductController extends AbstractController
{
    private $entityManager;

    private $worker;

    public function __construct(EntityManagerInterface $entityManager, Security $security){
        $this->entityManager = $entityManager;
        $this->worker = $entityManager->getRepository(Worker::class)->find($security->getUser());
    }

    /**
     * @Route("/", name="product_index", methods={"GET"})
     */
    public function index(ProductRepository $productRepository): Response
    {
        return $this->render('admin/product/index.html.twig');
    }

        /**
     * @Route("/get-all-products", name="product_get_all_products", methods={"GET","POST"})
     * @param Request $request
     * @return Response
     */
    public function getAllProducts(Request $request): Response
    {
        $data = [];

        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();

            $query = $em->createQuery(
                '
                SELECT P.id, P.label, P.description, P.price, P.stock , P.createdAt
                FROM App\Entity\Product P
                WHERE P.deletedAt IS NULL
                ORDER BY P.label ASC
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
     * @Route("/new", name="product_new", methods={"GET","POST"})
     */
    public function new(Request $request, File $file): Response
    {
        $product = new Product();
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if (!$this->worker) {
                return $this->redirectToRoute('admin_product_index');
            }
            $product->setCreatedBy($this->worker);
            
            // Upload pictures and create new ProductPictures
            $i = 1;
            foreach ($form->get('images')->getData() as $image) {
                $picture = $file->upload($image);
                $productPicture = new ProductPicture();
                $productPicture->setPicture($picture)->setProduct($product)->setPosition($i);
                $this->entityManager->persist($productPicture);
                $i++;
            }

            $this->entityManager->persist($product);
            $this->entityManager->flush();

            return $this->redirectToRoute('admin_product_index');
        }

        return $this->render('admin/product/new_show_edit.html.twig', [
            'product' => $product,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="product_show", methods={"GET"})
     */
    public function show(Product $product): Response
    {
        return $this->render('admin/product/new_show_edit.html.twig', [
            'product' => $product
        ]);
    }

    /**
     * @Route("/{id}/edit", name="product_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Product $product): Response
    {
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if (!$this->worker) {
                return $this->redirectToRoute('admin_product_index');
            }
            $product->setUpdatedBy($this->worker);
            $this->entityManager->flush();

            return $this->redirectToRoute('admin_product_index');
        }

        return $this->render('admin/product/new_show_edit.html.twig', [
            'product' => $product,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="product_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Product $product): Response
    {
        if ($this->isCsrfTokenValid('delete'.$product->getId(), $request->request->get('_token'))) {

            if (!$this->worker) {
                return $this->redirectToRoute('admin_product_index');
            }
            $product->setDeletedBy($this->worker);
            $product->setDeletedAt(new \DateTime("now"));
            $this->entityManager->flush();
        }

        return $this->redirectToRoute('admin_product_index');
    }


}
