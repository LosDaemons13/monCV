<?php

namespace App\Controller\Individual;

use App\Classe\Search;
use App\Entity\Category;
use App\Entity\Product;
use App\Form\SearchType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager){
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/products/{category_id}", name="products")
     * @param $category_id
     * @param Request $request
     * @return Response
     */
    public function index(Request $request, $category_id): Response
    {
        $search = new Search();
        $form = $this->createForm(SearchType::class, $search);

        $form->handleRequest($request);

        if ($form->isSubmitted() and $form->isValid())
            $products = $this->entityManager->getRepository(Product::class)->findWithSearch($search);
        else
            $products = $this->entityManager->getRepository(Product::class)->findAll();

        if(strlen($category_id) === 36){
            $sorted_products = [];
            foreach($products as $product_index => $product){
                foreach($product->getProductCategories() as $category){
                    if($category->getId() == $category_id){
                        $sorted_products[] = $products[$product_index];
                        break;
                    }
                }
            }
            $products = $sorted_products;
        }

        return $this->render('individual/product/index.html.twig', [
            'products' => $products,
            'form' => $form->createView(),
            'categories' => $this->entityManager->getRepository(Category::class)->findAll(),
            'category_id' => $category_id
        ]);
    }

    /**
     * @Route("/product/{id}", name="product")
     * @param $id
     * @return Response
     */
    public function show($id): Response
    {
        $search = new Search();
        $form = $this->createForm(SearchType::class, $search);

        $product = $this->entityManager->getRepository(Product::class)->find($id);
        $categories = $this->entityManager->getRepository(Category::class)->findAll();
        if (!$product) {
            return $this->redirectToRoute('individual_products');
        }
        return $this->render('individual/product/show.html.twig', [
            'product' => $product,
            'categories' => $categories,
            'form' => $form->createView()
        ]);
    }
}