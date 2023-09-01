import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projet_sport_z/widgets/events/event_history.dart';
import '../../widgets/navbar_pro.dart';

class HistoryEvents extends StatefulWidget {
  const HistoryEvents({Key? key}) : super(key: key);

  @override
  _HistoryEventState createState() => _HistoryEventState();
}

class _HistoryEventState extends State<HistoryEvents>
    with SingleTickerProviderStateMixin {
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
          "Mon historique",
          style: TextStyle(
              color: colorTheme,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          Builder(builder: (context) {
            return const SizedBox(height: 40);
          }),
          const EventsHisto()
        ]),
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
