<?php

namespace App\Classe;

use App\Entity\Picture;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class File
{
    private $entityManager;
    private $params;

    public function __construct(EntityManagerInterface $entityManager, ParameterBagInterface $params){
        $this->entityManager = $entityManager;
        $this->params = $params;
    }

    public function upload($image) {
        $picture = new Picture();
        $picture->setExtension($image->guessExtension());
        $picture->setSize($image->getSize());
        $this->entityManager->persist($picture);
        $this->entityManager->flush();

        // Move file in assets/uploads directory
        $image->move(
            $this->params->get('images_directory'),
            $picture->getId() . '.' . $picture->getExtension()
        );

        return $picture;
    }
}