import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_sport_z/screens/opening.dart';
import 'package:projet_sport_z/screens/pro/my_events.dart';
import 'package:projet_sport_z/screens/profil/account_security_pro.dart';
import 'package:projet_sport_z/utils/load_user_infos.dart';
import 'package:projet_sport_z/widgets/user/profile_picture.dart';
import '../../widgets/navbar_pro.dart';
import 'package:projet_sport_z/screens/profil/settings.dart';
import '../create_event.dart';
import '../profil/account_security.dart';
import 'editProfilePro.dart';

class ProfilePro extends StatefulWidget {
  const ProfilePro({Key? key}) : super(key: key);

  @override
  _ProfilePro createState() => _ProfilePro();
}

class _ProfilePro extends State<ProfilePro> {
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
    if (userInfos["company_name"] == null) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Profil professionnel',
            style: TextStyle(
                color: colorTheme,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: background,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 50),
            child: Column(
              children: [
                Column(
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(
                            backgroundColor: Color(0XFFB4B4B4),
                            color: Color(0XFF5AE999),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Chargement...'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox.fromSize(
          size: const Size.square(80),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateEvent()),
              );
              return;
            },
            child: SvgPicture.asset(
              "assets/images/icons/bottom-navbar/plus.svg",
              color: Colors.black,
            ),
            backgroundColor: const Color(0xFF5AE999),
          ),
        ),
        bottomNavigationBar: const NavbarPro(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profil professionnel',
          style: TextStyle(
              color: colorTheme,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Dark mode',
                      style: TextStyle(fontSize: 14, color: Color(0xFFB4B4B4))),
                  Switch(
                    value: darkmode,
                    onChanged: (value) {
                      if (value == true) {
                        AdaptiveTheme.of(context).setDark();
                      } else {
                        AdaptiveTheme.of(context).setLight();
                      }
                      setState(() {
                        darkmode = value;
                      });
                    },
                    activeTrackColor: const Color.fromRGBO(90, 233, 152, 0.4),
                    activeColor: const Color(0xFF5AE999),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(47, 56, 56, 56),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
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
                          radius: 60,
                        )
                      ]
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                userInfos["company_name"],
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userInfos["company_adress"],
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                userInfos["description"],
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                width: 320.0,
                height: 55.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateEvent()),
                    );
                    return;
                  },
                  icon:
                      SvgPicture.asset("assets/images/icons/profile/plus.svg"),
                  label: const Text(
                    'Créer un évènement',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 20,
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
              ),
              const SizedBox(height: 40.0),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFDEDEDE)))),
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
                              "assets/images/icons/profile/calendar.svg")),
                      const SizedBox(width: 40.0),
                      const Text('Mes évènements'),
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
                    MaterialPageRoute(builder: (context) => const TabEvents()),
                  );
                  return;
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFDEDEDE)))),
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
                      const Text('Modifier le profil'),
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
                        builder: (context) => EditProfilePro(
                            userData: {"id": userInfos["id_user"]})),
                  );
                  return;
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFDEDEDE)))),
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
                        builder: (context) => const AccountSecurityPro()),
                  );
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFDEDEDE)))),
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
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFDEDEDE)))),
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
                  return;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox.fromSize(
        size: const Size.square(80),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateEvent()),
            );
            return;
          },
          child: SvgPicture.asset(
            "assets/images/icons/bottom-navbar/plus.svg",
            color: Colors.black,
          ),
          backgroundColor: const Color(0xFF5AE999),
        ),
      ),
      bottomNavigationBar: const NavbarPro(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
