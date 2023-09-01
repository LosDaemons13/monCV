// ignore_for_file: must_be_immutable, type_init_formals

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projet_sport_z/screens/category/homepage.dart';
import 'package:projet_sport_z/screens/confirmation_participation.dart';
import 'package:projet_sport_z/utils/string_extension.dart';
import 'package:projet_sport_z/widgets/activities/rating_bar_detail.dart';
import 'package:projet_sport_z/screens/confirmation_desinscription.dart';
import 'package:projet_sport_z/screens/email_verification.dart';
import 'package:projet_sport_z/screens/activity_chat.dart';
import 'package:projet_sport_z/screens/user_profile.dart';
import 'package:projet_sport_z/widgets/map.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';
import 'package:projet_sport_z/widgets/user/profile_picture.dart';
import '../../configs/connection_bdd.dart';

class ActivityDetails extends StatefulWidget {
  ActivityDetails({Key? key, required Map this.activity}) : super(key: key);
  Map activity;

  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  bool buttonActivated = true;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 395,
                  width: 428,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/${widget.activity["sport"]}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(92, 51, 51, 51),
                                spreadRadius: 2,
                                offset: Offset(0, 2),
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        size: 14,
                                        color: Color(0xFFFAFAFA),
                                      ),
                                    ),
                                    TextSpan(
                                        text: "Retour ",
                                        style: const TextStyle(
                                            color: Color(0xFFFAFAFA),
                                            fontSize: 14.0),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () =>
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Home()),
                                                  (route) => false)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(children: [
                          Stack(
                            children: [
                              Image.asset(
                                'assets/images/ellipse.png',
                                width: 58,
                                height: 58,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserProfile(
                                            uid: widget.activity["id_user"])),
                                  );
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 2, top: 2),
                                  child: Profile_Picture(
                                    uid: widget.activity["id_user"],
                                    radius: 27,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 283),
                  width: 428,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${widget.activity["sport"]}'.capitalize(),
                                  style: TextStyle(
                                      color: const Color(0xFF020202),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      background: Paint()
                                        ..strokeWidth = 20.0
                                        ..color = const Color(0xFF5AE999)
                                        ..style = PaintingStyle.stroke
                                        ..strokeJoin = StrokeJoin.round),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: RatingBarDetail(
                                      rating: widget.activity["rating"]),
                                ),
                              ],
                            ),
                            if (widget.activity["id_user"] !=
                                FirebaseAuth.instance.currentUser!.uid) ...[
                              LikeButton(
                                isLiked: widget.activity["is_favorite"],
                                onTap: (isLiked) {
                                  return updateFavorite(
                                      widget.activity["id_activity"], isLiked);
                                },
                                size: 35,
                                circleColor: const CircleColor(
                                    start: Color(0xFFE8062F),
                                    end: Color(0xFFF34263)),
                                bubblesColor: const BubblesColor(
                                  dotPrimaryColor: Color(0xFFE8062F),
                                  dotSecondaryColor: Color(0xFFF34263),
                                ),
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isLiked
                                        ? const Color(0xFFE8062F)
                                        : const Color(0xFFFAFAFA),
                                    size: 35,
                                  );
                                },
                              )
                            ],
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                '${widget.activity["title"]}'.capitalize(),
                                style: TextStyle(
                                  color: colorTheme,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.people,
                                      size: 18,
                                      color: greyColor,
                                    ),
                                  ),
                                  TextSpan(
                                      text:
                                          " ${widget.activity["nb_participants"]}/${widget.activity["nb_participants_max"]}",
                                      style: TextStyle(color: greyColor)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.access_time,
                                      size: 18,
                                      color: greyColor,
                                    ),
                                  ),
                                  TextSpan(
                                      text: " " +
                                          DateFormat('dd/MM -').add_Hm().format(
                                              widget.activity["begin_date"]),
                                      style: TextStyle(color: greyColor)),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.euro,
                                        size: 18,
                                        color: greyColor,
                                      ),
                                    ),
                                    TextSpan(
                                        text: " ${widget.activity["price"]}",
                                        style: TextStyle(color: greyColor)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.visible,
                                text: TextSpan(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: greyColor,
                                      ),
                                    ),
                                    TextSpan(
                                        text: widget.activity["address"],
                                        style: TextStyle(color: greyColor)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              child: Text(
                                "${widget.activity["description"]}",
                                style:
                                    TextStyle(fontSize: 18, color: greyColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(builder: (context) {
                            return SizedBox(
                                height: 245,
                                width: 320,
                                child: MapDetail(
                                    address: widget.activity["address"]));
                          })
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 26.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Builder(builder: (context) {
                              buttonEnabled =
                                  widget.activity["nb_participants"] <
                                          widget.activity["nb_participants_max"]
                                      ? true
                                      : false;
                              if (!widget.activity["is_participant"]) {
                                return SizedBox(
                                  width: 320.0,
                                  height: 55.0,
                                  child: ElevatedButton(
                                    onPressed: buttonEnabled
                                        ? () async {
                                            await addParticipant(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                widget.activity["id_activity"]);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ConfirmationParticipation(
                                                          chatInfos: {
                                                            "id": widget
                                                                .activity[
                                                                    "id_activity"]
                                                                .toString(),
                                                            "title":
                                                                widget.activity[
                                                                    "title"]
                                                          })),
                                            );
                                          }
                                        : null,
                                    child: const Text(
                                      'Je veux participer',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xFF5AE999)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: const BorderSide(
                                                    color:
                                                        Color(0xFF5AE999))))),
                                  ),
                                );
                              } else {
                                return Column(
                                  children: [
                                    SizedBox(
                                      width: 320.0,
                                      height: 55.0,
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Activity_Chat(
                                                      chatInfos: {
                                                        "id": widget.activity[
                                                                "id_activity"]
                                                            .toString(),
                                                        "title": widget
                                                            .activity["title"]
                                                      },
                                                    )),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.chat_bubble_outline_rounded,
                                          size: 24.0,
                                          color: Colors.black,
                                        ),
                                        label: const Text(
                                          'Accéder au chat',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontSize: 22,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    const Color(0xFF5AE999)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: const BorderSide(
                                                        color: Color(
                                                            0xFF5AE999))))),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    SizedBox(
                                      width: 320.0,
                                      height: 55.0,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await deleteParticipant(
                                              FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              widget.activity["id_activity"]);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Home()),
                                          );
                                        },
                                        child: const Text(
                                          'Me désinscrire',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontSize: 22,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    const Color(0xFFB4B4B4)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: const BorderSide(
                                                        color: Color(
                                                            0xFFB4B4B4))))),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
