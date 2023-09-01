// ignore_for_file: avoid_print

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/pro/profile.dart';
import '../screens/pro/notifications.dart';

class NavbarPro extends StatefulWidget {
  const NavbarPro({Key? key}) : super(key: key);

  @override
  _NavbarPro createState() => _NavbarPro();
}

class _NavbarPro extends State<NavbarPro> {
  //List<String> _titles = ["Home", "Profile", "Shop"];
  List<Widget> page = [
    const Notifications(),
    const ProfilePro(),
  ];
  int selectIndex = 0;
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? colorTheme2;
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
        colorTheme2 = const Color(0xFFFAFAFA);
        backgroundColor = const Color(0XFF101010);
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = const Color(0xFF0C2544);
        backgroundColor = const Color(0xFFFAFAFA);
      });
    }
  }

  void onPageChanged(int index) {
    if (index >= 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => page[index - 1]));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => page[index]));
    }
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromARGB(127, 70, 70, 70),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: BottomNavigationBar(
            onTap: onPageChanged,
            currentIndex: selectIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundColor,
            unselectedLabelStyle:
                const TextStyle(fontSize: 12, color: Color(0xFF0C2544)),
            selectedLabelStyle:
                const TextStyle(fontSize: 12, color: Color(0xFF0C2544)),
            selectedItemColor: (darkmode == true)
                ? const Color(0xFFFAFAFA)
                : const Color(0xFF0C2544),
            unselectedItemColor: colorTheme,
            items: [
              BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 27,
                    height: 27,
                    child: SvgPicture.asset(
                      (darkmode == true)
                          ? "assets/images/icons/darkmode/notification_2.svg"
                          : "assets/images/icons/bottom-navbar/notification.svg",
                      semanticsLabel: 'Acme Logo',
                    ),
                  ),
                  label: 'Notifications'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 27,
                    height: 27,
                    child: SvgPicture.asset(
                      (darkmode == true)
                          ? "assets/images/icons/darkmode/profile_2.svg"
                          : "assets/images/icons/bottom-navbar/profile.svg",
                      semanticsLabel: 'Acme Logo',
                    ),
                  ),
                  label: 'Profil'),
            ]),
      ),
    );
  }
}
