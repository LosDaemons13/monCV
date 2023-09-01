// ignore_for_file: must_be_immutable, type_init_formals

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projet_sport_z/screens/confirmation_participation.dart';
import 'package:projet_sport_z/screens/confirmation_desinscription.dart';
import 'package:projet_sport_z/screens/user_profile.dart';
import 'package:projet_sport_z/widgets/map.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';
import 'package:projet_sport_z/widgets/user/profile_picture.dart';
import '../../configs/connection_bdd.dart';

class EventDetails extends StatefulWidget {
  EventDetails({Key? key, required Map this.event}) : super(key: key);
  Map event;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
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
                          'assets/images/${widget.event["sport"]}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                      text: "Retour ",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.pop(context)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 283),
                  width: 428,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
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
                                  widget.event["sport"],
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
                                  child: RatingBarIndicator(
                                    rating: widget.event["rating"].toDouble(),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Color(0xFF5AE999),
                                    ),
                                    itemCount: 5,
                                    itemSize: 25.0,
                                    direction: Axis.horizontal,
                                  ),
                                ),
                              ],
                            ),
                            LikeButton(
                              isLiked: widget.event["is_favorite"],
                              onTap: (isLiked) {
                                return updateFavorite(
                                    widget.event["id_event"], isLiked);
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
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.event["title"],
                                style: const TextStyle(
                                  color: Color(0xFF101010),
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
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.people,
                                      size: 18,
                                      color: Color(0xFF8F8F8F),
                                    ),
                                  ),
                                  TextSpan(
                                      text:
                                          " ${widget.event["nb_participants"]}/${widget.event["nb_participants_max"]}",
                                      style: const TextStyle(
                                          color: Color(0xFF8F8F8F))),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.access_time,
                                      size: 18,
                                      color: Color(0xFF8F8F8F),
                                    ),
                                  ),
                                  TextSpan(
                                      text: " " +
                                          DateFormat('dd/MM -').add_Hm().format(
                                              widget.event["begin_date"]),
                                      style: const TextStyle(
                                          color: Color(0xFF8F8F8F))),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.euro,
                                        size: 18,
                                        color: Color(0xFF8F8F8F),
                                      ),
                                    ),
                                    TextSpan(
                                        text: " ${widget.event["price"]}",
                                        style: const TextStyle(
                                            color: Color(0xFF8F8F8F))),
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
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: Color(0xFF8F8F8F),
                                      ),
                                    ),
                                    TextSpan(
                                        text: widget.event["address"],
                                        style: const TextStyle(
                                            color: Color(0xFF8F8F8F))),
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
                                "${widget.event["description"]}",
                                style: const TextStyle(
                                    fontSize: 18, color: Color(0xFF707070)),
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
                                height: 245, width: 320, child: MapDetail(address: widget.event["address"],));
                          })
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 26.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Builder(builder: (context) {
                              return SizedBox(
                                width: 320.0,
                                height: 55.0,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    //TODO : CHANGE 173 BY CURRENT USERID
                                    await addParticipant(
                                        FirebaseAuth.instance.currentUser!.uid,
                                        widget.event["id_event"]);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ConfirmationParticipation(
                                                  chatInfos: {
                                                    "id": widget
                                                        .event["id_event"]
                                                        .toString(),
                                                    "title":
                                                        widget.event["title"]
                                                  })),
                                    );
                                  },
                                  child: const Text(
                                    'Voir les participants',
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
                                                  color: Color(0xFF5AE999))))),
                                ),
                              );
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
