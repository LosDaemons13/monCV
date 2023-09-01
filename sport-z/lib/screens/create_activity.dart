// ignore_for_file: prefer_const_constructors, must_be_immutable, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:projet_sport_z/widgets/activities/rating_bar_select.dart';
import 'package:projet_sport_z/widgets/activities/rating_bar_detail.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:projet_sport_z/utils/api_adresse.dart';

import 'category/homepage.dart';

class CreateActivity extends StatefulWidget {
  CreateActivity({Key? key}) : super(key: key);

  @override
  _CreateActivityState createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  List<DropdownMenuItem<String>> itemsSports = [];
  Map errors = {};

  var date = DateTime.now();

  TextEditingController participantsMax = TextEditingController();
  TextEditingController titleActivity = TextEditingController();
  TextEditingController descriptionActivity = TextEditingController();
  TextEditingController addressActivity = TextEditingController();
  TextEditingController additionalAddressActivity = TextEditingController();
  TextEditingController price = TextEditingController();

  String? activityType;
  String? activityTypeDisplay;
  String? activitySport;
  String? activitySportDisplay;
  DateTime? dateActivity;
  late double requiredLevel = 1;
  int _activeStepIndex = 0;
  List resultAutocomplete = [];
  bool isGoogleAddress = false;
  String? zipCode;

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
    updateSports();
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: greyColor),
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Text('Créer une activité',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: colorTheme)),
          centerTitle: true,
        ),
        body: Theme(
          data: ThemeData(
            fontFamily: 'Outfit',
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xFF5AE999),
              // or from RGB
            ),
            scaffoldBackgroundColor: backgroundColor,
            canvasColor: backgroundColor,
            backgroundColor: backgroundColor,
          ),
          child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            currentStep: _activeStepIndex,
            steps: stepList(),
            onStepContinue: () {
              if (_activeStepIndex < (stepList().length - 1)) {
                if (_activeStepIndex == 0) {
                  if (validateFileds({
                        "activityType": activityType,
                        "activitySport": activitySport,
                        "participantsMax": participantsMax,
                        "titleActivity": titleActivity,
                        "descriptionActivity": descriptionActivity,
                        "requiredLevel": requiredLevel,
                        "price": price
                      }) ==
                      false) {
                    setState(() {
                      _activeStepIndex += 1;
                    });
                  }
                } else if (_activeStepIndex == 1) {
                  if (!validateFileds({
                    "addressActivity": addressActivity,
                    "additionalAddressActivity": additionalAddressActivity,
                    "dateActivity": dateActivity
                  })) {
                    setState(() {
                      _activeStepIndex += 1;
                    });
                  }
                }
              } else {
                zipCode = RegExp(r"\d{5}").stringMatch(addressActivity.text);
                Future result = insertActivity(
                    titleActivity.text,
                    descriptionActivity.text,
                    FirebaseAuth.instance.currentUser!.uid,
                    activitySport,
                    participantsMax.text,
                    activityType,
                    addressActivity.text,
                    dateActivity!.toUtc(),
                    price.text,
                    requiredLevel,
                    zipCode);
                result.then((value) {
                  FirebaseFirestore.instance
                      .collection(value.toString())
                      .doc("firstMsg")
                      .set({"sendingTime": DateTime.now()});
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                });
              }
            },
            onStepCancel: () {
              if (_activeStepIndex == 0) {
                return;
              }

              setState(() {
                _activeStepIndex -= 1;
              });
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              final isLastStep = _activeStepIndex == stepList().length - 1;
              return Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    if (_activeStepIndex > 0)
                      Expanded(
                        child: SizedBox(
                          width: 166,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: details.onStepCancel,
                            child: const Text('Précédent',
                                style: TextStyle(
                                    color: Color(0XFF101010), fontSize: 16)),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      side: const BorderSide(
                                          color: Colors.transparent))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFDDDDDD)),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(horizontal: 8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        width: 166,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: details.onStepContinue,
                          child: (isLastStep)
                              ? const Text('Publier',
                                  style: TextStyle(
                                      color: Color(0XFF101010), fontSize: 16))
                              : const Text(
                                  'Suivant',
                                  style: TextStyle(
                                      color: Color(0XFF101010), fontSize: 16),
                                ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    side: const BorderSide(
                                        color: Colors.transparent))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF5AE999)),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(horizontal: 8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.indexed : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: Text(
            'Activité',
            style: TextStyle(
                color: colorTheme, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          content: Column(
            children: [
              FormBuilderDropdown(
                name: 'activityType',
                items: dropDownActivityType,
                style: TextStyle(color: colorTheme),
                decoration: InputDecoration(
                  labelText: 'Type d\'activité',
                  errorText: errors["activityType"],
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(5)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFFB4B4B4)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFF5AE999)),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    errors["activityType"] = null;
                  });
                  activityType = value!;
                  switch (activityType) {
                    case "1":
                      activityTypeDisplay = "Défier";
                      break;
                    case "2":
                      activityTypeDisplay = "Recruter";
                      break;
                    case "3":
                      activityTypeDisplay = "Découvrir";
                      break;
                    case "4":
                      activityTypeDisplay = "S'entrainer";
                      break;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              FormBuilderDropdown(
                name: 'activitySports',
                items: itemsSports,
                style: TextStyle(color: colorTheme),
                decoration: InputDecoration(
                  labelText: 'Choisissez une activité',
                  errorText: errors["activitySport"],
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(5)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFFB4B4B4)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFF5AE999)),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    errors["activitySport"] = null;
                  });
                  activitySport = value!;
                  switch (activitySport) {
                    case "2":
                      activitySportDisplay = "football";
                      break;
                    case "6":
                      activitySportDisplay = "golf";
                      break;
                    case "7":
                      activitySportDisplay = "tennis";
                      break;
                    case "8":
                      activitySportDisplay = "rugby";
                      break;
                    case "9":
                      activitySportDisplay = "basketball";
                      break;
                    case "10":
                      activitySportDisplay = "tennis de table";
                      break;
                    case "11":
                      activitySportDisplay = "musculation";
                      break;
                    case "12":
                      activitySportDisplay = "volleyball";
                      break;
                    case "13":
                      activitySportDisplay = "plongée";
                      break;
                    case "14":
                      activitySportDisplay = "skateboard";
                      break;
                    case "15":
                      activitySportDisplay = "billard";
                      break;
                    case "16":
                      activitySportDisplay = "randonnée";
                      break;
                    case "17":
                      activitySportDisplay = "pêche";
                      break;
                    case "18":
                      activitySportDisplay = "ski";
                      break;
                    case "19":
                      activitySportDisplay = "boxe";
                      break;
                    case "20":
                      activitySportDisplay = "surf";
                      break;
                    case "21":
                      activitySportDisplay = "pétanque";
                      break;
                    case "22":
                      activitySportDisplay = "pétanque";
                      break;
                    case "23":
                      activitySportDisplay = "jeux vidéos";
                      break;
                    case "24":
                      activitySportDisplay = "badminton";
                      break;
                    case "25":
                      activitySportDisplay = "padel";
                      break;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              FormBuilderTextField(
                  name: 'participantsMax',
                  controller: participantsMax,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3)
                  ],
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: colorTheme),
                  decoration: InputDecoration(
                    labelText: 'Nombre de participants maximum',
                    errorText: errors["participantsMax"],
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFB4B4B4)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF5AE999)),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      errors["participantsMax"] = null;
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              FormBuilderTextField(
                  name: 'titleActivity',
                  controller: titleActivity,
                  style: TextStyle(color: colorTheme),
                  decoration: InputDecoration(
                    labelText: 'Titre de l\'activité',
                    errorText: errors["titleActivity"],
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFB4B4B4)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF5AE999)),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      errors["titleActivity"] = null;
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              FormBuilderTextField(
                  name: 'descriptionActivity',
                  controller: descriptionActivity,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 3,
                  maxLines: 50,
                  style: TextStyle(color: colorTheme),
                  decoration: InputDecoration(
                    labelText: 'Description de l\'activité',
                    errorText: errors["descriptionActivity"],
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFB4B4B4)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF5AE999)),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      errors["descriptionActivity"] = null;
                    });
                  }),
              const SizedBox(height: 20),
              FormBuilderTextField(
                  name: 'price',
                  controller: price,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3)
                  ],
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: colorTheme),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.euro),
                    labelText: 'Prix',
                    errorText: errors["price"],
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFB4B4B4)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF5AE999)),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      errors["price"] = null;
                    });
                  }),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFFB4B4B4)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 18.0, left: 12, bottom: 18),
                          child: Text(
                            "Niveau requis",
                            style: TextStyle(
                                fontSize: 16,
                                color: colorTheme,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBarSelect(updateRating: updateRating),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.indexed : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: Text(
              'Adresse',
              style: TextStyle(
                  color: colorTheme, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                FormBuilderTextField(
                    name: 'addressActivity',
                    controller: addressActivity,
                    style: TextStyle(color: colorTheme),
                    decoration: InputDecoration(
                      errorText: errors["addressActivity"],
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(5)),
                      labelText: 'Adresse de l\'activité',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFFB4B4B4)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF5AE999)),
                      ),
                    ),
                    onChanged: (String? value) async {
                      setState(() {
                        errors["addressActivity"] = null;
                      });
                      if (value!.length > 4) {
                        if (resultAutocomplete.isNotEmpty &&
                            resultAutocomplete.contains(value)) {
                          isGoogleAddress = true;
                          resultAutocomplete = [];
                        } else {
                          isGoogleAddress = false;
                        }
                        if (!isGoogleAddress) {
                          List results = await autoComplete(value);
                          setState(() {
                            resultAutocomplete = results;
                          });
                        }
                      }
                    }),
                SizedBox(
                  height: resultAutocomplete.length * 50,
                  child: ListView.builder(
                    itemCount: resultAutocomplete.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(resultAutocomplete[index]),
                        onTap: () {
                          addressActivity.text = resultAutocomplete[index];
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                    name: 'additionalAddressActivity',
                    controller: additionalAddressActivity,
                    style: TextStyle(color: colorTheme),
                    decoration: InputDecoration(
                      errorText: errors["additionalAddressActivity"],
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(5)),
                      labelText: 'Complément d\'adresse de l\'activité',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFFB4B4B4)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF5AE999)),
                      ),
                    ),
                    onChanged: (String? value) async {
                      setState(() {
                        errors["additionalAddressActivity"] = null;
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderDateTimePicker(
                  firstDate: DateTime(date.year, date.month, date.day),
                  name: 'dateActivity',
                  style: TextStyle(color: colorTheme),
                  decoration: InputDecoration(
                    labelText: 'Date et heure de l\'activité',
                    errorText: errors["dateActivity"],
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFB4B4B4)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF5AE999)),
                    ),
                  ),
                  // locale: const Locale("fr", "FR"),
                  onChanged: (DateTime? value) {
                    setState(() {
                      errors["dateActivity"] = null;
                      dateActivity = value;
                    });
                  },
                ),
              ],
            )),
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.indexed : StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: Text(
              'Confirmer',
              style: TextStyle(
                  color: colorTheme, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: colorTheme,
                        fontSize: 16.0,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(text: 'Type de l\'activité :\n'),
                      TextSpan(
                          text: activityTypeDisplay,
                          style: TextStyle(
                              color: colorTheme,
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: colorTheme,
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Activité :\n'),
                      TextSpan(
                          text: activitySportDisplay,
                          style: TextStyle(
                              color: colorTheme,
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: colorTheme,
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Participants :'),
                      TextSpan(
                          text: '\n${participantsMax.text}',
                          style: TextStyle(
                              color: colorTheme,
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: colorTheme,
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: const <TextSpan>[
                      TextSpan(text: 'Niveau requis pour participer :\n'),
                    ],
                  ),
                ),
                RatingBarDetail(rating: requiredLevel.toInt()),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: colorTheme,
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Titre de l\'activité:'),
                      TextSpan(
                          text: '\n${titleActivity.text}',
                          style: TextStyle(
                            color: colorTheme,
                            fontSize: 14.0,
                            fontFamily: 'Outfit',
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: colorTheme,
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Description :'),
                      TextSpan(
                          text: '\n${descriptionActivity.text}',
                          style: TextStyle(
                            color: colorTheme,
                            fontSize: 14.0,
                            fontFamily: 'Outfit',
                          )),
                    ],
                  ),
                ),
              ],
            ))
      ];

  List<DropdownMenuItem<String>> get dropDownActivityType {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(
            "Défier",
            style: TextStyle(
                color: colorTheme, fontSize: 16, fontFamily: 'Outfit'),
          ),
          value: "1"),
      DropdownMenuItem(
          child: Text(
            "S'entraîner",
            style: TextStyle(
                color: colorTheme, fontSize: 16, fontFamily: 'Outfit'),
          ),
          value: "4"),
      DropdownMenuItem(
          child: Text(
            "Recruter",
            style: TextStyle(
                color: colorTheme, fontSize: 16, fontFamily: 'Outfit'),
          ),
          value: "2"),
      DropdownMenuItem(
          child: Text(
            "Découvrir",
            style: TextStyle(
                color: colorTheme, fontSize: 16, fontFamily: 'Outfit'),
          ),
          value: "3"),
    ];
    return menuItems;
  }

  updateSports() async {
    List<DropdownMenuItem<String>> menuItems = [];
    Map sports = await getSports();
    for (var sport in sports.keys) {
      menuItems.add(DropdownMenuItem(
          child: Text(
            sports[sport],
            style: TextStyle(
                color: colorTheme,
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500),
          ),
          value: "${sport}"));
    }
    //check si l'écran est mounted, sinon génère une erreur car le setState est appelé après le dispose
    if (mounted) {
      setState(() {
        itemsSports = menuItems;
      });
    }
  }

  bool validateFileds(Map fields) {
    bool isError = false;
    for (var field in fields.keys) {
      if (fields[field] == null) {
        setState(() {
          errors[field] = "Ce champ est requis";
        });
        isError = true;
      } else {
        switch (field) {
          case "participantsMax":
            {
              if (fields[field].text == "") {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              } else if (int.parse(fields[field].text) > 100) {
                setState(() {
                  errors[field] =
                      "Le nombre de participants ne peut pas être supérieur à 100";
                });
                isError = true;
              } else if (int.parse(fields[field].text) <= 1) {
                setState(() {
                  errors[field] =
                      "Le nombre de participants ne peut pas être inférieur à 2";
                });
                isError = true;
              } else if (int.parse(fields[field].text) <= 1) {
                setState(() {
                  errors[field] =
                      "Le nombre de participants ne peut pas être égal à 0";
                });
                isError = true;
              }
            }
            break;
          case "titleActivity":
            {
              if (fields[field].text == "") {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              }
            }
            break;
          case "dateActivity":
            {
              if (fields[field] == null || fields[field] == '') {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              }
            }
            break;
          case "price":
            {
              if (fields[field].text == "") {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              }
            }
            break;
          case "descriptionActivity":
            {
              if (fields[field].text == "") {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              } else if (fields[field].text.toString().length <= 5) {
                setState(() {
                  errors[field] =
                      "La description de l'activité doit faire plus de 5 caractères";
                });
                isError = true;
              }
            }
            break;
          case "addressActivity":
            {
              if (fields[field].text == "") {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              } else if (!isGoogleAddress) {
                setState(() {
                  errors[field] =
                      "Veuillez saisir une adresse parmis celles proposées";
                });
                isError = true;
              }
            }
            break;
          case "additionalAddressActivity":
            {}
            break;
          case "activityType":
            {
              if (fields[field] == null) {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              }
            }
            break;
          case "activitySport":
            {
              if (fields[field] == null) {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              }
            }
            break;
        }
      }
    }
    return isError;
  }

  List<DropdownMenuItem<String>> get dropDownRequiredLevel {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var i = 1; i < 6; i++) {
      menuItems.add(DropdownMenuItem(
          child: Text(
            "${i}",
            style: TextStyle(
                color: colorTheme, fontSize: 16, fontFamily: 'Outfit'),
          ),
          value: "${i}"));
    }
    return menuItems;
  }

  updateRating(value) {
    setState(() {
      requiredLevel = value.toDouble();
    });
  }
}
