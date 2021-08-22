<?php

// src/Entity/Customer.php
namespace App\Entity;

use App\Repository\CustomerRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Table(name="CUSTOMER")
 * @ORM\Entity(repositoryClass=CustomerRepository::class)
 */
class Customer
{
    /**
     * @ORM\Id
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="customers")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    private $user;

    /**
     * @ORM\Column(type="boolean", nullable=true, name="email_verified")
     */
    private $emailVerified;

    /**
     * @ORM\Column(type="string", length=128, nullable=true, name="company_name")
     */
    private $companyName;

    /**
     * @ORM\Column(type="string", length=14, nullable=true, name="company_siret")
     */
    private $companySiret;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Address", mappedBy="createdBy")
     */
    private $addresses;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Purchase", mappedBy="customer")
     */
    private $purchases;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Request", mappedBy="customer")
     */
    private $requests;

    public function __construct()
    {
        $this->addresses = new ArrayCollection();
        $this->purchases = new ArrayCollection();
        $this->requests = new ArrayCollection();
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(User $user): ?User
    {
        return $this->user = $user;
    }

    public function getEmailVerified(): ?bool
    {
        return $this->emailVerified;
    }

    public function setEmailVerified(?bool $emailVerified): self
    {
        $this->emailVerified = $emailVerified;

        return $this;
    }

    public function getCompanyName(): ?string
    {
        return $this->companyName;
    }

    public function setCompanyName(?string $companyName): self
    {
        $this->companyName = $companyName;

        return $this;
    }

    public function getCompanySiret(): ?string
    {
        return $this->companySiret;
    }

    public function setCompanySiret(?string $companySiret): self
    {
        $this->companySiret = $companySiret;

        return $this;
    }

    public function getAddresses(): Collection
    {
        return $this->addresses;
    }

    public function addAddress(Address $address): self
    {
        if (!$this->addresses->contains($address)) {
            $this->addresses[] = $address;
        }

        return $this;
    }

    public function removeAddress(Address $address): self
    {
        $this->addresses->removeElement($address);

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

    public function getRequests(): Collection
    {
        return $this->requests;
    }

    public function addRequest(Request $request): self
    {
        if (!$this->requests->contains($request)) {
            $this->requests[] = $request;
        }

        return $this;
    }

    public function removeRequest(Request $request): self
    {
        $this->requests->removeElement($request);

        return $this;
    }
}