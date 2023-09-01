// ignore_for_file: avoid_print, unused_import, unused_local_variable, prefer_collection_literals

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:projet_sport_z/screens/email_verification.dart';
import 'package:projet_sport_z/widgets/google_sign_in_button.dart';

import '../../configs/connection_bdd.dart';
import '../../widgets/facebook_sign_in_button.dart';
import '../category/homepage.dart';
import '../general_conditions.dart';
import '../signIn/authentication_user.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormBuilderState>();

  var date = DateTime.now();
  Map? userData;
  late String firstname;
  late String lastname;
  late String pseudo;
  String? errorPseudo;
  String? email;
  String? verifEmail;
  String? errorVerifEmail;
  late String phoneNumber;
  late String password;
  late String verifPassword;
  String? errorVerifPassword;
  DateTime? birthDate;
  String? errorBirthDate;
  late String zipCode;
  late String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0C2544),
        appBar: AppBar(
          leading: const BackButton(color: Color(0xFFB4B4B4)),
          backgroundColor: const Color(0xFF0C2544),
          elevation: 0,
        ),
        body: Theme(
          data: ThemeData(
            unselectedWidgetColor: const Color(0xFFFAFAFA),
            fontFamily: 'Outfit',
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Image(
                    image: AssetImage('assets/images/fingerprint.png'),
                    height: 110),
                const SizedBox(height: 15),
                const Text(
                  'Bienvenue !',
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
                        'Inscription',
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
                              name: 'firstname',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Prénom',
                                  labelStyle: TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 16,
                                  )),
                              validator: (String? value) {
                                if (value == null) {
                                  return 'Le prénom est requis';
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                firstname = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderTextField(
                              name: 'lastname',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Nom',
                                  labelStyle: TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 16,
                                  )),
                              validator: (String? value) {
                                if (value == null) {
                                  return 'Le nom est requis';
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                lastname = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderTextField(
                              name: 'pseudo',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              decoration: InputDecoration(
                                  errorText: errorPseudo,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Pseudo',
                                  labelStyle: const TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 16,
                                  )),
                              validator: (String? value) {
                                if (value == null) {
                                  return 'Le pseudo est requis';
                                }

                                if (!RegExp(
                                        r"^(?=.{3,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+$")
                                    .hasMatch(value)) {
                                  return 'Veuillez entrer un pseudo valide';
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                pseudo = value!;
                              },
                              onChanged: errorPseudo = null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderTextField(
                              name: 'email',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              decoration: InputDecoration(
                                  errorText: errorVerifEmail,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(
                                    color: Color(0xFFFAFAFA),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderTextField(
                              name: 'verifEmail',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Vérification email',
                                  errorText: errorVerifEmail,
                                  labelStyle: const TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 16,
                                  )),
                              validator: (String? value) {
                                if (value == null) {
                                  return 'La vérification de l\'email est requise';
                                }
                                return null;
                              },
                              onChanged: (String? value) {
                                setState(() {
                                  errorVerifEmail = null;
                                });
                              },
                              onSaved: (String? value) {
                                verifEmail = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderTextField(
                              name: 'phoneNumber',
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Numéro de téléphone',
                                  labelStyle: TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 16,
                                  )),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              validator: (String? value) {
                                if (value == null) {
                                  return 'Le numéro de téléphone est requis';
                                }

                                if (!RegExp(r"^0[67][0-9]{8,}$")
                                    .hasMatch(value)) {
                                  return 'Veuillez entrer un numéro de téléphone valide';
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                phoneNumber = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderTextField(
                              name: 'password',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              obscureText: true,
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Mot de passe',
                                  labelStyle: TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 16,
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
                              onSaved: (String? value) {
                                password = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderTextField(
                              name: 'verifPassword',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Vérification mot de passe',
                                  errorText: errorVerifPassword,
                                  labelStyle: const TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 16,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderDateTimePicker(
                              lastDate: DateTime(
                                  date.year - 13, date.month, date.day),
                              initialDate: DateTime(
                                  date.year - 13, date.month, date.day),
                              name: 'birthDate',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              decoration: InputDecoration(
                                  errorText: errorBirthDate,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Date de naissance',
                                  labelStyle: const TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 16,
                                  )),
                              locale: const Locale("fr", "FR"),
                              inputType: InputType.date,
                              validator: (DateTime? value) {
                                if (value == null) {
                                  return 'La date de naissance est requise';
                                }
                                return null;
                              },
                              onSaved: (DateTime? value) {
                                birthDate = value!;
                              },
                              onChanged: (DateTime? value) {
                                setState(() {
                                  errorBirthDate = null;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderTextField(
                              keyboardType: TextInputType.phone,
                              name: 'zipCode',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 243, 243)),
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFAFAFA)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Code postal',
                                  labelStyle: TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 16,
                                  )),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                              ],
                              validator: (String? value) {
                                if (value == null) {
                                  return 'Le code postal est requis';
                                }

                                if (!RegExp(r"^[0-9]{5}$").hasMatch(value)) {
                                  return 'Veuillez entrer un code postal valide';
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                zipCode = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: FormBuilderRadioGroup(
                              name: 'gender',
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF0C2544)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF5AE999)),
                                  ),
                                  labelText: 'Genre',
                                  labelStyle: TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 22,
                                  )),
                              options: const [
                                FormBuilderFieldOption(
                                  value: 'm',
                                  child: Text(
                                    'Homme',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFFAFAFA),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                FormBuilderFieldOption(
                                    value: 'f',
                                    child: Text(
                                      'Femme',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFAFAFA),
                                        fontSize: 16,
                                      ),
                                    )),
                                FormBuilderFieldOption(
                                    value: 'o',
                                    child: Text(
                                      'Autre',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFAFAFA),
                                        fontSize: 16,
                                      ),
                                    )),
                              ],
                              validator: (String? value) {
                                if (value == null) {
                                  return 'Le genre est requis';
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                gender = value!;
                              },
                              activeColor: const Color(0xFF5AE999),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: FormBuilderCheckbox(
                              name: 'accept_terms',
                              title: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(text: 'J\'accepte les'),
                                    TextSpan(
                                      text:
                                          ' conditions générales d\'utilisation',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const GeneralConditions()),
                                            ),
                                      style: const TextStyle(
                                          color: Color(0xFF5AE999)),
                                    ),
                                    const TextSpan(
                                      text: ' et atteste avoir plus de 13 ans',
                                    ),
                                  ],
                                ),
                              ),
                              validator: FormBuilderValidators.equal(
                                context,
                                true,
                                errorText:
                                    'Vous devez accepter les conditions d\'utilisation pour continuer',
                              ),
                              activeColor: const Color(0xFF5AE999),
                            ),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: 320.0,
                            height: 55.0,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  errorVerifPassword = null;
                                });
                                setState(() {
                                  errorPseudo = null;
                                });
                                setState(() {
                                  errorVerifEmail = null;
                                });
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }

                                formKey.currentState!.save();

                                checkAge(birthDate!)
                                    ? false
                                    : setState(() {
                                        errorBirthDate =
                                            'Vous devez avoir plus de 13 ans pour vous inscrire';
                                      });

                                if (password != verifPassword &&
                                    email != verifEmail) {
                                  setState(() {
                                    errorVerifPassword =
                                        'Les mots de passe ne correspondent pas';
                                  });
                                  setState(() {
                                    errorVerifEmail =
                                        'Les emails ne correspondent pas';
                                  });
                                } else if (email != verifEmail) {
                                  setState(() {
                                    errorVerifEmail =
                                        'Les emails ne correspondent pas';
                                  });
                                } else if (password != verifPassword) {
                                  setState(() {
                                    errorVerifPassword =
                                        'Les mots de passe ne correspondent pas';
                                  });
                                } else {
                                  Future emailPseudoExists =
                                      checkEmailPseudo(email!, pseudo);
                                  emailPseudoExists.then((value) {
                                    switch (value) {
                                      case "P":
                                        setState(() {
                                          errorPseudo = 'Ce pseudo existe déjà';
                                        });
                                        break;
                                      case "E":
                                        setState(() {
                                          errorVerifEmail =
                                              'Cet email existe déjà';
                                        });
                                        break;
                                      case "PE":
                                        setState(() {
                                          errorVerifEmail =
                                              'Cet email existe déjà';
                                          errorPseudo = 'Ce pseudo existe déjà';
                                        });
                                        break;
                                      case "":
                                        signUp(
                                            email!,
                                            password,
                                            firstname,
                                            lastname,
                                            pseudo,
                                            phoneNumber,
                                            birthDate.toString(),
                                            zipCode,
                                            gender);
                                        break;
                                    }
                                  });
                                }
                              },
                              child: const Text(
                                'Inscription',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFF5AE999)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Color(0xFF5AE999))))),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Ou s\'inscrire avec...',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFAFAFA),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GoogleSignInButton(userData: userData),
                              FacebookSignInButton(userData: userData)
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Color(0xFFFAFAFA), fontSize: 14.0),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Vous avez déjà un compte ? '),
                                  TextSpan(
                                    text: 'Connectez-vous',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Authentication()),
                                          ),
                                    style: const TextStyle(
                                        color: Color(0xFF5AE999)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  signUp(String email, password, firstname, lastname, pseudo, phoneNumber,
      birthdate, zipCode, gender) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.reload();
      user = auth.currentUser;
      insertUser(firstname, lastname, pseudo, email, phoneNumber, password,
          birthdate, zipCode, gender);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailVerification(userType: "user")),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          errorVerifEmail = "cet email est déjà utilisé pour un autre compte";
        });
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  bool checkAge(DateTime birthDate) {
    birthDate = DateTime(birthDate.year, birthDate.month, birthDate.day);
    var today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    return ((today.difference(birthDate).inHours / 24) / 365.25) >= 13
        ? true
        : false;
  }
}
