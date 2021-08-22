<?php

// src/Entity/Category.php
namespace App\Entity;

use App\Repository\CategoryRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Uid\Uuid;
use Symfony\Bridge\Doctrine\IdGenerator\UuidV4Generator;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Table(name="CATEGORY")
 * @ORM\Entity(repositoryClass=CategoryRepository::class)
 */
class Category
{
	/**
     * @ORM\Id
     * @ORM\Column(type="string", unique=true)
     * @ORM\GeneratedValue(strategy="CUSTOM")
     * @ORM\CustomIdGenerator(class=UuidV4Generator::class)
     */
    private $id;
    
    /**
     * @ORM\Column(type="string", length=64)
     */
    private $label;

    /**
     * @ORM\Column(type="text", length=65535)
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=32)
     */
    private $icon;
    
    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Product")
     * @ORM\JoinTable(name="PRODUCT_CATEGORY",
     *      joinColumns={@ORM\JoinColumn(name="category_id", referencedColumnName="id", onDelete="CASCADE")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="product_id", referencedColumnName="id", onDelete="CASCADE")}
     * )
     */
    private $productsCategory;
    
    public function __construct()
    {
        $this->productsCategory = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->label;
    }
    
    public function getId(): ?string
    {
        return $this->id;
    }

    public function getLabel(): ?string
    {
        return $this->label;
    }

    public function setLabel(string $label): self
    {
        $this->label = $label;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getIcon(): ?string
    {
        return $this->icon;
    }

    public function setIcon(string $icon): self
    {
        $this->icon = $icon;

        return $this;
    }
    
    public function getProductsCategory(): Collection
    {
        return $this->productsCategory;
    }
    
    public function addProductCategory(Product $product): self
    {
        if (!$this->productsCategory->contains($product)) {
            $this->productsCategory[] = $product;
        }

        return $this;
    }

    public function removeProductCategory(Product $product): self
    {
        $this->productsCategory->removeElement($product);

        return $this;
    }
}
