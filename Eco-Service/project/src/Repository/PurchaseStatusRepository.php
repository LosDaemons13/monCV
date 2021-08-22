<?php

namespace App\Repository;

use App\Entity\PurchaseStatus;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PurchaseStatus|null find($id, $lockMode = null, $lockVersion = null)
 * @method PurchaseStatus|null findOneBy(array $criteria, array $orderBy = null)
 * @method PurchaseStatus[]    findAll()
 * @method PurchaseStatus[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PurchaseStatusRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PurchaseStatus::class);
    }
}
