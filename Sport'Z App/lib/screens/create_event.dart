// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:projet_sport_z/screens/pro/profile.dart';
import 'package:projet_sport_z/utils/google_maps_autocomplete.dart';
import 'package:projet_sport_z/widgets/activities/rating_bar_select.dart';

import 'category/homepage.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({Key? key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  List<DropdownMenuItem<String>> itemsSports = [];
  Map errors = {};

  var date = DateTime.now();

  TextEditingController participantsMax = TextEditingController();
  TextEditingController titleEvent = TextEditingController();
  TextEditingController descriptionEvent = TextEditingController();
  TextEditingController addressEvent = TextEditingController();
  TextEditingController additionalAddressEvent = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController price = TextEditingController();

  String? eventType;
  String? eventSport;
  DateTime? dateEvent;
  late double requiredLevel = 1;
  int _activeStepIndex = 0;
  final autoComplete autoCompleteInstance = autoComplete();
  List resultAutocomplete = [];
  bool isGoogleAddress = false;

  @override
  Widget build(BuildContext context) {
    updateSports();
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          leading: const BackButton(color: Color(0xFFB4B4B4)),
          backgroundColor: const Color(0xFFFAFAFA),
          elevation: 0,
          title: const Text('Créer un évènement',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(16, 16, 16, 1))),
          centerTitle: true,
        ),
        body: Theme(
          data: ThemeData(
            fontFamily: 'Outfit',
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xFF5AE999),

              // or from RGB
            ),
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
                        "eventType": eventType,
                        "eventSport": eventSport,
                        "participantsMax": participantsMax,
                        "titleEvent": titleEvent,
                        "descriptionEvent": descriptionEvent,
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
                    "addressEvent": addressEvent,
                    "additionalAddressEvent": additionalAddressEvent,
                    "zipCode": zipCode,
                    "dateEvent": dateEvent
                  })) {
                    setState(() {
                      _activeStepIndex += 1;
                    });
                  }
                }
              } else {
                Future result = insertEvent(
                    titleEvent.text,
                    descriptionEvent.text,
                    FirebaseAuth.instance.currentUser!.uid,
                    eventSport,
                    participantsMax.text,
                    eventType,
                    addressEvent.text,
                    dateEvent!.toUtc(),
                    price.text,
                    requiredLevel);
                result.then((value) => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfilePro()))
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
          title: const Text(
            'Évènement',
            style: TextStyle(color: Color(0xFF495057), fontSize: 16),
          ),
          content: Column(
            children: [
              FormBuilderDropdown(
                name: 'eventType',
                items: dropDownEventType,
                style: const TextStyle(color: Color(0xFF333333)),
                decoration: InputDecoration(
                  labelText: 'Type d\'activité',
                  errorText: errors["eventType"],
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
                    errors["eventType"] = null;
                  });
                  eventType = value!;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              FormBuilderDropdown(
                name: 'eventSports',
                items: itemsSports,
                style: const TextStyle(color: Color(0xFF333333)),
                decoration: InputDecoration(
                  labelText: 'Choisissez une activité',
                  errorText: errors["eventSport"],
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
                    errors["eventSport"] = null;
                  });
                  eventSport = value!;
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
                  style: const TextStyle(color: Color(0xFF333333)),
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
                  name: 'titleEvent',
                  controller: titleEvent,
                  style: const TextStyle(color: Color(0xFF333333)),
                  decoration: InputDecoration(
                    labelText: 'Titre de l\'activité',
                    errorText: errors["titleEvent"],
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
                      errors["titleEvent"] = null;
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              FormBuilderTextField(
                  name: 'descriptionEvent',
                  controller: descriptionEvent,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 3,
                  maxLines: 50,
                  style: const TextStyle(color: Color(0xFF333333)),
                  decoration: InputDecoration(
                    labelText: 'Description de l\'activité',
                    errorText: errors["descriptionEvent"],
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
                      errors["descriptionEvent"] = null;
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
                  style: const TextStyle(color: Color(0xFF333333)),
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
                      children: const [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 18.0, left: 12, bottom: 18),
                          child: Text(
                            "Niveau requis",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF646464),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBarSelect(updateRating: updateRating),
                      ],
                    )
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
            title: const Text(
              'Adresse',
              style: TextStyle(color: Color(0xFF495057), fontSize: 16),
            ),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                FormBuilderTextField(
                    name: 'addressEvent',
                    controller: addressEvent,
                    style: const TextStyle(color: Color(0xFF333333)),
                    decoration: InputDecoration(
                      errorText: errors["addressEvent"],
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
                        errors["addressEvent"] = null;
                      });
                      // if (value!.length > 4) {
                      //   if (resultAutocomplete.isNotEmpty &&
                      //       resultAutocomplete.contains(value)) {
                      //     isGoogleAddress = true;
                      //     resultAutocomplete = [];
                      //   } else {
                      //     isGoogleAddress = false;
                      //   }
                      //   if (!isGoogleAddress) {
                      //     List results =
                      //         await autoCompleteInstance.getAutoComplete(value);
                      //     setState(() {
                      //       resultAutocomplete = results;
                      //     });
                      //   }
                      // }
                    }),
                SizedBox(
                  height: resultAutocomplete.length * 50,
                  child: ListView.builder(
                    itemCount: resultAutocomplete.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(resultAutocomplete[index]),
                        onTap: () {
                          addressEvent.text = resultAutocomplete[index];
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                    name: 'additionalAddressEvent',
                    controller: additionalAddressEvent,
                    style: const TextStyle(color: Color(0xFF333333)),
                    decoration: InputDecoration(
                      errorText: errors["additionalAddressEvent"],
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
                        errors["additionalAddressEvent"] = null;
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                    name: 'zipCode',
                    controller: zipCode,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                    ],
                    style: const TextStyle(color: Color(0xFF333333)),
                    decoration: InputDecoration(
                      labelText: 'Code postal de l\'activité',
                      errorText: errors["zipCode"],
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(5)),
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
                    onChanged: (String? value) {
                      setState(() {
                        errors["zipCode"] = null;
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderDateTimePicker(
                  firstDate: DateTime(date.year, date.month, date.day),
                  name: 'dateEvent',
                  style: const TextStyle(color: Color(0xFF333333)),
                  decoration: InputDecoration(
                    labelText: 'Date et heure de l\'activité',
                    errorText: errors["dateEvent"],
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
                      errors["dateEvent"] = null;
                      dateEvent = value;
                    });
                  },
                ),
              ],
            )),
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.indexed : StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text(
              'Confirmer',
              style: TextStyle(color: Color(0xFF495057), fontSize: 16),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Color(0xFF495057),
                        fontSize: 16.0,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(text: 'Type de l\'activité :\n'),
                      TextSpan(
                          text: eventType,
                          style: TextStyle(
                              color: Color(0xFF495057),
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
                      color: Color(0xFF495057),
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Activité :\n'),
                      TextSpan(
                          text: eventSport,
                          style: TextStyle(
                              color: Color(0xFF495057),
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Color(0xFF495057),
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Participants :'),
                      TextSpan(
                          text: '\n${participantsMax.text}',
                          style: const TextStyle(
                              color: Color(0xFF495057),
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
                      color: Color(0xFF495057),
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Niveau requis pour participer :\n'),
                    ],
                  ),
                ),
                RatingBar.builder(
                  initialRating: requiredLevel,
                  minRating: 1,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  itemSize: 25,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Color.fromRGBO(90, 233, 153, 1),
                  ),
                  onRatingUpdate: (value) {},
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xFF495057),
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Titre de l\'activité:'),
                      TextSpan(
                          text: '\n${titleEvent.text}',
                          style: TextStyle(
                            color: Color(0xFF495057),
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
                      color: Color(0xFF495057),
                      fontSize: 16.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Description :'),
                      TextSpan(
                          text: '\n${descriptionEvent.text}',
                          style: TextStyle(
                            color: Color(0xFF495057),
                            fontSize: 14.0,
                            fontFamily: 'Outfit',
                          )),
                    ],
                  ),
                ),
              ],
            ))
      ];

  List<DropdownMenuItem<String>> get dropDownEventType {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text(
            "Défier",
            style: TextStyle(
                color: Color(0xFF646464), fontSize: 16, fontFamily: 'Outfit'),
          ),
          value: "1"),
      const DropdownMenuItem(
          child: Text(
            "S'entraîner",
            style: TextStyle(
                color: Color(0xFF646464), fontSize: 16, fontFamily: 'Outfit'),
          ),
          value: "4"),
      const DropdownMenuItem(
          child: Text(
            "Recruter",
            style: TextStyle(
                color: Color(0xFF646464), fontSize: 16, fontFamily: 'Outfit'),
          ),
          value: "2"),
      const DropdownMenuItem(
          child: Text(
            "Découvrir",
            style: TextStyle(
                color: Color(0xFF646464), fontSize: 16, fontFamily: 'Outfit'),
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
                color: Color(0xFF646464), fontSize: 16, fontFamily: 'Outfit'),
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
          case "titleEvent":
            {
              if (fields[field].text == "") {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              }
            }
            break;
          case "dateEvent":
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
          case "descriptionEvent":
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
          case "addressEvent":
            {
              if (fields[field].text == "") {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              } /*else if (!isGoogleAddress) {
                setState(() {
                  errors[field] =
                      "Veuillez saisir une adresse parmis celles proposées";
                });
                isError = true;
              }*/
            }
            break;
          case "additionalAddressEvent":
            {}
            break;
          case "zipCode":
            {
              if (fields[field].text == "") {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              } else if (fields[field].text.toString().length != 5) {
                setState(() {
                  errors[field] = "Veuillez entrer un code postal valide";
                });
                isError = true;
              }
            }
            break;
          case "eventType":
            {
              if (fields[field] == null) {
                setState(() {
                  errors[field] = "Ce champ est requis";
                });
                isError = true;
              }
            }
            break;

          case "eventSport":
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
                color: Color(0xFF646464), fontSize: 16, fontFamily: 'Outfit'),
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
