import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class Unsubscribe extends StatefulWidget {
  const Unsubscribe({Key? key}) : super(key: key);
  @override
  _UnsubscribeState createState() => _UnsubscribeState();
}

class _UnsubscribeState extends State<Unsubscribe> {
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
          title: Text('Abonnement',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: colorTheme)),
          centerTitle: true,
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                                  color:
                                      const Color.fromRGBO(90, 233, 153, 1))),
                          child: Column(children: [
                            Row(
                              children: [
                                RotationTransition(
                                  turns: const AlwaysStoppedAnimation(30 / 360),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20),
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
                                                fontWeight: FontWeight.w700,
                                                color: colorTheme,
                                                fontFamily: 'Outfit'),
                                          ),
                                          const TextSpan(
                                            text:
                                                "\n2,99 € par mois | Visa XXXX 2154",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF707070),
                                                fontFamily: 'Outfit'),
                                          ),
                                          const TextSpan(
                                            text:
                                                "\nProchaine date de facturation\n17 janvier 2022",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
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
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFFF1F1F1)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
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
