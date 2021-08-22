<?php

namespace App\Repository;

use App\Entity\Purchase;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Purchase|null find($id, $lockMode = null, $lockVersion = null)
 * @method Purchase|null findOneBy(array $criteria, array $orderBy = null)
 * @method Purchase[]    findAll()
 * @method Purchase[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PurchaseRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Purchase::class);
    }

    public function findPreviousNotValidatedPurchases() 
    {
        $query = $this->createQueryBuilder('p')
            ->select('p')
        ;
        $query = $query
            ->andWhere('p.status = :status')
            ->andWhere('p.canceledAt IS NULL')
            ->orderBy('p.createdAt', 'DESC')
            ->setParameter('status', 1)
        ;

        return $query->getQuery()->getResult();
    }
}
