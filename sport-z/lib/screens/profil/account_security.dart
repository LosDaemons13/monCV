import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_sport_z/screens/signIn/reset_password_screen.dart';
import '../../widgets/menu.dart';

final formKey = GlobalKey<FormBuilderState>();

class AccountSecurity extends StatefulWidget {
  const AccountSecurity({Key? key}) : super(key: key);
  @override
  _AccountSecurityState createState() => _AccountSecurityState();
}

class _AccountSecurityState extends State<AccountSecurity> {
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
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
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = const Color(0XFF101010);
        backgroundColor = const Color(0xFFFAFAFA);
      });
    }
  }

  Future changePassword(String oldPassword, String newPassword) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: FirebaseAuth.instance.currentUser!.email ?? "",
        password: oldPassword,
      );

      FirebaseAuth.instance.currentUser!.updatePassword(newPassword).then((_) {
        showFlash(
            context: context,
            duration: const Duration(seconds: 4),
            builder: (context, controller) {
              return Flash.bar(
                controller: controller,
                position: FlashPosition.top,
                backgroundColor: Color(0xFFD4EDDA),
                child: FlashBar(
                  content: const Text('Modifications effectuées avec succès !',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF155724), fontSize: 18)),
                ),
              );
            });
      }).catchError((error) {
        showFlash(
            context: context,
            duration: const Duration(seconds: 4),
            builder: (context, controller) {
              return Flash.bar(
                controller: controller,
                position: FlashPosition.top,
                backgroundColor: const Color(0xFFf8d7da),
                child: FlashBar(
                  content: const Text('Le mot de passe n\'a pas pu être changé',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF721c24), fontSize: 18)),
                ),
              );
            });
        //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showFlash(
            context: context,
            duration: const Duration(seconds: 4),
            builder: (context, controller) {
              return Flash.bar(
                controller: controller,
                position: FlashPosition.top,
                backgroundColor: const Color(0xFFf8d7da),
                child: FlashBar(
                  content: const Text('Erreur dans votre mot de passe actuel',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF721c24), fontSize: 18)),
                ),
              );
            });
      }
    }
  }

  late String password;
  late String newPassword;
  late String verifPassword;
  String? errorVerifPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: colorTheme),
          centerTitle: true,
          title: Text(
            'Sécurité du compte',
            style: TextStyle(
                color: colorTheme,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: backgroundColor,
        ),
        drawer: const Menu(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextButton.icon(
                              style: TextButton.styleFrom(
                                primary: colorTheme,
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w400),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.chevron_left_rounded),
                              label: const Text('Retour')),
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      FormBuilderTextField(
                        name: 'password',
                        obscureText: true,
                        onSaved: (value) {
                          password = value!;
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFFB4B4B4)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFF5AE999)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Mot de passe actuel',
                            labelStyle: TextStyle(
                              color: colorTheme,
                              fontSize: 14,
                            )),
                      ),
                      const SizedBox(height: 40.0),
                      FormBuilderTextField(
                        name: 'newPassword',
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFFB4B4B4)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFF5AE999)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Nouveau mot de passe',
                            labelStyle: TextStyle(
                              color: colorTheme,
                              fontSize: 14,
                            )),
                        validator: (String? value) {
                          if (value == null) {
                            return 'Le mot de passe est requis';
                          }

                          if (!RegExp(
                                  r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
                              .hasMatch(value)) {
                            return 'Veuillez entrer un mot de passe plus sécurisé';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          newPassword = value!;
                        },
                        onSaved: (String? value) {
                          newPassword = value!;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderTextField(
                          name: 'verifPassword',
                          style: const TextStyle(color: Colors.black),
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xFFB4B4B4)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xFF5AE999)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              labelText: 'Vérfication nouveau mot de passe',
                              labelStyle: TextStyle(
                                color: colorTheme,
                                fontSize: 14,
                              )),
                          validator: (String? value) {
                            if (value == null) {
                              return 'La vérification du mot de passe est requise';
                            }

                            if (!RegExp(
                                    r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
                                .hasMatch(value)) {
                              return 'Veuillez entrer un mot de passe plus sécurisé';
                            }

                            if (value != newPassword) {
                              return 'Les deux mots de passes doivent correspondre';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            verifPassword = value!;
                          },
                          onChanged: (String? value) {
                            setState(() {
                              errorVerifPassword = null;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      SizedBox(
                        width: double.infinity,
                        height: 55.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            formKey.currentState!.save();
                            changePassword(password, newPassword);
                          },
                          child: const Text(
                            'Sauvegarder',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18,
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
              ],
            ),
          ),
        ));
  }
}
