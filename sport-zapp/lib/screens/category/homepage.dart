// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projet_sport_z/screens/category/recruter.dart';
import 'package:projet_sport_z/widgets/activities/activity_home.dart';
import 'package:projet_sport_z/widgets/menu.dart';
import 'package:projet_sport_z/utils/load_user_infos.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../widgets/activities/activity_home.dart';
import '../../widgets/navbar.dart';
import '../profil/subscribe.dart';
import 'decouvrir.dart';
import '../../widgets/activities/filters.dart';
import 'defier.dart';
import 'entrainer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  List<Widget> page = [
    const Decouvrir(),
    const Defier(),
    const Home(),
    const Entrainer(),
    const Recruter()
  ];
  int selectIndex = 0;
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

  void onPageChanged(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void onItemTap(int selectedItems) {
    pageController.jumpToPage(selectedItems);
  }

  Future getTheme() async {
    var savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      setState(() {
        darkmode = true;
        colorTheme = Color(0xFFFAFAFA);
        backgroundColor = Color(0XFF101010);
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = Color(0XFF101010);
        backgroundColor = Color(0xFFFAFAFA);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getTheme();
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 190,
        backgroundColor: backgroundColor,
        elevation: 0,
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
                      return SizedBox(
                        width: 20,
                      );
                    }),
                    Text('Accueil',
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
                                  builder: (context) => Filters()));
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
      drawer: Menu(),
      body: SingleChildScrollView(
          child: StickyHeader(
        header: userInfos["is_premium"] != 1
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: backgroundColor),
                child: Container(
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: backgroundColor,
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
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: BorderSide(color: Colors.transparent))),
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
                                          -35.0, -25.0, 0.0),
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
                                        -40.0, -5.0, 0.0),
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
            : SizedBox(),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Activity(),
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
      bottomNavigationBar: Navbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
