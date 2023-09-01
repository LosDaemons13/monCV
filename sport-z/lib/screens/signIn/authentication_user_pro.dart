// ignore_for_file: avoid_print, prefer_const_constructors, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:projet_sport_z/screens/category/homepage.dart';
import 'package:projet_sport_z/screens/email_verification.dart';
import 'package:projet_sport_z/screens/signIn/reset_password_screen.dart';
import 'package:projet_sport_z/utils/load_user_infos.dart';

import '../../configs/connection_bdd.dart';
import '../backoffice/dashboard.dart';
import '../pro/profile.dart';
import '../signUp/sign_up_pro.dart';

class AuthenticationPro extends StatefulWidget {
  // function calls AuthenticationProState
  const AuthenticationPro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AuthenticationProState();
  }
}

class AuthenticationProState extends State<AuthenticationPro> {
  // function form user pro connection
  late String password;
  late String mail;
  String? connectError;
  bool isSigningIn = false;
  Map? userData;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C2544),
      appBar: AppBar(
        leading: const BackButton(color: Color(0xFFB4B4B4)),
        backgroundColor: const Color(0xFF0C2544),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Image(
                image: AssetImage('assets/images/fingerprint.png'),
                height: 110),
            const SizedBox(height: 15),
            const Text(
              'Heureux de te revoir !',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFFFAFAFA),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: const [
                  Text(
                    'Connexion',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5AE999),
                      fontSize: 24,
                    ),
                  ),
                  Expanded(
                    child: Text(''),
                  )
                ],
              ),
            ),
            FormBuilder(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: FormBuilderTextField(
                        name: 'Email de l\'entreprise',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFAFAFA)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF5AE999)),
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 16,
                            )),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'L\'email est requis';
                          }
                          if (!RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                              .hasMatch(value)) {
                            return 'Veuillez entrer un email valide';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          mail = value!;
                        },
                        onChanged: (value) {
                          setState(() {
                            connectError = null;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: FormBuilderTextField(
                        name: 'mot de passe',
                        obscureText: true,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        decoration: InputDecoration(
                            errorText: connectError,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFAFAFA)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF5AE999)),
                            ),
                            labelText: 'Mot de passe',
                            labelStyle: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 16,
                            )),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Le mot de passe est requis';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          password = value!;
                        },
                        onChanged: (String? value) {
                          setState(() {
                            connectError = null;
                          });
                        },
                      ),
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(''),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPasswordScreen()),
                            );
                          },
                          child: const Text(
                            'Mot de passe oublié ?',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFB4B4B4),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 320.0,
                      height: 55.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          formKey.currentState!.save();
                          FirebaseAuth auth = FirebaseAuth.instance;
                          try {
                            await auth.signInWithEmailAndPassword(
                                email: mail, password: password);
                            if (auth.currentUser!.emailVerified) {
                              setUserInfos("pro");
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ProfilePro()),
                                  (route) => false);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EmailVerification(userType: "pro")),
                              );
                            }
                          } on FirebaseAuthException catch (e) {
                            setState(() {
                              connectError = "erreur dans les identifiants";
                            });
                          }
                        },
                        child: const Text(
                          'Connexion',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF5AE999)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Color(0xFF5AE999))))),
                      ),
                    )
                  ],
                ),
              ),
              initialValue: const {
                'pseudo': '',
                'mot de passe': '',
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  style:
                      const TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0),
                  children: <TextSpan>[
                    const TextSpan(text: 'Vous n\'avez pas de compte ? '),
                    TextSpan(
                      text: 'Inscrivez-vous ici',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPro()),
                            ),
                      style: const TextStyle(color: Color(0xFF5AE999)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  connectUserPro(String pseudo, String password) {
    Future connected = proUserAuth(pseudo, password);
    connected.then((value) {
      switch (value["error"]) {
        case "no error":
          {
            setState(() {
              connectError = null;
            });
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePro()),
                (route) => false);
          }
          break;
        case "id error":
          {
            setState(() {
              connectError = "erreur dans les identifiants";
            });
          }
          break;
        case "mail not validated":
          {
            setState(() {
              connectError = "votre mail n'est pas encore validé";
            });
          }
          break;
        /* case "k_bis":
          {
            setState(() {
              connectError = "votre mail n'est pas encore validé";
            });
          }
          break; */
        default:
          {
            setState(() {
              connectError = value;
            });
          }
          break;
      }
    });
  }
}
