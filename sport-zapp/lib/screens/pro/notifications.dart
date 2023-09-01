import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/notification.dart';
import '../../widgets/navbar_pro.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(color: Color(0XFF101010)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
      ),
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
          SizedBox(height: 50.0),
        ],
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
