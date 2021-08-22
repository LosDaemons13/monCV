<?php

// src/Entity/Address.php
namespace App\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Doctrine\ORM\Mapping\PrePersist;
use Doctrine\ORM\Mapping\PreUpdate;
use App\Repository\AddressRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Uid\Uuid;
use Symfony\Bridge\Doctrine\IdGenerator\UuidV4Generator;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Table(name="ADDRESS")
 * @ORM\Entity(repositoryClass=AddressRepository::class)
 * @HasLifecycleCallbacks
 */
class Address
{
    /**
     * @ORM\Id
     * @ORM\Column(type="string", unique=true)
     * @ORM\GeneratedValue(strategy="CUSTOM")
     * @ORM\CustomIdGenerator(class=UuidV4Generator::class)
     */
    private $id;
    
    /**
     * @ORM\Column(type="string", length=32)
     */
    private $label;
    
    /**
     * @ORM\Column(type="string", length=32)
     */
    private $firstname;
    
    /**
     * @ORM\Column(type="string", length=32)
     */
    private $lastname;
    
    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Country", inversedBy="addresses")
     * @ORM\JoinColumn(name="country_id", referencedColumnName="id")
     */
    private $country;
    
    /**
     * @ORM\Column(type="string", length=64)
     */
    private $city;
    
    /**
     * @ORM\Column(type="string", length=16, name="postal_code")
     */
    private $postalCode;
    
    /**
     * @ORM\Column(type="string", length=255)
     */
    private $street;
    
    /**
     * @ORM\Column(type="integer", name="street_number")
     */
    private $streetNumber;
    
    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $tips;
    
    /**
     * @ORM\Column(type="datetime", name="created_at")
     */
    private $createdAt;
    
    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Customer", inversedBy="addresses")
     * @ORM\JoinColumn(name="created_by_id", referencedColumnName="user_id")
     */
    private $createdBy;
    
    /**
     * @ORM\Column(type="datetime", nullable=true, name="updated_at")
     */
    private $updatedAt;
    
    /**
     * @ORM\Column(type="datetime", nullable=true, name="deleted_at")
     */
    private $deletedAt;
    
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Purchase", mappedBy="address")
     */
    private $purchases;
    
    public function __construct()
    {
        $this->purchases = new ArrayCollection();
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

    public function __toString() 
    {
        return $this->getLabel().' - '.$this->getStreetNumber().' '.$this->getStreet().' - '.$this->getCity();
    }
    
    public function getId(): ?string
    {
        return $this->id;
    }
    
    public function getLabel(): ?string
    {
        return $this->label;
    }
    
    public function setLabel(?string $label): self
    {
        $this->label = $label;

        return $this;
    }
    
    public function getFirstname(): ?string
    {
        return $this->firstname;
    }
    
    public function setFirstname(?string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }
    
    public function getLastname(): ?string
    {
        return $this->lastname;
    }
    
    public function setLastname(?string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }
    
    public function getCountry(): ?Country
    {
        return $this->country;
    }

    public function setCountry(?Country $country): self
    {
        $this->country = $country;

        return $this;
    }
    
    public function getCity(): ?string
    {
        return $this->city;
    }
    
    public function setCity(?string $city): self
    {
        $this->city = $city;

        return $this;
    }
    
    public function getPostalCode(): ?string
    {
        return $this->postalCode;
    }
    
    public function setPostalCode(?string $postalCode): self
    {
        $this->postalCode = $postalCode;

        return $this;
    }
    
    public function getStreet(): ?string
    {
        return $this->street;
    }
    
    public function setStreet(?string $street): self
    {
        $this->street = $street;

        return $this;
    }
    
    public function getStreetNumber(): ?int
    {
        return $this->streetNumber;
    }
    
    public function setStreetNumber(?int $streetNumber): self
    {
        $this->streetNumber = $streetNumber;

        return $this;
    }
    
    public function getTips(): ?string
    {
        return $this->tips;
    }
    
    public function setTips(?string $tips): self
    {
        $this->tips = $tips;

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
    
    public function getCreatedBy(): ?Customer
    {
        return $this->createdBy;
    }

    public function setCreatedBy(?Customer $customer): self
    {
        $this->createdBy = $customer;

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

    public function getDeletedAt(): ?\DateTimeInterface
    {
        return $this->deletedAt;
    }

    public function setDeletedAt(?\DateTimeInterface $deletedAt): self
    {
        $this->deletedAt = $deletedAt;

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
