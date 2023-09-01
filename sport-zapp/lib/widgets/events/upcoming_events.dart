// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projet_sport_z/widgets/events/details_event.dart';
import 'package:intl/intl.dart';
import '../../configs/connection_bdd.dart';

class UpComingEvents extends StatefulWidget {
  const UpComingEvents({Key? key}) : super(key: key);
  @override
  State<UpComingEvents> createState() => _UpComingEventsState();
}

class _UpComingEventsState extends State<UpComingEvents> {
  @override
  Widget build(BuildContext context) {
    final Future<Map> Event =
        selectUpcomingEventsByUser(FirebaseAuth.instance.currentUser!.uid);
    return Material(
      child: FutureBuilder<Map>(
        future: Event, // a previously-obtained Future<String> or null
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
                            builder: (context) => EventDetails(event: data)),
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
                                      '${data["sport"]}',
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
                                        data["title"],
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
                                    RatingBarIndicator(
                                      rating: data["rating"].toDouble(),
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Color(0xFF5AE999),
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
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
                                                text: " " +
                                                    DateFormat('dd/MM -')
                                                        .add_Hm()
                                                        .format(
                                                            data["begin_date"]),
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
                child: CircularProgressIndicator(
                  backgroundColor: Color(0XFFB4B4B4),
                  color: Color(0XFF5AE999),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Chargement...'),
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
