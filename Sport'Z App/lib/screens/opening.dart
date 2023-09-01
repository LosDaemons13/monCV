// ignore_for_file: unnecessary_const
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projet_sport_z/main.dart';
import 'package:projet_sport_z/screens/iAm/subscription_am.dart';
import 'package:projet_sport_z/screens/iAm/login_am.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  // function calls AuthenticationStaate
  const Authentication({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AuthenticationState();
  }
}

class AuthenticationState extends State<Authentication> {
  // function first page
  late String password;
  late String pseudo;
  late String connectionError = "";

  @override
  void initState() {
    // TODO: implement initState
    FirebaseMessaging.onMessage.listen((event) {
      RemoteNotification? notification = event.notification;
      AndroidNotification? android = event.notification!.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description)));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      RemoteNotification? notification = event.notification;
      AndroidNotification? android = event.notification!.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title ?? "null"),
                content: Column(
                  children: [Text(notification.body ?? "null")],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C2544),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/opening-image.png',
                    ),
                  ),
                ),
              ),
              Container(
                height: 560.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          const Color(0xFF0C2544).withOpacity(0.6),
                          const Color(0xFF0C2544),
                        ],
                        stops: const [
                          0.0,
                          1.0
                        ])),
                child: const Image(
                  image: AssetImage(
                    'assets/images/z-logo.png',
                  ),
                ),
              ),
              const Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(top: 275.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Bienvenue !',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFAFAFA),
                        fontSize: 38,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(top: 380.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Color(0xFFFAFAFA),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'The power of '),
                          TextSpan(
                            text: 'minds',
                            style: TextStyle(color: Color(0xFF5AE999)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 30),
            SizedBox(
              width: 320.0,
              height: 55.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SubProfile()),
                  );
                },
                child: const Text(
                  'S\'inscrire',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF5AE999)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Color(0xFF5AE999))))),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 320.0,
              height: 55.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginProfile()),
                  );
                },
                child: const Text(
                  'Se connecter',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFAFAFA),
                    fontSize: 22,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF0C2544)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Color(0xFFFAFAFA))))),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
