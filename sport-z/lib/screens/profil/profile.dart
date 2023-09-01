import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_sport_z/screens/profil/settings.dart';
import 'package:projet_sport_z/screens/profil/subscribe.dart';
import 'package:projet_sport_z/widgets/user/profile_picture.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:projet_sport_z/utils/load_user_infos.dart';
import '../../widgets/menu.dart';
import 'account_security.dart';
import '../opening.dart';
import './editProfile.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, required Map this.userInfos}) : super(key: key);
  Map userInfos;
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? background;
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
        background = const Color(0XFF101010);
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = const Color(0XFF101010);
        background = const Color(0xFFFAFAFA);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getTheme();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: colorTheme),
          centerTitle: true,
          title: Text(
            'Mon profil',
            style: TextStyle(
                color: colorTheme,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: background,
        ),
        drawer: const Menu(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
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
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Container(
                            width: 30.0,
                            height: 30.0,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xFFFF9B2A),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(59, 54, 54, 54),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                                "assets/images/icons/profile/exclamation.svg")),
                        const SizedBox(width: 15.0),
                        const Expanded(
                          child: Text(
                            'Veuillez compléter votre profil en cliquant sur modifier mon profil',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFFFF9B2A)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/ellipse.png',
                          width: 130,
                          height: 130,
                        ),
                        if (FirebaseAuth.instance.currentUser != null) ...[
                          Profile_Picture(
                              uid: FirebaseAuth.instance.currentUser!.uid,
                              radius: 60),
                          userInfos["is_premium"] == 1
                              ? Positioned(
                                  top: -12,
                                  left: 100,
                                  child: Image.asset(
                                    'assets/images/crown.png',
                                    width: 85,
                                    height: 85,
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.userInfos["pseudo"],
                  style: const TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600),
                ),
                // const SizedBox(height: 10.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     Text(
                //       '22 ans',
                //       style: TextStyle(fontSize: 16.0, color: Colors.grey),
                //     ),
                //     Text(
                //       ' | ',
                //       style: TextStyle(fontSize: 16.0, color: Colors.grey),
                //     ),
                //     Text(
                //       'Marseille',
                //       style: TextStyle(fontSize: 16.0, color: Colors.grey),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 20.0),
                Text(
                  widget.userInfos["description"].toString(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFDEDEDE)))),
                    child: Row(
                      children: [
                        Container(
                            width: 50.0,
                            height: 50.0,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF5AE999),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(94, 90, 233, 152),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                                "assets/images/icons/profile/id.svg")),
                        const SizedBox(width: 40.0),
                        const Text('Modifier mon profil'),
                        const Spacer(),
                        SvgPicture.asset((darkmode == true)
                            ? "assets/images/icons/darkmode/chevron_2.svg"
                            : "assets/images/icons/profile/chevron.svg"),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFDEDEDE)))),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 50.0,
                            height: 50.0,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF5AE999),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(85, 90, 233, 152),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                                "assets/images/icons/profile/password.svg")),
                        const SizedBox(width: 40.0),
                        const Text('Sécurité du compte'),
                        const Spacer(),
                        SvgPicture.asset((darkmode == true)
                            ? "assets/images/icons/darkmode/chevron_2.svg"
                            : "assets/images/icons/profile/chevron.svg"),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountSecurity()),
                    );
                  },
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFDEDEDE)))),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 50.0,
                            height: 50.0,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF5AE999),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(85, 90, 233, 152),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                                "assets/images/icons/profile/tag.svg")),
                        const SizedBox(width: 40.0),
                        const Text('Gérer mon abonnement'),
                        const Spacer(),
                        SvgPicture.asset((darkmode == true)
                            ? "assets/images/icons/darkmode/chevron_2.svg"
                            : "assets/images/icons/profile/chevron.svg"),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Subscribe()),
                    );
                  },
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFDEDEDE)))),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 50.0,
                            height: 50.0,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF5AE999),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(85, 90, 233, 152),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                                "assets/images/icons/profile/logout.svg")),
                        const SizedBox(width: 40.0),
                        const Text('Déconnexion'),
                        const Spacer(),
                        SvgPicture.asset((darkmode == true)
                            ? "assets/images/icons/darkmode/chevron_2.svg"
                            : "assets/images/icons/profile/chevron.svg"),
                      ],
                    ),
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Authentication()),
                        (route) => false);
                  },
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFDEDEDE)))),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 50.0,
                            height: 50.0,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF5AE999),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(85, 90, 233, 152),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                                "assets/images/icons/profile/settings.svg")),
                        const SizedBox(width: 40.0),
                        const Text('Autres paramètres'),
                        const Spacer(),
                        SvgPicture.asset((darkmode == true)
                            ? "assets/images/icons/darkmode/chevron_2.svg"
                            : "assets/images/icons/profile/chevron.svg"),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
