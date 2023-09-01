import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/menu.dart';
import '../../utils/notification.dart';
import '../../widgets/navbar.dart';
import '../category/homepage.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
    bool isSwitched = false;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorTheme),
        title: Text(
          "Notifications",
          style: TextStyle(color: colorTheme),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      drawer: const Menu(),
      body: ListView(
        children: const [
          Notif(),
          Notif(),
          Notif(),
          Notif(),
          Notif(),
          Notif(),
          Notif(),
          Notif(),
          Notif(),
          Notif(),
        ],
      ),
      floatingActionButton: SizedBox.fromSize(
        size: const Size.square(80),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          child: SvgPicture.asset(
            "assets/images/icons/bottom-navbar/home.svg",
            color: Colors.black,
          ),
          backgroundColor: const Color(0xFF5AE999),
        ),
      ),
      bottomNavigationBar: const Navbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
