<?php

namespace App\Classe;

use App\Entity\Customer;
use App\Entity\User;
use App\Entity\Worker;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Form;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserManager
{
    private $entityManager;
    private $encoder;

    public function __construct(EntityManagerInterface $entityManager, UserPasswordEncoderInterface $encoder){
        $this->entityManager = $entityManager;
        $this->encoder = $encoder;
    }

    public function new(User $user, Form $form, $userType = 'customer') {
        if (!empty($this->entityManager->getRepository(User::class)->findBy(['email' => $form['email']->getData(), 'deletedAt' => null]))) {
            return false;
        }

        $password = $this->encoder->encodePassword($user, $form->get('password')->getData());
        $user->setPassword($password);

        switch ($userType) {
            case 'customer':
                $customer = new Customer();
                if (!empty($form['company_name']->getData()) 
                    AND !empty($form['company_siret']->getData())) {
                    $customer->setCompanyName($form['company_name']->getData());
                    $customer->setCompanySiret($form['company_siret']->getData());
                }
                $user->setRoles(["ROLE_CUSTOMER"]);
                $customer->setUser($user);
                $user->addCustomer($customer);
            break;
            case 'worker': 
                $user->setRoles([$form->get('roles')->getData()]);
                $worker = new Worker();
                $worker->setUser($user);
                $customer = new Customer();
                $customer->setEmailVerified(true);
                $customer->setUser($user);
                $user->addWorker($worker);
                $user->addCustomer($customer);
            break;
            default: 
                return;
        }

        $this->entityManager->persist($user);
        $this->entityManager->flush();

        return true;
    }
}