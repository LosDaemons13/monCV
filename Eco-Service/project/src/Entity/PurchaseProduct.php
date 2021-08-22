<?php

// src/Entity/PurchaseProduct.php
namespace App\Entity;

use App\Repository\PurchaseProductRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Table(name="PURCHASE_PRODUCT")
 * @ORM\Entity(repositoryClass=PurchaseProductRepository::class)
 */
class PurchaseProduct
{
    /**
     * @ORM\Id
     * @ORM\ManyToOne(targetEntity="App\Entity\Purchase", inversedBy="purchaseProducts")
     * @ORM\JoinColumn(name="purchase_id", referencedColumnName="id")
     */
    private $purchase;

	/**
	 * @ORM\Id
     * @ORM\ManyToOne(targetEntity="App\Entity\Product", inversedBy="purchasesProduct")
     * @ORM\JoinColumn(name="product_id", referencedColumnName="id")
     */
    private $product;
    
    /**
     * @ORM\Column(type="integer", length=3)
     */
    private $quantity;
    
    
    public function getProduct(): ?Product
    {
        return $this->product;
    }

    public function setProduct(?Product $product): self
    {
        $this->product = $product;

        return $this;
    }
    
    public function getPurchase(): ?Purchase
    {
        return $this->purchase;
    }

    public function setPurchase(?Purchase $purchase): self
    {
        $this->purchase = $purchase;

        return $this;
    }

    public function getQuantity(): ?int
    {
        return $this->quantity;
    }

    public function setQuantity(int $quantity): self
    {
        $this->quantity = $quantity;

        return $this;
    }
}
