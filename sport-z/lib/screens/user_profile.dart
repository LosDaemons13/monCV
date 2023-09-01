import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:projet_sport_z/widgets/activities/activities.dart';
import 'package:projet_sport_z/widgets/user/favorite_sports.dart';
import 'package:projet_sport_z/widgets/user/profile_picture.dart';
import '../widgets/menu.dart';
import '../widgets/activities/activity_home.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key, required this.uid}) : super(key: key);
  String uid;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
    Future<Map> userInfos = getUserInfos(widget.uid);
    return FutureBuilder<Map>(
        future: userInfos,
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          Widget widget;
          if (snapshot.hasData) {
            Map? data = snapshot.data;
            widget = Scaffold(
                appBar: AppBar(
                    elevation: 0,
                    iconTheme: IconThemeData(color: colorTheme),
                    backgroundColor: backgroundColor),
                drawer: const Menu(),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              size: 14,
                                              color: colorTheme,
                                            ),
                                          ),
                                          TextSpan(
                                              text: "Retour ",
                                              style: TextStyle(
                                                color: colorTheme,
                                                fontSize: 14.0,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () =>
                                                    Navigator.pop(context)),
                                        ],
                                      ),
                                    ),
                                  )),
                              const Spacer(),
                              PopupMenuButton(
                                  icon: Icon(
                                    Icons.more_horiz,
                                    color: colorTheme,
                                  ),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: InkWell(
                                            child: const Text(
                                                "Signaler le compte"),
                                            onTap: () {},
                                          ),
                                          value: 1,
                                        ),
                                      ]),
                            ],
                          ),
                        ]),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/ellipse.png',
                                  width: 130,
                                  height: 130,
                                ),
                                Profile_Picture(uid: data!["uid"], radius: 60),
                                data["is_premium"] == 1
                                    ? Positioned(
                                        top: -12,
                                        left: 100,
                                        child: Image.asset(
                                          'assets/images/crown.png',
                                          width: 85,
                                          height: 85,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Center(
                          child: Text(
                            data["pseudo"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22.0),
                          ),
                        ),
                        // const SizedBox(height: 10.0),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: const [
                        //     Text(
                        //       '22 ans',
                        //       style:
                        //           TextStyle(fontSize: 16.0, color: Colors.grey),
                        //     ),
                        //     Text(
                        //       ' | ',
                        //       style:
                        //           TextStyle(fontSize: 16.0, color: Colors.grey),
                        //     ),
                        //     Text(
                        //       'Marseille',
                        //       style:
                        //           TextStyle(fontSize: 16.0, color: Colors.grey),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 20.0),
                        Center(
                          child: Text(
                            data["description"].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        const Text(
                          'Mes activités favorites',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0),
                        ),
                        Favorite_Sports(uid: data["uid"]),
                        const SizedBox(height: 40.0),
                        const Text(
                          'Mes activités',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0),
                        ),
                        const SizedBox(height: 20.0),
                        ActivitiesWidget(
                          uid: data["uid"],
                        ),
                      ],
                    ),
                  ),
                ));
          } else {
            widget = Scaffold(
              appBar: AppBar(
                elevation: 0,
                iconTheme: IconThemeData(color: colorTheme),
                backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
              ),
              body: Column(
                children: const [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0XFFB4B4B4),
                          color: Color(0XFF5AE999),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Chargement...'),
                  ),
                ],
              ),
            );
          }
          return widget;
        });
  }
}
