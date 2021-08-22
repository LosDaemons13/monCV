<?php

// src/Entity/Service.php
namespace App\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Doctrine\ORM\Mapping\PrePersist;
use Doctrine\ORM\Mapping\PreUpdate;
use App\Repository\ServiceRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Uid\Uuid;
use Symfony\Bridge\Doctrine\IdGenerator\UuidV4Generator;

/**
 * @ORM\Table(name="SERVICE")
 * @ORM\Entity(repositoryClass=ServiceRepository::class)
 * @HasLifecycleCallbacks
 */
class Service
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
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

	/**
     * @ORM\ManyToOne(targetEntity="App\Entity\Worker", inversedBy="servicesCreatedBy")
     * @ORM\JoinColumn(name="created_by_id", referencedColumnName="user_id")
     */
    private $createdBy;

	/**
     * @ORM\Column(type="datetime")
     */
    private $updatedAt;

	/**
     * @ORM\ManyToOne(targetEntity="App\Entity\Worker", inversedBy="servicesUpdatedBy")
     * @ORM\JoinColumn(name="updated_by_id", referencedColumnName="user_id")
     */
    private $updatedBy;

	/**
     * @ORM\Column(type="datetime")
     */
    private $deletedAt;

	/**
     * @ORM\ManyToOne(targetEntity="App\Entity\Worker", inversedBy="servicesDeletedBy")
     * @ORM\JoinColumn(name="deleted_by_id", referencedColumnName="user_id")
     */
    private $deletedBy;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Request", mappedBy="service")
     */
    private $requests;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ServicePicture", mappedBy="service")
     */
    private $servicePictures;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->servicePictures = new ArrayCollection();
        $this->requests = new ArrayCollection();
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
    
    public function __toString()
    {
        return $this->label;
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

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

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

    public function getCreatedBy(): ?Worker
    {
        return $this->createdBy;
    }

    public function setCreatedBy(?Worker $createdBy): self
    {
        $this->createdBy = $createdBy;

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

    public function getDeletedBy(): ?Worker
    {
        return $this->deletedBy;
    }

    public function setDeletedBy(?Worker $deletedBy): self
    {
        $this->deletedBy = $deletedBy;

        return $this;
    }

    public function getServicePictures(): Collection
    {
        return $this->servicePictures;
    }
    
    public function addServicePicture(ServicePicture $servicePicture): self
    {
        if (!$this->servicePictures->contains($servicePicture)) {
            $this->servicePictures[] = $servicePicture;
        }

        return $this;
    }

    public function removeServicePicture(ServicePicture $servicePicture): self
    {
        $this->servicePictures->removeElement($servicePicture);

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
