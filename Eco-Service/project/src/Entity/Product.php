<?php

// src/Entity/Product.php
namespace App\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Doctrine\ORM\Mapping\PrePersist;
use Doctrine\ORM\Mapping\PreUpdate;
use App\Repository\ProductRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Uid\Uuid;
use Symfony\Bridge\Doctrine\IdGenerator\UuidV4Generator;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Table(name="PRODUCT")
 * @ORM\Entity(repositoryClass=ProductRepository::class)
 * @HasLifecycleCallbacks
 */
class Product
{
	/**
     * @ORM\Id
     * @ORM\Column(type="string", unique=true)
     * @ORM\GeneratedValue(strategy="CUSTOM")
     * @ORM\CustomIdGenerator(class=UuidV4Generator::class)
     */
    private $id;
    
    /**
     * @ORM\Column(type="string", length=128)
     */
    private $label;

    /**
     * @ORM\Column(type="text", length=65535)
     */
    private $description;

	/**
     * @ORM\Column(type="float")
     */
    private $price;

	/**
     * @ORM\Column(type="integer")
     */
    private $stock;

	/**
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

	/**
     * @ORM\ManyToOne(targetEntity="App\Entity\Worker", inversedBy="productsCreatedBy")
     * @ORM\JoinColumn(name="created_by_id", referencedColumnName="user_id")
     */
    private $createdBy;

	/**
     * @ORM\Column(type="datetime")
     */
    private $updatedAt;

	/**
     * @ORM\ManyToOne(targetEntity="App\Entity\Worker", inversedBy="productsUpdatedBy")
     * @ORM\JoinColumn(name="updated_by_id", referencedColumnName="user_id", nullable=true)
     */
    private $updatedBy;

	/**
     * @ORM\Column(type="datetime")
     */
    private $deletedAt;

	/**
     * @ORM\ManyToOne(targetEntity="App\Entity\Worker", inversedBy="productsDeletedBy")
     * @ORM\JoinColumn(name="deleted_by_id", referencedColumnName="user_id", nullable=true)
     */
    private $deletedBy;
    
    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Category")
     * @ORM\JoinTable(name="PRODUCT_CATEGORY",
     *      joinColumns={@ORM\JoinColumn(name="product_id", referencedColumnName="id", onDelete="CASCADE")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="category_id", referencedColumnName="id", onDelete="CASCADE")}
     * )
     */
    private $productCategories;
    
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ProductPicture", mappedBy="product")
     */
    private $productPictures;
    
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\PurchaseProduct", mappedBy="product")
     */
    private $purchasesProduct;

    public function __construct()
    {
        $this->productCategories = new ArrayCollection();
        $this->productPictures = new ArrayCollection();
        $this->purchasesProduct = new ArrayCollection();
    }

    /** 
     * @PrePersist 
     */
    public function onPrePersist()
    {
        $this->createdAt = new \DateTime("now");
    }

    /** 
     * @PreUpdate
     */
    public function onPreUpdate()
    {
        $this->updatedAt = new \DateTime("now");
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

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getStock(): ?int
    {
        return $this->stock;
    }

    public function setStock(int $stock): self
    {
        $this->stock = $stock;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }
    
    public function getCreatedBy(): ?Worker
    {
        return $this->createdBy;
    }

    public function setCreatedBy(?Worker $createdBy): self
    {
        $this->createdBy = $createdBy;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }
    
    public function getUpdatedBy(): ?Worker
    {
        return $this->updatedBy;
    }

    public function setUpdatedBy(?Worker $updatedBy): self
    {
        $this->updatedBy = $updatedBy;

        return $this;
    }

    public function getDeletedAt(): ?\DateTimeInterface
    {
        return $this->deletedAt;
    }

    public function setDeletedAt(?\DateTimeInterface $deletedAt): self
    {
        $this->deletedAt = $deletedAt;

        return $this;
    }

    public function getDeletedBy(): ?Worker
    {
        return $this->deletedBy;
    }

    public function setDeletedBy(?Worker $deletedBy): self
    {
        $this->deletedBy = $deletedBy;

        return $this;
    }
    
    public function getProductCategories(): Collection
    {
        return $this->productCategories;
    }
    
    public function addProductCategory(Category $category): self
    {
        if (!$this->productCategories->contains($category)) {
            $this->productCategories[] = $category;
        }

        return $this;
    }

    public function removeProductCategory(Category $category): self
    {
        $this->productCategories->removeElement($category);

        return $this;
    }
    
    public function getProductPictures(): Collection
    {
        return $this->productPictures;
    }
    
    public function addProductPicture(ProductPicture $productPicture): self
    {
        if (!$this->productPictures->contains($productPicture)) {
            $this->productPictures[] = $productPicture;
        }

        return $this;
    }

    public function removeProductPicture(ProductPicture $productPicture): self
    {
        $this->productPictures->removeElement($productPicture);

        return $this;
    }
    
    public function getPurchasesProduct(): Collection
    {
        return $this->purchasesProduct;
    }
    
    public function addPurchaseProduct(PurchaseProduct $purchaseProduct): self
    {
        if (!$this->purchasesProduct->contains($purchaseProduct)) {
            $this->purchasesProduct[] = $purchaseProduct;
        }

        return $this;
    }

    public function removePurchaseProduct(PurchaseProduct $purchaseProduct): self
    {
        $this->purchasesProduct->removeElement($purchaseProduct);

        return $this;
    }
}
