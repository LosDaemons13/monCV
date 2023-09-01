// ignore_for_file: unused_import

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projet_sport_z/screens/category/homepage.dart';
import 'package:projet_sport_z/widgets/navbar_pro.dart';

import '../../widgets/activities/activity_home.dart';
import '../../widgets/activities/filters.dart';
import '../../widgets/menu.dart';
import '../../widgets/navbar.dart';
import '../../widgets/activities/activity_category.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  bool darkmode = false;
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
        backgroundColor = const Color(0xFF403030);
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = const Color(0xFF101020);
        backgroundColor = const Color(0xFFFAFAFA);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: <Widget>[
          Column(
            children: [
              Container(
                width: 380,
                margin: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Mes évènements',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            color: colorTheme)),
                  ],
                ),
              ),
              Container(
                width: 360,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 25.0,
                        color: Color.fromRGBO(90, 233, 153, 0.52)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      drawer: const Menu(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ActivitiesCategory(i: 1),
      )),
      floatingActionButton: SizedBox.fromSize(
        size: const Size.square(80),
        child: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const Home()),
            // );
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
