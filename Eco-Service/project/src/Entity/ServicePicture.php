<?php

// src/Entity/ServicePicture.php
namespace App\Entity;

use App\Repository\ServicePictureRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Table(name="SERVICE_PICTURE")
 * @ORM\Entity(repositoryClass=ServicePictureRepository::class)
 */
class ServicePicture
{
    /**
     * @ORM\Id
     * @ORM\ManyToOne(targetEntity="App\Entity\Picture", cascade={"persist"}, inversedBy="servicesPicture")
     * @ORM\JoinColumn(name="picture_id", referencedColumnName="id")
     */
    private $picture;

	/**
	 * @ORM\Id
     * @ORM\ManyToOne(targetEntity="App\Entity\Service", cascade={"persist"}, inversedBy="servicePictures")
     * @ORM\JoinColumn(name="service_id", referencedColumnName="id")
     */
    private $service;

    /**
     * @ORM\Column(type="integer", length=2)
     */
    private $position;
    
    public function getPicture(): ?Picture
    {
        return $this->picture;
    }

    public function setPicture(?Picture $picture): self
    {
        $this->picture = $picture;

        return $this;
    }


    public function getService(): ?Service
    {
        return $this->service;
    }
    
    public function setService(?Service $service): self
    {
        $this->service = $service;

        return $this;
    }

    public function getPosition(): ?int
    {
        return $this->position;
    }

    public function setPosition(int $position): self
    {
        $this->position = $position;

        return $this;
    }
}
