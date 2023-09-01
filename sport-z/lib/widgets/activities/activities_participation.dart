// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_sport_z/utils/string_extension.dart';
import 'package:projet_sport_z/widgets/activities/rating_bar_card.dart';
import 'package:projet_sport_z/widgets/activities/details_activity.dart';
import 'package:intl/intl.dart';
import '../../configs/connection_bdd.dart';

class ParticipationsWidget extends StatefulWidget {
  ParticipationsWidget({Key? key, required this.uid}) : super(key: key);
  String uid;
  @override
  State<ParticipationsWidget> createState() => _ParticipationsWidgetState();
}

class _ParticipationsWidgetState extends State<ParticipationsWidget> {
  @override
  Widget build(BuildContext context) {
    final Future<Map> activities = getParticipations(widget.uid);
    return Material(
      child: FutureBuilder<Map>(
        future: activities, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          List<Widget> children = [];
          if (snapshot.hasData) {
            for (var activityId in snapshot.data!.keys) {
              Map data = snapshot.data![activityId];
              children.add(Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ActivityDetails(activity: data)),
                      );
                    },
                    child: Stack(alignment: Alignment.bottomCenter, children: <
                        Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/${data["sport"]}.jpg',
                              ),
                            ),
                          ),
                          height: 245.0,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          height: 245.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.1),
                                    Colors.black,
                                  ],
                                  stops: const [
                                    0.0,
                                    1.0
                                  ])),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, bottom: 15.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '${data["sport"]}'.capitalize(),
                                      style: TextStyle(
                                          color: const Color(0xFF020202),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          background: Paint()
                                            ..strokeWidth = 20.0
                                            ..color = const Color(0xFF5AE999)
                                            ..style = PaintingStyle.stroke
                                            ..strokeJoin = StrokeJoin.round),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${data["title"]}'.capitalize(),
                                        style: const TextStyle(
                                          color: Color(0xFFFAFAFA),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  children: [
                                    RatingBarCard(rating: data["rating"]),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const WidgetSpan(
                                              child: Icon(
                                                Icons.people,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                              text:
                                                  "${data["nb_participants_max"]}",
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const WidgetSpan(
                                                child: Icon(
                                                  Icons.access_time,
                                                  size: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              TextSpan(
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                                text: DateFormat.yMd()
                                                    .add_Hm()
                                                    .format(data["begin_date"]),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            children: [
                                              const WidgetSpan(
                                                child: Icon(
                                                  Icons.location_on,
                                                  size: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              TextSpan(
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                                text: " ${data["address"]}",
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ));
            }
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Erreur lors de la récupération des données...'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
