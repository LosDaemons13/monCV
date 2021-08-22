<?php

// src/Entity/Purchase.php
namespace App\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Doctrine\ORM\Mapping\PrePersist;
use App\Repository\PurchaseRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Uid\Uuid;
use Symfony\Bridge\Doctrine\IdGenerator\UuidV4Generator;

/**
 * @ORM\Table(name="PURCHASE")
 * @ORM\Entity(repositoryClass=PurchaseRepository::class)
 * @HasLifecycleCallbacks
 */
class Purchase
{
    /**
     * @ORM\Id
     * @ORM\Column(type="string", unique=true)
     * @ORM\GeneratedValue(strategy="CUSTOM")
     * @ORM\CustomIdGenerator(class=UuidV4Generator::class)
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Customer", inversedBy="purchases")
     * @ORM\JoinColumn(name="customer_id", referencedColumnName="user_id")
     */
    private $customer;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\PurchaseStatus", inversedBy="purchases")
     * @ORM\JoinColumn(name="status_id", referencedColumnName="id")
     */
    private $status;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Address", inversedBy="purchases")
     * @ORM\JoinColumn(name="address_id", referencedColumnName="id")
     */
    private $address;

    /**
     * @ORM\Column(type="string", name="stripe_session_id", length=255)
     */
    private $stripeSessionId;

    /**
     * @ORM\Column(type="datetime", name="created_at")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="datetime", name="canceled_at", nullable=true)
     */
    private $canceledAt;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\PurchaseProduct", mappedBy="purchase", cascade={"remove"})
     */
    private $purchaseProducts;

    public function __construct()
    {
        $this->purchaseProducts = new ArrayCollection();
    }

    /** 
     * @PrePersist 
     */
    public function onPrePersist()
    {
        $this->createdAt = new \DateTime("now");
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    public function getStripeSesssionId(): ?string
    {
        return $this->stripeSessionId;
    }

    public function setStripeSessionId(string $stripeSessionId): self
    {
        $this->stripeSessionId = $stripeSessionId;

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

    public function getCanceledAt(): ?\DateTimeInterface
    {
        return $this->canceledAt;
    }

    public function setCanceledAt(?\DateTimeInterface $canceledAt): self
    {
        $this->canceledAt = $canceledAt;

        return $this;
    }

    public function getCustomer(): ?Customer
    {
        return $this->customer;
    }

    public function setCustomer(?Customer $customer): self
    {
        $this->customer = $customer;

        return $this;
    }

    public function getStatus(): ?PurchaseStatus
    {
        return $this->status;
    }

    public function setStatus(?PurchaseStatus $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function getAddress(): ?Address
    {
        return $this->address;
    }

    public function setAddress(?Address $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getPurchaseProducts(): Collection
    {
        return $this->purchaseProducts;
    }
    
    public function addPurchaseProduct(PurchaseProduct $purchaseProduct): self
    {
        if (!$this->purchaseProducts->contains($purchaseProduct)) {
            $this->purchaseProducts[] = $purchaseProduct;
        }

        return $this;
    }

    public function removePurchaseProduct(PurchaseProduct $purchaseProduct): self
    {
        $this->purchaseProducts->removeElement($purchaseProduct);

        return $this;
    }

}
