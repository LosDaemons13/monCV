// ignore_for_file: avoid_print

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flash/flash.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/menu.dart';
import '../pick_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EditProfileState();
  }
}

class EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormBuilderState>();
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? backgroundColor;
  Color? greyColor;
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

  void setFile(childFile) {
    setState(() {
      file = childFile;
    });
  }

  var date = DateTime.now();

  late String firstname;
  late String lastname;
  late String pseudo;
  late String initialPseudo;
  String? errorPseudo;
  late String phoneNumber;
  late String zipCode;
  Map sports = {};
  String uid = FirebaseAuth.instance.currentUser!.uid;

  String description = "";
  File? file;

  String? activitySport;
  String? sportLevel;
  late String addFavSport;
  int addFavRating = 1;

  late int rating;

  List<DropdownMenuItem<String>> itemsSports = [];
  List<DropdownMenuItem<String>> itemsSportsFavorites = [];
  List<Widget> favoriteSports = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateSports();
    getTheme();
  }

  @override
  Widget build(BuildContext context) {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    final Future<Map> userInfo = getUserInfos(uid);
    return FutureBuilder<Map>(
        future: userInfo, // a previously-obtained Future<Map> or null
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          Widget children;
          if (snapshot.hasData) {
            Map? info = snapshot.data;
            initialPseudo = info!["pseudo"];
            children = (Scaffold(
                appBar: AppBar(
                  title: Text('Modifier le profil',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: colorTheme)),
                  iconTheme: IconThemeData(color: colorTheme),
                  centerTitle: true,
                  backgroundColor: backgroundColor,
                  elevation: 0,
                ),
                drawer: const Menu(),
                body: Theme(
                  data: ThemeData(
                    textTheme: GoogleFonts.outfitTextTheme(
                      Theme.of(context).textTheme,
                    ),
                  ),
                  child: SingleChildScrollView(
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
                        FormBuilder(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  pick_image(
                                    id: uid,
                                    setFile: setFile,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: FormBuilderTextField(
                                      name: 'pseudo',
                                      initialValue: '${info["pseudo"]}',
                                      style: TextStyle(color: colorTheme),
                                      decoration: InputDecoration(
                                          errorText: errorPseudo,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: Color(0xFFB4B4B4)),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFF5AE999)),
                                          ),
                                          labelText: 'Pseudo',
                                          labelStyle: TextStyle(
                                            color: colorTheme,
                                            fontWeight: FontWeight.w500,
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
                                        if (errorPseudo != null) {
                                          return errorPseudo;
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: FormBuilderTextField(
                                      name: 'lastname',
                                      initialValue: '${info["lastname"]}',
                                      style: TextStyle(color: colorTheme),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: Color(0xFFB4B4B4)),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFF5AE999)),
                                          ),
                                          labelText: 'Nom',
                                          labelStyle: TextStyle(
                                            color: colorTheme,
                                            fontWeight: FontWeight.w500,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: FormBuilderTextField(
                                      name: 'firstname',
                                      initialValue: '${info["firstname"]}',
                                      style: TextStyle(color: colorTheme),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: Color(0xFFB4B4B4)),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFF5AE999)),
                                          ),
                                          labelText: 'Prénom',
                                          labelStyle: TextStyle(
                                            color: colorTheme,
                                            fontWeight: FontWeight.w500,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: FormBuilderTextField(
                                      keyboardType: TextInputType.phone,
                                      name: 'zipCode',
                                      initialValue: '${info["zipCode"]}',
                                      style: TextStyle(color: colorTheme),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: Color(0xFFB4B4B4)),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFF5AE999)),
                                          ),
                                          labelText: 'Code postal',
                                          labelStyle: TextStyle(
                                            color: colorTheme,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          )),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(5),
                                      ],
                                      validator: (String? value) {
                                        if (value == null) {
                                          return 'Le code postal est requis';
                                        }

                                        if (!RegExp(r"^[0-9]{5}$")
                                            .hasMatch(value)) {
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: FormBuilderTextField(
                                      name: 'description',
                                      initialValue:
                                          info["description"].toString(),
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 3,
                                      maxLines: 50,
                                      style: TextStyle(color: colorTheme),
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
                                  const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Divider(
                                      thickness: 2,
                                    ),
                                  ),
                                  const Text(
                                    "Sports Favoris",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 15,
                                                  right: 5),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: favoriteSports),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  SizedBox(
                                    width: 320.0,
                                    height: 55.0,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        setState(() {
                                          errorPseudo = null;
                                        });
                                        if (!formKey.currentState!.validate()) {
                                          return;
                                        }
                                        if (file != null) {
                                          firebase_storage.TaskSnapshot upload =
                                              await storage
                                                  .ref('TestPFP/${uid}.png')
                                                  .putFile(file!);
                                        }
                                        formKey.currentState!.save();
                                        if (initialPseudo != pseudo) {
                                          bool pseudoExists =
                                              await checkIfPseudoExists(pseudo);
                                          if (pseudoExists) {
                                            setState(() {
                                              errorPseudo =
                                                  'Ce pseudo existe déjà';
                                            });
                                          }
                                        }
                                        if (!formKey.currentState!.validate()) {
                                          return;
                                        }
                                        bool result = await updateUser(
                                            firstname,
                                            lastname,
                                            pseudo,
                                            zipCode,
                                            description,
                                            uid);
                                        if (result) {
                                          showFlash(
                                              context: context,
                                              duration:
                                                  const Duration(seconds: 4),
                                              builder: (context, controller) {
                                                return Flash.bar(
                                                  controller: controller,
                                                  position: FlashPosition.top,
                                                  backgroundColor:
                                                      const Color(0xFFD4EDDA),
                                                  child: FlashBar(
                                                    content: const Text(
                                                        'Modifications effectuées avec succès !',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: const Color(
                                                                0xFF155724),
                                                            fontSize: 18)),
                                                  ),
                                                );
                                              });
                                        } else {
                                          showFlash(
                                              context: context,
                                              duration:
                                                  const Duration(seconds: 4),
                                              builder: (context, controller) {
                                                return Flash.bar(
                                                  controller: controller,
                                                  position: FlashPosition.top,
                                                  backgroundColor:
                                                      const Color(0xFFf8d7da),
                                                  child: FlashBar(
                                                    content: const Text(
                                                        'Erreur lors de la transimission des données, modifications abandonnées.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF721c24),
                                                            fontSize: 18)),
                                                  ),
                                                );
                                              });
                                        }
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
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: backgroundColor,
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

  updateSports() async {
    //check si l'écran est mounted, sinon génère une erreur car le setState est appelé après le dispose
    sports = await getSports();
    Map sportsWoFav = sports;
    if (mounted) {
      Map favorites = await getFavoriteSports(uid);
      if (favorites.isNotEmpty) {
        for (var key in favorites.keys) {
          sportsWoFav.removeWhere((sportId, value) => key == sportId);
          Widget favoriteSport = Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: <Widget>[
                        Card(
                          color: const Color(0xFF5AE999),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    favorites[key]["label"],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                RatingBar.builder(
                                  initialRating:
                                      favorites[key]["rating"].toDouble(),
                                  ignoreGestures: true,
                                  itemSize: 16,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  onRatingUpdate: (double value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(70.0, -5.0, 0.0),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(500))),
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ),
                            onPressed: () {
                              deleteFavoriteSport(uid, key);
                              setState(() {
                                favoriteSports = [];
                              });
                              updateSports();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
          setState(() {
            favoriteSports.add(favoriteSport);
          });
        }
        ;
        if (favoriteSports.length < 3) {
          List<DropdownMenuItem<String>> addFavoritesItems = [];
          sportsWoFav.forEach(
            (key, value) {
              addFavoritesItems.add(DropdownMenuItem(
                  child: Text(
                    "${value}",
                    style: const TextStyle(
                        color: Color(0xFF646464),
                        fontSize: 16,
                        fontFamily: 'Outfit'),
                  ),
                  value: "${key}"));
            },
          );
          setState(() {
            favoriteSports.add(
              GestureDetector(
                child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5AE999),
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(500)),
                    ),
                    child: const Icon(Icons.add)),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'Choisir un sport',
                              textAlign: TextAlign.center,
                            ),
                            content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: FormBuilderDropdown(
                                      name: 'addFavoritesItems',
                                      menuMaxHeight: 300,
                                      onChanged: (value) {
                                        addFavSport = value.toString();
                                      },
                                      items: addFavoritesItems,
                                      style: TextStyle(color: colorTheme),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                        labelText: 'Sports',
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1, color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 1,
                                          itemSize: 24,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(90, 233, 153, 1),
                                          ),
                                          onRatingUpdate: (double value) {
                                            addFavRating = value.round();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (addFavSport != "") {
                                        addFavoriteSport(addFavSport.toString(),
                                            uid, addFavRating);
                                        Navigator.pop(context);
                                        setState(() {
                                          favoriteSports = [];
                                        });
                                        updateSports();
                                      } else {}
                                    },
                                    child: const Text(
                                      'Ajouter',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 14,
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
                                                    BorderRadius.circular(8.0),
                                                side: const BorderSide(
                                                    color:
                                                        Color(0xFF5AE999))))),
                                  ),
                                ],
                              )
                            ],
                          ));
                },
              ),
            );
          });
        }
      } else {
        List<DropdownMenuItem<String>> addFavoritesItems = [];
        sportsWoFav.forEach(
          (key, value) {
            addFavoritesItems.add(DropdownMenuItem(
                child: Text(
                  "${value}",
                  style: const TextStyle(
                      color: Color(0xFF646464),
                      fontSize: 16,
                      fontFamily: 'Outfit'),
                ),
                value: "${key}"));
          },
        );
        setState(() {
          favoriteSports.add(
            GestureDetector(
              child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5AE999),
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(500)),
                  ),
                  child: const Icon(Icons.add)),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                            'Choisir un sport',
                            textAlign: TextAlign.center,
                          ),
                          content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: FormBuilderDropdown(
                                    name: 'addFavoritesItems',
                                    menuMaxHeight: 300,
                                    onChanged: (value) {
                                      addFavSport = value.toString();
                                    },
                                    items: addFavoritesItems,
                                    style: TextStyle(color: colorTheme),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(12),
                                      labelText: 'Sports',
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Color(0xFFB4B4B4)),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Color(0xFF5AE999)),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: 1,
                                        itemSize: 24,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemCount: 5,
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color:
                                              Color.fromRGBO(90, 233, 153, 1),
                                        ),
                                        onRatingUpdate: (double value) {
                                          addFavRating = value.round();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (addFavSport != "") {
                                      addFavoriteSport(addFavSport.toString(),
                                          uid, addFavRating);
                                      Navigator.pop(context);
                                      setState(() {
                                        favoriteSports = [];
                                      });
                                      updateSports();
                                    } else {}
                                  },
                                  child: const Text(
                                    'Ajouter',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 14,
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
                                                  BorderRadius.circular(8.0),
                                              side: const BorderSide(
                                                  color: Color(0xFF5AE999))))),
                                ),
                              ],
                            )
                          ],
                        ));
              },
            ),
          );
        });
      }
      List<DropdownMenuItem<String>> menuItems = [];
      for (var sport in sports.keys) {
        menuItems.add(DropdownMenuItem(
            child: Text(
              sports[sport],
              style: const TextStyle(
                  color: Color(0xFF646464), fontSize: 16, fontFamily: 'Outfit'),
            ),
            value: "${sport}"));
      }
      List<DropdownMenuItem<String>> menuItemsFavorites = menuItems;
      for (var sport in favorites.keys) {
        menuItemsFavorites
            .removeWhere((element) => element.value == sport.toString());
      }
      setState(() {
        itemsSportsFavorites = menuItemsFavorites;
        itemsSports = menuItems;
      });
    }
  }
}
