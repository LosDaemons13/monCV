import 'package:flutter/material.dart';
import 'package:projet_sport_z/screens/backoffice/signalements.dart';
import 'package:projet_sport_z/screens/backoffice/users.dart';
import 'package:projet_sport_z/screens/opening.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Tableau de bord',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFAFAFA),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                const SizedBox(
                    width: 150.0,
                    child: Image(
                        image: AssetImage('assets/images/logo-sportz.png'))),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Users()),
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              color: const Color(0xFF5AE999),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(50, 63, 63, 63),
                                  spreadRadius: 2,
                                  offset: Offset(0, 3),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: const Center(
                                child: Text(
                              'Gestion des utilisateurs',
                              textAlign: TextAlign.center,
                            )))),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signalements()),
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              color: const Color(0xFF5AE999),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(50, 63, 63, 63),
                                  spreadRadius: 2,
                                  offset: Offset(0, 3),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: const Center(
                                child: Text(
                              'Signalements activités',
                              textAlign: TextAlign.center,
                            )))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          return;
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 209, 209, 209),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(50, 63, 63, 63),
                                  spreadRadius: 2,
                                  offset: Offset(0, 3),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: const Center(
                                child: Text(
                              'Comptes profressionnels',
                              textAlign: TextAlign.center,
                            )))),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Authentication()),
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 233, 100, 90),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(50, 63, 63, 63),
                                  spreadRadius: 2,
                                  offset: Offset(0, 3),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.logout_outlined,
                                color: Colors.black,
                              ),
                            ))),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
