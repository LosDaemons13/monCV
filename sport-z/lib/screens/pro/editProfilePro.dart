import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pick_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:flash/flash.dart';

class EditProfilePro extends StatefulWidget {
  EditProfilePro({Key? key, required Map this.userData}) : super(key: key);
  Map userData;

  @override
  State<StatefulWidget> createState() {
    return EditProfileState();
  }
}

class EditProfileState extends State<EditProfilePro> {
  final formKey = GlobalKey<FormBuilderState>();
  void setFile(childFile) {
    setState(() {
      file = childFile;
    });
  }

  var date = DateTime.now();

  String description = "";
  File? file;
  @override
  @override
  Widget build(BuildContext context) {
    int userId = widget.userData["id"];
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    final Future<Map> userInfo = getUserProInfos(widget.userData["id"]);
    return FutureBuilder<Map>(
        future: userInfo, // a previously-obtained Future<Map> or null
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          Widget children;
          if (snapshot.hasData) {
            Map? info = snapshot.data;
            children = (Scaffold(
                backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                  title: const Text('Modifier le profil',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(16, 16, 16, 1))),
                  centerTitle: true,
                ),
                body: Theme(
                  data: ThemeData(
                    textTheme: GoogleFonts.outfitTextTheme(
                      Theme.of(context).textTheme,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      child: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          size: 14),
                                    ),
                                    TextSpan(
                                        text: "Retour ",
                                        style: const TextStyle(
                                          color: Color.fromRGBO(16, 16, 16, 1),
                                          fontSize: 14.0,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap =
                                              () => Navigator.pop(context)),
                                  ],
                                ),
                              ),
                            )),
                        FormBuilder(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  pick_image(
                                    id: FirebaseAuth.instance.currentUser!.uid,
                                    setFile: setFile,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    child: FormBuilderTextField(
                                      name: 'description',
                                      initialValue:
                                          info!["description"].toString(),
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 3,
                                      maxLines: 50,
                                      style: const TextStyle(
                                          color: Color(0xFF333333)),
                                      decoration: InputDecoration(
                                        labelText: 'Description',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFB4B4B4)),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xFF5AE999)),
                                        ),
                                      ),
                                      onSaved: (String? value) {
                                        if (value!.isNotEmpty) {
                                          description = value;
                                        } else {
                                          description = "";
                                        }
                                      },
                                      validator: (String? value) {},
                                    ),
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
                                        if (file != null) {
                                          firebase_storage.TaskSnapshot upload =
                                              await storage
                                                  .ref(
                                                      'TestPFP/${FirebaseAuth.instance.currentUser!.uid}.png')
                                                  .putFile(file!);
                                        }
                                        formKey.currentState!.save();
                                        if (!formKey.currentState!.validate()) {
                                          return;
                                        }
                                        await updateUserPro(
                                            description, widget.userData["id"]);
                                        showFlash(
                                            context: context,
                                            duration:
                                                const Duration(seconds: 4),
                                            builder: (context, controller) {
                                              return Flash.bar(
                                                controller: controller,
                                                position: FlashPosition.top,
                                                backgroundColor:
                                                    Color(0xFFD4EDDA),
                                                child: FlashBar(
                                                  content: Text(
                                                      'Modifications effectuées avec succès !',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF155724),
                                                          fontSize: 18)),
                                                ),
                                              );
                                            });
                                      },
                                      child: const Text(
                                        'Sauvegarder',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                  side: const BorderSide(
                                                      color:
                                                          Color(0xFF5AE999))))),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                )));
          } else {
            children = Scaffold(
                backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                  title: const Text('Modifier le profil',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(16, 16, 16, 1))),
                  centerTitle: true,
                ),
                body: Theme(
                    data: ThemeData(
                      textTheme: GoogleFonts.outfitTextTheme(
                        Theme.of(context).textTheme,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: CircularProgressIndicator(
                                  backgroundColor: Color(0XFFB4B4B4),
                                  color: Color(0XFF5AE999),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text('Chargement...'),
                              )
                            ]),
                      ],
                    )));
          }
          return children;
        });
  }
}
