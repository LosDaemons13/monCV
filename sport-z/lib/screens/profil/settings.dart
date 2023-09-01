// ignore_for_file: deprecated_member_use

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_sport_z/screens/profil/condition.dart';

import '../general_conditions.dart';
import 'formdelete.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Color(0xFFB4B4B4)),
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text('Autres paramètres',
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                  color: colorTheme)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        height: 129,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                  child: Text(
                                    'Conditions d\'utilisation',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20, bottom:20),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                              Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const GeneralConditions()),
                                            );},
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Outfit',
                                    ),
                                    primary: const Color(0xFF363636),
                                    onPrimary: const Color(0xFFFAFAFA),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 15, right: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                            icon: SvgPicture.asset(
                                  'assets/images/icons/profile/download.svg',
                                  color: const Color(0xFF363636),
                                ),
                                label: const Text('Consulter'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        height: 129,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                  child: Text(
                                    'Les règles de confidentialité',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20, bottom:20),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                              Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Policy()),
                                            );},
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Outfit',
                                    ),
                                    primary: const Color(0xFF363636),
                                    onPrimary: const Color(0xFFFAFAFA),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 15, right: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                            icon: SvgPicture.asset(
                                  'assets/images/icons/profile/download.svg',
                                  color: const Color(0xFF363636),
                                ),
                                label: const Text('Consulter'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        height: 129,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                  child: Text(
                                    'Demande d\'envoi de mes données personnelles',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                        fontSize: 18, fontFamily: 'Outfit'),
                                    primary: const Color(0xFF363636),
                                    onPrimary: const Color(0xFFFAFAFA),
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 15,
                                        right: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                icon: SvgPicture.asset(
                                  'assets/images/icons/profile/download.svg',
                                  color: const Color(0xFFFFFFFF),
                                ),
                                label: const Text('Télécharger'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        height: 129,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                  child: Text(
                                    'Supprimer mon compte',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Supression du compte'),
                                      content: const Text(
                                          'Êtes-vous sûr de vouloir supprimer votre compte ?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const FormDelete()));
                                            },
                                            child: const Text('Oui')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Non')),
                                      ],
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Outfit',
                                    ),
                                    primary: const Color(0xFFE8062F),
                                    onPrimary: const Color(0xFFFAFAFA),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 15, right: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                icon: SvgPicture.asset(
                                  'assets/images/icons/profile/delete.svg',
                                  color: const Color(0xFFFFFFFF),
                                ),
                                label: const Text('Supprimer votre compte'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
