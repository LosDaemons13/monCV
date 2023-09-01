import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:projet_sport_z/routes/routes.dart';
import 'package:projet_sport_z/screens/category/homepage.dart';
import 'package:projet_sport_z/screens/opening.dart';
import 'package:projet_sport_z/screens/pro/profile.dart';
import 'screens/opening.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projet_sport_z/utils/load_user_infos.dart';

// lance un firebase initializeApp lorsque l'appli recoit une notif alors qu'elle est en background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    description: 'this channel is used for notifications');

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  String? userType = FirebaseAuth.instance.currentUser == null
      ? null
      : await getUserType(FirebaseAuth.instance.currentUser!.uid);
  if (userType != null) {
    await setUserInfos(userType);
  }
  runApp(MyApp(
    userType: userType,
  ));
}

class MyApp extends StatelessWidget {
  // function start application
  MyApp({Key? key, this.userType}) : super(key: key);
  String? userType;
  @override
  Widget build(BuildContext context) {
    late Widget home;
    if (userType == null) {
      home = const Authentication();
    } else {
      home = userType == "pro" ? ProfilePro() : Home();
    }
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return AdaptiveTheme(
        light: ThemeData(
            fontFamily: 'Outfit',
            canvasColor: const Color(0XFFFAFAFA),
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0XFFFAFAFA),
            backgroundColor: const Color(0XFFFAFAFA),
            bottomAppBarColor: const Color(0XFFFAFAFA),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0XFFFAFAFA),
            )),
        dark: ThemeData(
          fontFamily: 'Outfit',
          canvasColor: const Color(0XFF101010),
          scaffoldBackgroundColor: const Color(0XFF101010),
          backgroundColor: const Color(0XFF101010),
          bottomAppBarColor: const Color(0XFF101010),
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0XFF101010),
          ),
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              initialRoute: RouteManager.homePage,
              onGenerateRoute: RouteManager.generateRoute,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('fr', '')],
              debugShowCheckedModeBanner: false,
              theme: theme,
              home: home,
            ));
  }
}
