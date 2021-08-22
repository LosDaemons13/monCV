<?php
     
     $subject = 'Confirmation de récéption';
     $message = '
     <html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Contact</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Lato:400,300,700,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
      <style type="text/css">
         a[x-apple-data-detectors] {color: inherit !important;}
      </style>
   </head>
   <body style="margin: 0; padding: 0;">
      <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
         <tr>
            <td style="padding: 20px 0 30px 0;">
               <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse; border: 1px solid #cccccc;">
                  <tr>
                     <td align="center" bgcolor="#A99883" style="padding: 40px 0 30px 0;">
                        <img src="http://naturalis-massilia.alwaysdata.net/assets/img/logo.png" alt="naturalis-massilia-logo" width="150"  style="display: block;" />
                     </td>
                  </tr>
                  <tr>
                     <td bgcolor="#ffffff" style="padding: 40px 30px 40px 30px;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;">
                           <tr>
                              <td style="color: #153643; font-family: \'Playfair Display\', sans-serif;">
                                 <h1>Confirmation de r&eacute;c&eacute;ption</h1>
                              </td>
                           </tr>
                           <tr>
                              <td style="color: #153643; font-size: 16px; line-height: 24px; padding: 20px 0 30px 0;">
                              <p style="margin: 0;font-family: \'Lato\', sans-serif;">Votre message &agrave; bien &eacute;t&eacute; pris en compte, nous le traiterons dans les plus brefs d&eacute;lais.
			                    Nous vous souhaitons une agr&eacute;able journ&eacute;e.<br><br>
			                    Cordialement, l\'&eacute;quipe de Naturalis Massilia.
			                 </p>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;">
                           <tr>
                              <td width="260" valign="top">
                                 <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;">
                                    <tr>
                                       <td>
                                          <img src="http://naturalis-massilia.alwaysdata.net/assets/img/signature-mail.png" alt="" width="80%" style="display: block;" />
                                       </td>
                                    </tr>
                                 </table>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </body>
</html>
';
     $headers = 'From: naturalismassilia@gmail.com';
     $headers='Content-Type:text/html; charset="utf-8"'."\n";

     mail($_POST['email'], $subject, $message, $headers);

     $subject2 = 'Demande de contact';
     $message2 = '
     <html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Contact</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Lato:400,300,700,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
      <style type="text/css">
         a[x-apple-data-detectors] {color: inherit !important;}
      </style>
   </head>
   <body style="margin: 0; padding: 0;">
      <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
         <tr>
            <td style="padding: 20px 0 30px 0;">
               <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse; border: 1px solid #cccccc;">
                  <tr>
                     <td align="center" bgcolor="#A99883" style="padding: 40px 0 30px 0;">
                        <img src="http://naturalis-massilia.alwaysdata.net/assets/img/logo.png" alt="naturalis-massilia-logo" width="150"  style="display: block;" />
                     </td>
                  </tr>
                  <tr>
                     <td bgcolor="#ffffff" style="padding: 40px 30px 40px 30px;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;">
                           <tr>
                              <td style="color: #153643; font-family: \'Playfair Display\', sans-serif;">
                                 <h1>Demande de contact</h1>
                              </td>
                           </tr>
                           <tr>
                              <td style="color: #153643; font-size: 16px; line-height: 24px; padding: 20px 0 30px 0;">
                              <p style="margin: 0;font-family: \'Lato\', sans-serif;">Nom : '.$_POST['name'].'<br><br>'.'Email : '.$_POST['email'].'<br><br>'.'Sujet : '.$_POST['subject'].'<br><br>'.'Message : '.$_POST['message'].'
                          </p>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;">
                           <tr>
                              <td width="260" valign="top">
                                 <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;">
                                    <tr>
                                       <td>
                                          <img src="http://naturalis-massilia.alwaysdata.net/assets/img/signature-mail.png" alt="" width="80%" style="display: block;" />
                                       </td>
                                    </tr>
                                 </table>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </body
></html>
';
   $header2="MIME-Version: 1.0\r\n";
   
   $header2.='Content-Type:text/html; charset="uft-8"'."\n";
   $header2.='Content-Transfer-Encoding: 8bit';

     mail('naturalismassilia@gmail.com', $subject2, $message2, $header2);

     header('Location: index.html');
 ?>