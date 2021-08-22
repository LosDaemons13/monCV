<?php

namespace App\Security;

use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Flash\FlashBagInterface;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Symfony\Component\Security\Http\Authorization\AccessDeniedHandlerInterface;
use Symfony\Component\Security\Http\Util\TargetPathTrait;

class AccessDeniedHandler implements AccessDeniedHandlerInterface
{
    private $flashBagInterface;

    public function __construct(FlashBagInterface $flashBagInterface)
    {
        $this->flashBagInterface = $flashBagInterface;
    }

    public function handle(Request $request, AccessDeniedException $accessDeniedException)
    {
        $this->flashBagInterface->add('error', 'Vous ne pouvez pas accéder à cet emplacement');
        return new RedirectResponse('/');
    }
}