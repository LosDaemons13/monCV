import 'package:flutter/material.dart';
import 'package:projet_sport_z/screens/signUp/sign_up.dart';
import 'package:projet_sport_z/screens/signUp/sign_up_pro.dart';

class SubProfile extends StatefulWidget {
  // function calls LoginProfileState
  const SubProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SubProfileState();
  }
}

class SubProfileState extends State<SubProfile> {
  // function page I am for inscription
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          leading: const BackButton(color: Color(0xFFB4B4B4)),
          backgroundColor: const Color(0xFFFAFAFA),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Je suis...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    )
                  },
                  child: Stack(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(47, 0, 0, 0),
                                blurRadius: 15,
                                offset: Offset(0, 8), // Shadow position
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              Expanded(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: Image(
                                          width: 200,
                                          image: AssetImage(
                                              'assets/images/player.png')),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Un joueur',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
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
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPro()),
                    )
                  },
                  child: Stack(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(47, 0, 0, 0),
                                blurRadius: 15,
                                offset: Offset(0, 8), // Shadow position
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              Expanded(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: Image(
                                          width: 200,
                                          image: AssetImage(
                                              'assets/images/pro.png')),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Un professionnel',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
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
                  height: 50,
                )
              ],
            ),
          ),
        ));
  }
}
