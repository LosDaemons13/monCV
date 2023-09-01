import 'package:flutter/material.dart';
import 'package:projet_sport_z/screens/category/homepage.dart';

class ConfirmationDesinscription extends StatelessWidget {
  const ConfirmationDesinscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Color(0XFF101010)),
          backgroundColor: const Color(0xFFFAFAFA),
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
                'Vous ne participez plus à l\'activité',
                style: TextStyle(fontSize: 16.0),
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
