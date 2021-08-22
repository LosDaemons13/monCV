<?php

// src/Entity/PurchaseStatus.php
namespace App\Entity;

use App\Repository\PurchaseStatusRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Uid\Uuid;
use Symfony\Bridge\Doctrine\IdGenerator\UuidV4Generator;

/**
 * @ORM\Table(name="PURCHASE_STATUS")
 * @ORM\Entity(repositoryClass=PurchaseStatusRepository::class)
 */
class PurchaseStatus
{
    /**
     * @ORM\Id
     * @ORM\Column(type="string", length=1)
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=16)
     */
    private $label;

    /**
     * @ORM\Column(type="string", length=6)
     */
    private $color;

    /**
     * @ORM\Column(type="string", length=32)
     */
    private $icon;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Purchase", mappedBy="status")
     */
    private $purchases;
    
    public function __construct()
    {
        $this->purchases = new ArrayCollection();
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

    public function getColor(): ?string
    {
        return $this->color;
    }

    public function setColor(string $color): self
    {
        $this->color = $color;

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

    public function getPurchases(): Collection
    {
        return $this->purchases;
    }
    
    public function addPurchase(Purchase $purchase): self
    {
        if (!$this->purchases->contains($purchase)) {
            $this->purchases[] = $purchase;
        }

        return $this;
    }

    public function removePurchase(Purchase $purchase): self
    {
        $this->purchases->removeElement($purchase);

        return $this;
    }
}
