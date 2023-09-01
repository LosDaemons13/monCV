// ignore_for_file: non_constant_identifier_names, body_might_complete_normally_nullable, avoid_print, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';

import '../category/homepage.dart';
import '../download_sport_z_infos.dart';
import '../email_verification.dart';
import '../general_conditions.dart';
import '../signIn/authentication_user_pro.dart';

class SignUpPro extends StatefulWidget {
  // function calls SignUpState
  const SignUpPro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignUpProState();
  }
}

class SignUpProState extends State<SignUpPro> {
  // function form sign up pro
  final formKey = GlobalKey<FormBuilderState>();
  final bool _useCustomFileViewer = true;

  late String firstname;
  late String lastname;
  String? email;
  String? verifEmail;
  String? errorVerifEmail;
  late String phoneNumber;
  late String password;
  late String verifPassword;
  String? errorVerifPassword;
  late String company_name;
  late String brand_name;
  late String company_adress;
  late String num_siret;
  late String primary_activity;
  late String description;
  late String kbis;
  late String identity_card;

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
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderTextField(
                          name: 'firstname',
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
                              errorText: errorVerifEmail,
                              labelText: 'Prénom du gérant de l\'entreprise',
                              labelStyle: const TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
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
                              labelText: 'Nom du gérant de l\'entreprise',
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Le nom est requis';
                            }
                          },
                          onSaved: (String? value) {
                            lastname = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderTextField(
                          name: 'company_name',
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
                              labelText: 'Nom de l\'entreprise',
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Le nom est requis';
                            }
                          },
                          onSaved: (String? value) {
                            company_name = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderTextField(
                          name: 'brand_name',
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
                              labelText: 'Nom de l\'enseigne de l\'entreprise',
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Le nom de l\'enseigne est requis';
                            }
                          },
                          onSaved: (String? value) {
                            brand_name = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderTextField(
                          name: 'email',
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
                              labelText: 'Adresse mail de l\'entreprise',
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'L\'email est requis';
                            }

                            if (!RegExp(
                                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                .hasMatch(value)) {
                              return 'Veuillez entrer un email valide';
                            }
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
                            if (value!.isEmpty) {
                              return 'La vérification de l\'email est requise';
                            }
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
                              labelText: 'Numéro de téléphone de l\'entreprise',
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Le numéro de téléphone est requis';
                            }

                            if (!RegExp(r"^0[67][0-9]{8,}$").hasMatch(value)) {
                              return 'Veuillez entrer un numéro de téléphone valide';
                            }
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
                            if (value!.isEmpty) {
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
                            if (value!.isEmpty) {
                              return 'La vérification du mot de passe est requise';
                            }
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
                        child: FormBuilderTextField(
                          name: 'company_adress',
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
                              labelText: 'Adresse de l\'entreprise',
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'L\'adresse de l\'entreprise est requise';
                            }
                          },
                          onSaved: (String? value) {
                            company_adress = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderTextField(
                          name: 'num_siret',
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
                              labelText: 'Numéro de SIRET de l\'entreprise',
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Le numéro de l\'entreprise est requis';
                            }
                          },
                          onSaved: (String? value) {
                            num_siret = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderFilePicker(
                          name: "Kbis",
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF0C2544)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF0C2544)),
                              ),
                              labelText: "Kbis",
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          maxFiles: null,
                          previewImages: true,
                          onSaved: (val) {
                            kbis = val.toString();
                          },
                          selector: Row(
                            children: const <Widget>[
                              Icon(Icons.folder, color: Colors.white),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Télécharger',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 243, 243, 243)),
                                ),
                              ),
                            ],
                          ),
                          onFileLoading: (val) {
                            print(kbis);
                          },
                          customFileViewerBuilder: _useCustomFileViewer
                              ? customFileViewerBuilder
                              : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderFilePicker(
                          name: "identity_card",
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFFAFAFA)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF5AE999)),
                              ),
                              labelText: "Carte d'identité",
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          maxFiles: null,
                          previewImages: true,
                          onSaved: (val) {
                            identity_card = val.toString();
                          },
                          selector: Row(
                            children: const <Widget>[
                              Icon(Icons.folder, color: Colors.white),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Télécharger',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 243, 243, 243)),
                                ),
                              ),
                            ],
                          ),
                          onFileLoading: (val) {
                            print(identity_card);
                          },
                          customFileViewerBuilder: _useCustomFileViewer
                              ? customFileViewerBuilder
                              : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderTextField(
                          name: 'primary_activity',
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
                              labelText: 'Activité principale de l\'entreprise',
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'L\'activité principale de l\'entreprise est requis';
                            }
                          },
                          onSaved: (String? value) {
                            primary_activity = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FormBuilderTextField(
                          name: 'description',
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
                              labelText: 'Descritption de l\'entreprise',
                              labelStyle: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
                              )),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Descritption de l\'entreprise requis';
                            }
                          },
                          onSaved: (String? value) {
                            description = value!;
                          },
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
                                  text: ' conditions générales d\'utilisation',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const GeneralConditions()),
                                        ),
                                  style:
                                      const TextStyle(color: Color(0xFF5AE999)),
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
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 320,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }

                                formKey.currentState!.save();

                                if (password != verifPassword &&
                                    email != verifEmail) {
                                  setState(() {
                                    errorVerifPassword =
                                        'Les mots de passe ne correspondent pas';
                                  });
                                  setState(() {
                                    errorVerifEmail =
                                        'Les emails ne correspondent pas';
                                    print(errorVerifEmail);
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
                                  Future mailExists =
                                      checkIfEmailExists(email!);
                                  mailExists.then((value) {
                                    if (value) {
                                      signUpUserPro(
                                          firstname,
                                          lastname,
                                          email,
                                          password,
                                          company_name,
                                          brand_name,
                                          company_adress,
                                          num_siret,
                                          kbis,
                                          identity_card,
                                          primary_activity,
                                          description);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Cet email existe déjà, veuillez réessayer",
                                          gravity: ToastGravity.TOP,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red[100],
                                          textColor: Colors.red[900],
                                          webPosition: "center",
                                          fontSize: 16.0);
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
                                                    const AuthenticationPro()),
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
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  signUpUserPro(
      String firstname,
      lastname,
      email,
      password,
      company_name,
      brand_name,
      company_adress,
      num_siret,
      kbis,
      identity_card,
      primary_activity,
      description) async {
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
      insertUserPro(
          firstname,
          lastname,
          email,
          password,
          company_name,
          brand_name,
          company_adress,
          num_siret,
          kbis,
          identity_card,
          primary_activity,
          description);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EmailVerification(userType: "pro")),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}

Widget customFileViewerBuilder(
  List<PlatformFile>? files,
  FormFieldSetter<List<PlatformFile>> setter,
) {
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final file = files![index];
      return ListTile(
        title: Text(
          file.name,
          style: const TextStyle(color: Color.fromARGB(255, 243, 243, 243)),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onPressed: () {
            files.removeAt(index);
            setter.call([...files]);
          },
        ),
      );
    },
    separatorBuilder: (context, index) => const Divider(
      color: Colors.blueAccent,
    ),
    itemCount: files!.length,
  );
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
