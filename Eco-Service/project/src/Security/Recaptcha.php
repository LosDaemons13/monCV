<?php 

namespace App\Security;

class Recaptcha {
    public function validate($token): bool
    {
        if (empty($token)) {
            return false;
        }

        $response = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=6LcTLnEaAAAAAPL1vAJ9iEF7sSU6QrcnvgDWht9L&response=' . $token);
        $return = json_decode($response);

        // If not a bot
        return ($return->success == true AND $return->score > 0.5);
    }
}