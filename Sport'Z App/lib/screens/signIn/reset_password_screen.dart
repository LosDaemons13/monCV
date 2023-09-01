import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/localization/intl/messages_ar.dart';

import '../../configs/connection_bdd.dart';

final formKey = GlobalKey<FormBuilderState>();

String? email;
String? errorEmailExists;

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? greyColor;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  Future getTheme() async {
    var savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      setState(() {
        darkmode = true;
        colorTheme = const Color(0xFFFAFAFA);
        backgroundColor = const Color(0XFF101010);
        greyColor = const Color(0xFF8F8F8F);
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = const Color(0XFF101010);
        backgroundColor = const Color(0xFFFAFAFA);
        greyColor = const Color(0xFFB4B4B4);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Mot de passe oublié",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Renseignez votre adresse email pour réinitialiser votre mot de passe",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "(Pensez à bien vérifier vos spam si le mail n'apparaît pas dans votre boîte de récéption)",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0),
                    ),
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
                          name: 'email',
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              errorText: errorEmailExists,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF5AE999)),
                              ),
                              labelText: 'Votre email',
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value == null) {
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
                            email = value!;
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 320.0,
                        height: 65.0,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              errorEmailExists = null;
                            });
                            if (!formKey.currentState!.validate()) {
                              return;
                            }

                            formKey.currentState!.save();
                            Future checkEmail = checkIfEmailExists(email!);
                            checkEmail.then((value) async {
                              if (value) {
                                setState(() {
                                  errorEmailExists =
                                      'Cette adresse mail n\'existe pas';
                                });
                              } else {
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(email: email!);
                                showFlash(
                                    context: context,
                                    duration: const Duration(seconds: 4),
                                    builder: (context, controller) {
                                      return Flash.bar(
                                          backgroundColor: Color(0Xffd4edda),
                                          controller: controller,
                                          position: FlashPosition.top,
                                          margin: const EdgeInsets.all(8),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          child: FlashBar(
                                              content: Text(
                                            'Le mail de réinitialisation de mot de passe à bien été envoyé',
                                            style: TextStyle(
                                                color: Color(0XFF155724)),
                                          )));
                                    });
                              }
                            });
                          },
                          child: const Text(
                            'Réinitialiser mon mot de passe',
                            textAlign: TextAlign.center,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
