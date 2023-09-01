import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../utils/load_user_infos.dart';
import '../../widgets/activities/filters.dart';
import '../../widgets/menu.dart';
import '../../widgets/navbar.dart';
import '../../widgets/activities/activity_category.dart';
import '../profil/subscribe.dart';
import 'homepage.dart';

class Entrainer extends StatefulWidget {
  const Entrainer({Key? key}) : super(key: key);

  @override
  _EntrainerState createState() => _EntrainerState();
}

class _EntrainerState extends State<Entrainer> {
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? backgroundColor;

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
        backgroundColor = const Color(0XFF101010);
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = const Color(0XFF101010);
        backgroundColor = const Color(0xFFFAFAFA);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getTheme();
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 190,
        elevation: 0,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: colorTheme),
        actions: <Widget>[
          Column(
            children: [
              Container(
                width: 380,
                margin: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(builder: (context) {
                      return const SizedBox(
                        width: 20,
                      );
                    }),
                    Text('S\'entrainer',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            color: colorTheme)),
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(90, 233, 153, 1),
                      child: IconButton(
                        icon:
                            SvgPicture.asset('assets/images/icons/filters.svg'),
                        tooltip: "Save Todo and Retrun to List",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Filters()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const Menu(),
      body: SingleChildScrollView(
          child: StickyHeader(
        header: userInfos["is_premium"] != 1
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: Container(
                    width: 360,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 25.0,
                            color: Color.fromRGBO(90, 233, 153, 0.52)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      side: const BorderSide(
                                          color: Colors.transparent))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF5AE999)),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Subscribe()));
                        },
                        child: Stack(
                          children: [
                            Wrap(children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      transform: Matrix4.translationValues(
                                          -35.0, -30.0, 0.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/crown.png',
                                            width: 200,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    transform: Matrix4.translationValues(
                                        -40.0, -13.0, 0.0),
                                    child: Column(children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Offre premium',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(
                                                  16, 16, 16, 1)),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '\nDevenez membre premium pour\nseulement 2,99€ / mois',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      16, 16, 16, 1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ])
                          ],
                        ),
                      ),
                    )),
              )
            : const SizedBox(),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ActivitiesCategory(i: 4),
        ),
      )),
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
