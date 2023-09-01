import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projet_sport_z/widgets/activities/activities_participation.dart';
import 'package:projet_sport_z/widgets/menu.dart';
import 'package:projet_sport_z/widgets/navbar.dart';
import 'package:projet_sport_z/widgets/activities/activities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../category/homepage.dart';

final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class TabMyActivities extends StatefulWidget {
  const TabMyActivities({Key? key}) : super(key: key);

  @override
  _TabMyActivitiesState createState() => _TabMyActivitiesState();
}

class _TabMyActivitiesState extends State<TabMyActivities>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? greyColor;
  Color? backgroundColor;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
        iconTheme: IconThemeData(color: colorTheme),
        title: Text(
          "Mes activités",
          style: TextStyle(color: colorTheme, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF5AE999),
          labelStyle:
              const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
              color: backgroundColor,
              border: const Border(
                  bottom: BorderSide(width: 2, color: Color(0xFF5AE999)))),
          indicatorColor: backgroundColor,
          tabs: const [
            Tab(
              child: Text(
                'Je propose',
                style: TextStyle(
                    fontFamily: 'Outfit', fontWeight: FontWeight.w500),
              ),
            ),
            Tab(
              child: Text(
                'Je participe',
                style: TextStyle(
                    fontFamily: 'Outfit', fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      drawer: const Menu(),
      body: Navigator(
        key: _navKey,
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (_) => TabBarView(
            controller: _tabController,
            children: const [
              FirstPage(),
              SecondPage(),
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

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
                child: Column(children: [
              Builder(builder: (context) {
                return const SizedBox(height: 40);
              }),
              ActivitiesWidget(uid: FirebaseAuth.instance.currentUser!.uid)
            ]))));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
                child: Column(children: [
              Builder(builder: (context) {
                return const SizedBox(height: 40);
              }),
              ParticipationsWidget(uid: FirebaseAuth.instance.currentUser!.uid)
            ]))));
  }
}

class SubFirstPage extends StatelessWidget {
  const SubFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Nested Page'),
      ),
      body: const Center(
        child: Text('From First Page'),
      ),
    );
  }
}

class SubSecondPage extends StatelessWidget {
  const SubSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Nested Page'),
      ),
      body: const Center(
        child: Text('From Second Page'),
      ),
    );
  }
}
