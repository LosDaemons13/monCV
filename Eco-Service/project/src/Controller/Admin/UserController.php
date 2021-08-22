<?php

namespace App\Controller\Admin;

use App\Classe\UserManager;
use App\Entity\User;
use App\Entity\Worker;
use App\Form\UserType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

/**
 * @Route("/user")
 */
class UserController extends AbstractController
{
    private $entityManager;

    private $worker;

    public function __construct(EntityManagerInterface $entityManager, Security $security){
        $this->entityManager = $entityManager;
        $this->worker = $entityManager->getRepository(Worker::class)->find($security->getUser());
    }

    /**
     * @Route("/", name="user_index", methods={"GET"})
     */
    public function index(): Response
    {
        return $this->render('admin/user/index.html.twig');
    }

    /**
     * @Route("/get-all-users", name="user_get_all_users", methods={"GET","POST"})
     * @param Request $request
     * @return Response
     */
    public function getAllUsers(Request $request): Response
    {
        $data = [];

        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();

            $query = $em->createQuery(
                '
                SELECT U.id, U.firstname, U.lastname, U.birthdate, U.email, U.phone, U.roles, U.createdAt 
                FROM App\Entity\User U
                WHERE U.deletedAt IS NULL
                ORDER BY U.lastname ASC
                '
            );
            $data = $query->getArrayResult();

            foreach($data as $k => $v){
                $data[$k]['createdAt'] = $v['createdAt']->format('Y-m-d H:i:s');
                $data[$k]['birthdate'] = $v['birthdate']->format('Y-m-d H:i:s');

                if(in_array("ROLE_SUPERADMIN", $v['roles'])){
                    $data[$k]['roles'] = 'SUPERADMIN';
                }

                //Actions button (view, edit, delete)
                $data[$k]['actions'] = '<a data-toggle="tooltip" title="Voir" class="text-dark" href="/admin/user/'.$v['id'].'"><i class="fas fa-eye mr-2"></i></a>';
                $data[$k]['actions'] .= '<a data-toggle="tooltip" title="Éditer" class="text-dark" href="/admin/user/'.$v['id'].'/edit"><i class="fas fa-pen mr-2"></i></a>';
            }
        }

        $result = [
            'data' => $data
        ];
        return new JsonResponse($result);
    }

    /**
     * @Route("/new-worker", name="user_new_worker", methods={"GET","POST"})
     */
    public function newWorker(Request $request, UserManager $userManager): Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $userManager->new($user, $form, 'worker');
            return $this->redirectToRoute('admin_user_index');
        }

        return $this->render('admin/user/new_show_edit.html.twig', [
            'user' => $user,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/{id}", name="user_show", methods={"GET"})
     */
    public function show(User $user): Response
    {
        return $this->render('admin/user/new_show_edit.html.twig', [
            'user' => $user,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="user_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, User $user): Response
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->entityManager->flush();

            return $this->redirectToRoute('admin_user_index');
        }

        return $this->render('admin/user/new_show_edit.html.twig', [
            'user' => $user,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}/edit-password", name="user_edit_password", methods={"GET","POST"})
     */
    public function editPassword(Request $request, User $user): Response
    {
        echo 'edit password';die;
    }

    /**
     * @Route("/{id}", name="user_delete", methods={"DELETE"})
     */
    public function delete(Request $request, User $user): Response
    {
        if ($this->isCsrfTokenValid('delete'.$user->getId(), $request->request->get('_token'))) {
            
            if (!$this->worker) {
                return $this->redirectToRoute('admin_product_index');
            }
            $user->setDeletedBy($this->worker);
            $user->setDeletedAt(new \DateTime("now"));
            $this->entityManager->flush();
        }

        return $this->redirectToRoute('admin_user_index');
    }
}
