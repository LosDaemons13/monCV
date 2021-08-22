<?php
 
namespace App\Controller;

use App\Security\Recaptcha;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;
 
class ContactController extends AbstractController
{
    /**
     * @Route("/contact", name="app_contact")
     */
    public function index(): Response
    {
        return $this->render('contact/index.html.twig', [
            'msg_state' => 'none'
        ]);
    }

    /**
     * @Route("/send_mail", name="send_mail")
     * @param Request $request
     * @param MailerInterface $mailer
     * @param Recaptcha $recaptcha
     * @return JsonResponse
     * @throws TransportExceptionInterface
     */
    public function send_mail(Request $request, MailerInterface $mailer, Recaptcha $recaptcha): JsonResponse
    {
        if (!$recaptcha->validate($request->get("g-recaptcha-response"))) {
            return new JsonResponse("Votre message n'a pas pu être envoyé, apparemment vous êtes un robot. Bip bop..");
        }

        $form_name = $request->get("form_name");
        $form_email = $request->get("form_email");
        $form_phone = $request->get("form_phone");
        $form_subject = $request->get("form_subject");
        $form_message = $request->get("form_message");

        if($form_subject != null) $form_message = $form_subject.'. '.$form_message;
        if($form_phone != null) $form_message .= '. '.$form_phone;

        $email = (new Email())
            ->from($form_email)
            ->to('contact@eco-service.pac.center')
            ->subject('Message de la part de '.$form_name)
            ->text($form_message);
        $mailer->send($email);

        return new JsonResponse("Votre message a bien été envoyé !");
    }
}
