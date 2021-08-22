<?php

namespace App\Repository;

use App\Entity\RequestStatus;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method RequestStatus|null find($id, $lockMode = null, $lockVersion = null)
 * @method RequestStatus|null findOneBy(array $criteria, array $orderBy = null)
 * @method RequestStatus[]    findAll()
 * @method RequestStatus[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RequestStatusRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, RequestStatus::class);
    }
}
