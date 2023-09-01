import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_sport_z/screens/pro/profile.dart';
import 'dart:async';
import 'package:projet_sport_z/screens/category/homepage.dart';
import 'package:projet_sport_z/utils/load_user_infos.dart';

class EmailVerification extends StatefulWidget {
  EmailVerification({Key? key, required String this.userType})
      : super(key: key);
  String userType;

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

bool buttonEnabled = true;
List<ButtonStyle> btnStyles = [
  ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFF5AE999)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Color(0xFF5AE999))))),
  ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(90, 233, 153, 0.1)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side:
                  const BorderSide(color: Color.fromRGBO(90, 233, 153, 0.1)))))
];
ButtonStyle btnStyle = btnStyles[0];

List<TextStyle> txtStyles = [
  const TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 22,
  ),
  TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.1),
    fontSize: 22,
  ),
];
TextStyle txtStyle = txtStyles[0];

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        FirebaseAuth.instance.currentUser!.reload();
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          setUserInfos(widget.userType);
          if (widget.userType == "user") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false);
          } else {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePro()),
                (route) => false);
          }
        }
      },
    );
    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        ),
        body: Theme(
            data: ThemeData(
              textTheme: GoogleFonts.outfitTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(Icons.arrow_back_ios_new_rounded,
                                size: 14),
                          ),
                          TextSpan(
                              text: "Retour ",
                              style: const TextStyle(
                                color: Color.fromRGBO(16, 16, 16, 1),
                                fontSize: 14.0,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pop(context)),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Vérification de l\'email',
                      style: TextStyle(
                          fontSize: 28,
                          color: Color(0XFF101010),
                          fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8, top: 24, right: 8, bottom: 24),
                      child: Text(
                          'Nous vous avons envoyé un lien de vérification sur votre boite mail',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0XFF101010),
                              fontWeight: FontWeight.normal)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        style:
                            TextStyle(color: Color(0xFFA6A6A6), fontSize: 16.0),
                        children: <TextSpan>[
                          TextSpan(text: 'Vous ne l\'avez pas reçu ?'),
                        ]),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 320.0,
                    height: 55.0,
                    child: ElevatedButton(
                      onPressed: buttonEnabled
                          ?
                          //bouton désactivé 1 minute après avoir été tapé
                          () {
                              FirebaseAuth.instance.currentUser!
                                  .sendEmailVerification();
                              disableButton();
                            }
                          : null,
                      child: Text(
                        'Renvoyer',
                        textAlign: TextAlign.center,
                        style: txtStyle,
                      ),
                      style: btnStyle,
                    ),
                  ),
                ],
              )
            ]))));
  }

  // désactive le bouton "renvoyer un mail" pendant 1 minute puis le réactive
  disableButton() {
    setState(() {
      buttonEnabled = false;
      btnStyle = btnStyles[1];
      txtStyle = txtStyles[1];
    });
    Timer(const Duration(minutes: 1), () {
      setState(() {
        buttonEnabled = true;
        btnStyle = btnStyles[0];
        txtStyle = txtStyles[0];
      });
    });
  }
}
