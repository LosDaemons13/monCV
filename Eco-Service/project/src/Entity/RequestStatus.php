<?php

// src/Entity/RequestStatus.php
namespace App\Entity;

use App\Repository\RequestStatusRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Uid\Uuid;
use Symfony\Bridge\Doctrine\IdGenerator\UuidV4Generator;

/**
 * @ORM\Table(name="REQUEST_STATUS")
 * @ORM\Entity(repositoryClass=RequestStatusRepository::class)
 */
class RequestStatus
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
     * @ORM\OneToMany(targetEntity="App\Entity\Request", mappedBy="status")
     */
    private $requests;

    public function __construct()
    {
        $this->requests = new ArrayCollection();
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
