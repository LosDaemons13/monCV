import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projet_sport_z/screens/profil/advantages.dart';
import '../../utils/load_user_infos.dart';
import '../../widgets/menu.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({Key? key}) : super(key: key);
  @override
  _SubscribeState createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? backgroundColor;
  @override
  void initState() {
    super.initState();
    getTheme();
    populateUserInfos();
  }

  Map userInfos = {};
  populateUserInfos() async {
    Map map = await readUserInfos();
    setState(() {
      userInfos = map;
    });
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
          title: Text('Abonnement',
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
        body: SingleChildScrollView(
          child: userInfos["is_premium"] != 1
              ? Column(
                  children: [
                    Column(
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
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 22.0, right: 22.0, top: 22.0, bottom: 10),
                          child: Container(
                            width: 392,
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color.fromRGBO(90, 233, 153, 1))),
                            child: Column(children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 22, top: 22),
                                        child: Text(
                                          'Sportz Free',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: colorTheme),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 22.0, vertical: 10),
                                      child: Column(
                                        children: const [
                                          Text(
                                            'Vous utilisez la version gratuite de Sportz',
                                            style: TextStyle(
                                                color: Color(0xFF707070),
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ]),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Container(
                                width: 392,
                                height: 390,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            90, 233, 153, 1))),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          RotationTransition(
                                            turns: const AlwaysStoppedAnimation(
                                                30 / 360),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  'assets/images/crown.png',
                                                  width: 80,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Sportz Pro',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: colorTheme),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 22.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16,
                                                          left: 0,
                                                          right: 30),
                                                  child: Column(
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child:
                                                                    const CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          90,
                                                                          233,
                                                                          153,
                                                                          1),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 18,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    "Création d'évènements infinie",
                                                                style: TextStyle(
                                                                    color:
                                                                        colorTheme,
                                                                    fontSize:
                                                                        16)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 22.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16,
                                                          left: 0,
                                                          right: 30),
                                                  child: Column(
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child:
                                                                    const CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          90,
                                                                          233,
                                                                          153,
                                                                          1),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 18,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    "Partager un évènement",
                                                                style: TextStyle(
                                                                    color:
                                                                        colorTheme,
                                                                    fontSize:
                                                                        16)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16,
                                                          left: 0,
                                                          right: 30),
                                                  child: Column(
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child:
                                                                    const CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          90,
                                                                          233,
                                                                          153,
                                                                          1),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 18,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    "Noter un évènement",
                                                                style: TextStyle(
                                                                    color:
                                                                        colorTheme,
                                                                    fontSize:
                                                                        16)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16,
                                                          left: 0,
                                                          right: 30),
                                                  child: Column(
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child:
                                                                    const CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          90,
                                                                          233,
                                                                          153,
                                                                          1),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 18,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    "Commenter un évènement",
                                                                style: TextStyle(
                                                                    color:
                                                                        colorTheme,
                                                                    fontSize:
                                                                        16)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10,
                                                          left: 0,
                                                          right: 10),
                                                  child: Column(
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child:
                                                                    const CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          90,
                                                                          233,
                                                                          153,
                                                                          1),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 18,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    "Réserver dans un centre sportif",
                                                                style: TextStyle(
                                                                    color:
                                                                        colorTheme,
                                                                    fontSize:
                                                                        16)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16,
                                                          left: 0,
                                                          right: 30),
                                                  child: Column(
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child:
                                                                    const CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          90,
                                                                          233,
                                                                          153,
                                                                          1),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 18,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    "Notifications push",
                                                                style: TextStyle(
                                                                    color:
                                                                        colorTheme,
                                                                    fontSize:
                                                                        16)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16,
                                                          left: 0,
                                                          right: 30),
                                                  child: Column(
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child:
                                                                    const CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          90,
                                                                          233,
                                                                          153,
                                                                          1),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 18,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    "Suppression des publicités",
                                                                style: TextStyle(
                                                                    color:
                                                                        colorTheme,
                                                                    fontSize:
                                                                        16)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16,
                                                          left: 0,
                                                          right: 30),
                                                  child: Column(
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child:
                                                                    const CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          90,
                                                                          233,
                                                                          153,
                                                                          1),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 18,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    "Être un membre certifié",
                                                                style: TextStyle(
                                                                    color:
                                                                        colorTheme,
                                                                    fontSize:
                                                                        16)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ])))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 28),
                            child: SizedBox(
                                width: 320.0,
                                height: 55.0,
                                child: TextButton.icon(
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
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Advantages()),
                                    );
                                  },
                                  icon: Transform.rotate(
                                      angle: 6.8,
                                      child: Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Image.asset(
                                              'assets/images/crown.png'))),
                                  label: const Text(
                                    'Passer à SportZ Pro',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 19),
                                  ),
                                )))
                      ],
                    ),
                  ],
                )
              : Column(
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
                    Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 22.0, right: 22.0, top: 22.0, bottom: 10),
                            child: Container(
                                width: 392,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            90, 233, 153, 1))),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            30 / 360),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/crown.png',
                                                width: 100,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "SportZ Pro",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: colorTheme,
                                                      fontFamily: 'Outfit'),
                                                ),
                                                const TextSpan(
                                                  text:
                                                      "\n2,99 € par mois | Visa XXXX 2154",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF707070),
                                                      fontFamily: 'Outfit'),
                                                ),
                                                const TextSpan(
                                                  text:
                                                      "\nProchaine date de facturation\n17 janvier 2022",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF707070),
                                                      fontFamily: 'Outfit'),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ])))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 28),
                          child: SizedBox(
                            width: 320.0,
                            height: 55.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Annuler l\'abonnement',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFFF1F1F1)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Color(0xFFF1F1F1))))),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
        ));
  }
}
