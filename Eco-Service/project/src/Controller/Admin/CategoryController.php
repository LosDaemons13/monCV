<?php

namespace App\Controller\Admin;

use App\Entity\Category;
use App\Form\CategoryType;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;


/**
 * @Route("/category")
 */
class CategoryController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager){
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/", name="category_index", methods={"GET"})
     */
    public function index(CategoryRepository $categoryRepository): Response
    {
        return $this->render('admin/category/index.html.twig');
    }

            /**
     * @Route("/get-all-categorys", name="category_get_all_categorys", methods={"GET","POST"})
     * @param Request $request
     * @return Response
     */
    public function getAllcategorys(Request $request): Response
    {
        $data = [];

        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();

            $query = $em->createQuery(
                '
                SELECT C.id, C.label, C.description, C.icon
                FROM App\Entity\Category C
                ORDER BY C.label ASC
                '
            );
            $data = $query->getArrayResult();

            foreach($data as $k => $v){


                //Actions button (view, edit, delete)
                $data[$k]['actions'] = '<a data-toggle="tooltip" title="Voir" class="text-dark" href="/admin/category/'.$v['id'].'"><i class="fas fa-eye mr-2"></i></a>';
                $data[$k]['actions'] .= '<a data-toggle="tooltip" title="Éditer" class="text-dark" href="/admin/category/'.$v['id'].'/edit"><i class="fas fa-pen mr-2"></i></a>';
            }
        }

        $result = [
            'data' => $data
        ];
        return new JsonResponse($result);
    }
    /**
     * @Route("/new", name="category_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $category = new Category();
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->entityManager->persist($category);
            $this->entityManager->flush();

            return $this->redirectToRoute('admin_category_index');
        }

        return $this->render('admin/category/new_show_edit.html.twig', [
            'category' => $category,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="category_show", methods={"GET"})
     */
    public function show(Category $category): Response
    {
        return $this->render('admin/category/new_show_edit.html.twig', [
            'category' => $category,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="category_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Category $category): Response
    {
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->entityManager->flush();

            return $this->redirectToRoute('admin_category_index');
        }

        return $this->render('admin/category/new_show_edit.html.twig', [
            'category' => $category,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="category_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Category $category): Response
    {
        if ($this->isCsrfTokenValid('delete'.$category->getId(), $request->request->get('_token'))) {
            $this->entityManager->remove($category);
            $this->entityManager->flush();
        }

        return $this->redirectToRoute('admin_category_index');
    }
}
