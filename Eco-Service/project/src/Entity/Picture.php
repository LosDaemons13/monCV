<?php

// src/Entity/Picture.php
namespace App\Entity;

use App\Repository\PictureRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Uid\Uuid;
use Symfony\Bridge\Doctrine\IdGenerator\UuidV4Generator;

/**
 * @ORM\Table(name="PICTURE")
 * @ORM\Entity(repositoryClass=PictureRepository::class)
 */
class Picture
{
    /**
     * @ORM\Id
     * @ORM\Column(type="string", unique=true)
     * @ORM\GeneratedValue(strategy="CUSTOM")
     * @ORM\CustomIdGenerator(class=UuidV4Generator::class)
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=8)
     */
    private $extension;

    /**
     * @ORM\Column(type="integer")
     */
    private $size;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ProductPicture", mappedBy="picture")
     */
    private $productsPicture;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ServicePicture", mappedBy="picture")
     */
    private $servicesPicture;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->productsPicture = new ArrayCollection();
        $this->servicesPicture = new ArrayCollection();
        
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    public function getExtension(): ?string
    {
        return $this->extension;
    }

    public function setExtension(string $extension): self
    {
        $this->extension = $extension;

        return $this;
    }

    public function getSize(): ?int
    {
        return $this->size;
    }

    public function setSize(int $size): self
    {
        $this->size = $size;

        return $this;
    }

    public function getProductsPicture(): Collection
    {
        return $this->productsPicture;
    }
    
    public function addProductPicture(ProductPicture $productPicture): self
    {
        if (!$this->productsPicture->contains($productPicture)) {
            $this->productsPicture[] = $productPicture;
        }

        return $this;
    }

    public function removeProductPicture(ProductPicture $productPicture): self
    {
        $this->productsPicture->removeElement($productPicture);

        return $this;
    }

    public function getServicesPicture(): Collection
    {
        return $this->servicesPicture;
    }
    
    public function addServicePicture(ServicePicture $servicePicture): self
    {
        if (!$this->servicesPicture->contains($servicePicture)) {
            $this->servicesPicture[] = $servicePicture;
        }

        return $this;
    }

    public function removeServicePicture(ServicePicture $servicePicture): self
    {
        $this->servicesPicture->removeElement($servicePicture);

        return $this;
    }
}
