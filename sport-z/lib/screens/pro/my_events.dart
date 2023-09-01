import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/activities/activities.dart';
import '../../widgets/activities/activities_participation.dart';
import '../../widgets/events/upcoming_events.dart';
import '../../widgets/navbar_pro.dart';
import '../../widgets/events/event_history.dart';

final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class TabEvents extends StatefulWidget {
  const TabEvents({Key? key}) : super(key: key);

  @override
  _TabEventsState createState() => _TabEventsState();
}

class _TabEventsState extends State<TabEvents>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
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
        backgroundColor = const Color(0xFF303030);
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
        iconTheme: IconThemeData(color: colorTheme),
        title: Text(
          "Mes évènements",
          style: TextStyle(
              color: colorTheme,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF5AE999),
          labelStyle: const TextStyle(
              fontSize: 16.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w700),
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
              color: backgroundColor,
              border: const Border(
                  // ignore: unnecessary_const
                  bottom: const BorderSide(
                      width: 2, color: const Color(0xFF5AE999)))),
          indicatorColor: const Color(0xFFFAFAFA),
          tabs: const [
            Tab(
              child: Text(
                'À venir',
                style: TextStyle(
                    fontFamily: 'Outfit', fontWeight: FontWeight.w500),
              ),
            ),
            Tab(
              child: Text(
                'Passés',
                style: TextStyle(
                    fontFamily: 'Outfit', fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
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
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
                child: Column(children: [
              Builder(builder: (context) {
                return const SizedBox(height: 40);
              }),
              const EventsHisto()
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
