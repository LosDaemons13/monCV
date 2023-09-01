import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:projet_sport_z/screens/category/homepage.dart';
import 'package:projet_sport_z/screens/activity_chat.dart';

class ConfirmationParticipation extends StatefulWidget {
  ConfirmationParticipation({Key? key, required this.chatInfos})
      : super(key: key);
  Map chatInfos;

  @override
  State<ConfirmationParticipation> createState() =>
      _ConfirmationParticipationState();
}

class _ConfirmationParticipationState extends State<ConfirmationParticipation> {
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
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: colorTheme),
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              const Image(image: AssetImage('assets/images/check.png')),
              const SizedBox(height: 20.0),
              const Text(
                'Succès !',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Vous participez à l\'activité',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 50.0),
              const SizedBox(height: 30),
              SizedBox(
                width: 320.0,
                height: 55.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Activity_Chat(chatInfos: widget.chatInfos)),
                    );
                  },
                  child: const Text(
                    'Accéder au chat',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFDDDDDD)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side:
                                  const BorderSide(color: Color(0xFFDDDDDD))))),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 320.0,
                height: 55.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child: const Text(
                    'Retour à l\'accueil',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF5AE999)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side:
                                  const BorderSide(color: Color(0xFF5AE999))))),
                ),
              )
            ],
          ),
        ));
  }
}
