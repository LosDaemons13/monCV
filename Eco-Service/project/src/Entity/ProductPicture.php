<?php

// src/Entity/ProductPicture.php
namespace App\Entity;

use App\Repository\ProductPictureRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Table(name="PRODUCT_PICTURE")
 * @ORM\Entity(repositoryClass=ProductPictureRepository::class)
 */
class ProductPicture
{
	/**
	 * @ORM\Id
     * @ORM\ManyToOne(targetEntity="App\Entity\Product", cascade={"persist"}, inversedBy="productPictures")
     * @ORM\JoinColumn(name="product_id", referencedColumnName="id")
     */
    private $product;

    /**
     * @ORM\Id
     * @ORM\ManyToOne(targetEntity="App\Entity\Picture", cascade={"persist"}, inversedBy="productsPicture")
     * @ORM\JoinColumn(name="picture_id", referencedColumnName="id")
     */
    private $picture;

    
    /**
     * @ORM\Column(type="integer", length=2)
     */
    private $position;
    
    
    public function getProduct(): ?Product
    {
        return $this->product;
    }
    
    public function setProduct(?Product $product): self
    {
        $this->product = $product;

        return $this;
    }

    public function getPicture(): ?Picture
    {
        return $this->picture;
    }

    public function setPicture(?Picture $picture): self
    {
        $this->picture = $picture;

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
