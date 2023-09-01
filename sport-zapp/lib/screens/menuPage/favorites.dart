import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/activities/favorites.dart';
import '../../widgets/menu.dart';
import '../../widgets/navbar.dart';
import '../category/homepage.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Mes favoris",
          style: TextStyle(
              color: colorTheme,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: colorTheme),
        backgroundColor: backgroundColor,
      ),
      drawer: const Menu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ActivitiesWidget(
                uid: FirebaseAuth.instance.currentUser!.uid,
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
