import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:projet_sport_z/gpay_btn.dart';

import '../../widgets/menu.dart';
import '../general_conditions.dart';
import 'package:pay/pay.dart';

class Advantages extends StatefulWidget {
  const Advantages({Key? key}) : super(key: key);
  @override
  _AdvantagesState createState() => _AdvantagesState();
}

class _AdvantagesState extends State<Advantages> {
  bool value = false;
  bool darkmode = false;
  int val = 2;
  double price = 2.99;
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

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    var _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '$price',
        status: PaymentItemStatus.final_price,
      )
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Abonnement',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: colorTheme)),
          centerTitle: true,
          iconTheme: IconThemeData(color: colorTheme),
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        drawer: const Menu(),
        body: SingleChildScrollView(
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
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          width: 392,
                          height: 390,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(90, 233, 153, 1))),
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
                                  padding: const EdgeInsets.only(left: 22.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16, left: 0, right: 30),
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
                                                                  right: 20),
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
                                                              color: colorTheme,
                                                              fontSize: 16)),
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
                                  padding: const EdgeInsets.only(left: 22.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16, left: 0, right: 30),
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
                                                                  right: 20),
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
                                                              color: colorTheme,
                                                              fontSize: 16)),
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
                                            padding: const EdgeInsets.only(
                                                bottom: 16, left: 0, right: 30),
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
                                                                  right: 20),
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
                                                              color: colorTheme,
                                                              fontSize: 16)),
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
                                            padding: const EdgeInsets.only(
                                                bottom: 16, left: 0, right: 30),
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
                                                                  right: 20),
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
                                                              color: colorTheme,
                                                              fontSize: 16)),
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
                                            padding: const EdgeInsets.only(
                                                bottom: 10, left: 0, right: 10),
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
                                                                  right: 20),
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
                                                              color: colorTheme,
                                                              fontSize: 16)),
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
                                            padding: const EdgeInsets.only(
                                                bottom: 16, left: 0, right: 30),
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
                                                                  right: 20),
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
                                                              color: colorTheme,
                                                              fontSize: 16)),
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
                                            padding: const EdgeInsets.only(
                                                bottom: 16, left: 0, right: 30),
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
                                                                  right: 20),
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
                                                              color: colorTheme,
                                                              fontSize: 16)),
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
                                            padding: const EdgeInsets.only(
                                                bottom: 16, left: 0, right: 30),
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
                                                                  right: 20),
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
                                                              color: colorTheme,
                                                              fontSize: 16)),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text("Annuel (29.99€ / an)"),
                    leading: Radio(
                      value: 1,
                      groupValue: val,
                      onChanged: (valeur) {
                        setState(() {
                          val = 1;
                          price = 29.99;
                        });
                      },
                      activeColor: const Color(0xFF5AE999),
                    ),
                  ),
                  ListTile(
                    title: const Text("Mensuel (2.99€ / mois)"),
                    leading: Radio(
                      value: 2,
                      groupValue: val,
                      onChanged: (valeur) {
                        setState(() {
                          val = 2;
                          price = 2.99;
                        });
                      },
                      activeColor: const Color(0xFF5AE999),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              ApplePayButton(
                width: 200,
                height: 50,
  paymentConfigurationAsset: 'applepay.json',
  paymentItems: _paymentItems,
  style: ApplePayButtonStyle.black,
  type: ApplePayButtonType.buy,
  margin: const EdgeInsets.only(top: 15.0),
  onPaymentResult: onApplePayResult,
  loadingIndicator: const Center(
    child: CircularProgressIndicator(),
  ),
),
               const SizedBox(height: 15),
              GooglePayButton(
                width: 320,
                height: 55,
                paymentConfigurationAsset: 'gpay.json',
                paymentItems: _paymentItems,
                style: GooglePayButtonStyle.black,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: onGooglePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0XFFB4B4B4),
                    color: Color(0XFF5AE999),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        color: Color(0xFFB4B4B4), fontSize: 14.0),
                    children: <TextSpan>[
                      const TextSpan(
                          text:
                              'Avant de souscrire à un abonnement, veuillez consulter nos '),
                      TextSpan(
                        text: 'Conditions générales d’utilisation ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GeneralConditions()),
                              ),
                        style: const TextStyle(
                          color: Color(0xFFB4B4B4),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: 'relatives à Sportz Pro.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
