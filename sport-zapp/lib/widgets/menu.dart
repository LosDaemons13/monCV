// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_sport_z/screens/menupage/favorites.dart';
import 'package:projet_sport_z/screens/menupage/historique.dart';
import 'package:projet_sport_z/utils/load_user_infos.dart';
import 'package:projet_sport_z/screens/menupage/my_activities.dart';
import 'package:projet_sport_z/widgets/user/profile_picture.dart';
import '../screens/create_activity.dart';
import '../screens/menupage/notifications.dart';
import '../screens/profil/profile.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Map userInfos = {};
  ImageProvider pfp = const AssetImage('assets/images/defaultPfp.jpg');
  @override
  void initState() {
    super.initState();
    getTheme();
    populateUserInfos();
  }

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
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = const Color(0XFF101010);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getTheme();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 400,
            child: DrawerHeader(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/ellipse.png',
                            width: 130,
                            height: 140,
                          ),
                          if (FirebaseAuth.instance.currentUser != null) ...[
                            Profile_Picture(
                                uid: FirebaseAuth.instance.currentUser!.uid,
                                radius: 60),
                            userInfos["is_premium"] == 1
                                ? Positioned(
                                    top: 0,
                                    left: 55,
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
                  Container(
                    transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                    child: Text(
                      userInfos["pseudo"] ?? "",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(
                                    userInfos: userInfos,
                                  )),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF5AE999)),
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                      child: const Text('Afficher mon profil',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          const Text('Dark mode',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFFB4B4B4))),
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
                            activeTrackColor:
                                const Color.fromRGBO(90, 233, 152, 0.4),
                            activeColor: const Color(0xFF5AE999),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.add_box_outlined,
                  color: colorTheme,
                )),
            title: const Text(
              'Créer une nouvelle activité',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateActivity()));
            },
          ),
          ListTile(
            leading: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: colorTheme,
                )),
            title: const Text(
              'Notifications',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Notifications()),
              );
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset(
                (darkmode == true)
                    ? 'assets/images/icons/flash-dark.svg'
                    : 'assets/images/icons/flash.svg',
                semanticsLabel: 'Acme Logo',
              ),
            ),
            title: const Text(
              'Mes activités',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TabMyActivities()),
              );
            },
          ),
          ListTile(
            leading: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.favorite_border,
                  color: colorTheme,
                )),
            title: const Text(
              'Mes favoris',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favorites()),
              );
            },
          ),
          ListTile(
            leading: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.history,
                  color: colorTheme,
                )),
            title: const Text(
              'Mon historique',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TabActivities()),
              );
            },
          ),
        ],
      ),
    );
  }
}
