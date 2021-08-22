<?php

namespace App\Repository;

use App\Entity\ServicePicture;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ServicePicture|null find($id, $lockMode = null, $lockVersion = null)
 * @method ServicePicture|null findOneBy(array $criteria, array $orderBy = null)
 * @method ServicePicture[]    findAll()
 * @method ServicePicture[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ServicePictureRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ServicePicture::class);
    }
}
