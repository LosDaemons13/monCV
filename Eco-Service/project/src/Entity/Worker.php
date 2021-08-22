<?php

// src/Entity/Worker.php
namespace App\Entity;

use App\Repository\WorkerRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Table(name="WORKER")
 * @ORM\Entity(repositoryClass=WorkerRepository::class)
 */
class Worker
{
    /**
     * @ORM\Id
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="workers")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    private $user;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\User", mappedBy="deletedBy")
     */
    private $users;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Product", mappedBy="createdBy")
     */
    private $productsCreatedBy;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Product", mappedBy="updatedBy")
     */
    private $productsUpdatedBy;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Product", mappedBy="deletedBy")
     */
    private $productsDeletedBy;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Service", mappedBy="createdBy")
     */
    private $servicesCreatedBy;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Service", mappedBy="updatedBy")
     */
    private $servicesUpdatedBy;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Service", mappedBy="deletedBy")
     */
    private $servicesDeletedBy;

    public function __construct()
    {
        $this->users = new ArrayCollection();
        $this->productsCreatedBy = new ArrayCollection();
        $this->productsUpdatedBy = new ArrayCollection();
        $this->productsDeletedBy = new ArrayCollection();
        $this->servicesCreatedBy = new ArrayCollection();
        $this->servicesUpdatedBy = new ArrayCollection();
        $this->servicesDeletedBy = new ArrayCollection();
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(User $user): ?User
    {
        return $this->user = $user;
    }

    public function getUsers(): Collection
    {
        return $this->users;
    }

    public function addUser(User $user): self
    {
        if (!$this->users->contains($user)) {
            $this->users[] = $user;
        }

        return $this;
    }

    public function removeUser(User $user): self
    {
        $this->users->removeElement($user);

        return $this;
    }

    public function getProductsCreatedBy(): Collection
    {
        return $this->productsCreatedBy;
    }

    public function addProductCreatedBy(Product $product): self
    {
        if (!$this->productsCreatedBy->contains($product)) {
            $this->productsCreatedBy[] = $product;
        }

        return $this;
    }

    public function removeProductCreatedBy(Product $product): self
    {
        $this->productsCreatedBy->removeElement($product);

        return $this;
    }

    public function getProductsUpdatedBy(): Collection
    {
        return $this->productsUpdatedBy;
    }

    public function addProductUpdatedBy(Product $product): self
    {
        if (!$this->productsUpdatedBy->contains($product)) {
            $this->productsUpdatedBy[] = $product;
        }

        return $this;
    }

    public function removeProductUpdatedBy(Product $product): self
    {
        $this->productsUpdatedBy->removeElement($product);

        return $this;
    }

    public function getProductsDeletedBy(): Collection
    {
        return $this->productsDeletedBy;
    }

    public function addProductDeletedBy(Product $product): self
    {
        if (!$this->productsDeletedBy->contains($product)) {
            $this->productsDeletedBy[] = $product;
        }

        return $this;
    }

    public function removeProductDeletedBy(Product $product): self
    {
        $this->productsDeletedBy->removeElement($product);

        return $this;
    }

    public function getServicesCreatedBy(): Collection
    {
        return $this->servicesCreatedBy;
    }

    public function addServiceCreatedBy(Service $service): self
    {
        if (!$this->servicesCreatedBy->contains($service)) {
            $this->servicesCreatedBy[] = $service;
        }

        return $this;
    }

    public function removeServiceCreatedBy(Service $service): self
    {
        $this->servicesCreatedBy->removeElement($service);

        return $this;
    }

    public function getServicesUpdatedBy(): Collection
    {
        return $this->servicesUpdatedBy;
    }

    public function addServiceUpdatedBy(Service $service): self
    {
        if (!$this->servicesUpdatedBy->contains($service)) {
            $this->servicesUpdatedBy[] = $service;
        }

        return $this;
    }

    public function removeServiceUpdatedBy(Service $service): self
    {
        $this->servicesUpdatedBy->removeElement($service);

        return $this;
    }

    public function getServicesDeletedBy(): Collection
    {
        return $this->servicesDeletedBy;
    }

    public function addServiceDeletedBy(Service $service): self
    {
        if (!$this->servicesDeletedBy->contains($service)) {
            $this->servicesDeletedBy[] = $service;
        }

        return $this;
    }

    public function removeServiceDeletedBy(Service $service): self
    {
        $this->servicesDeletedBy->removeElement($service);

        return $this;
    }
}