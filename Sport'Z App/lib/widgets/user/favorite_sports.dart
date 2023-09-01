import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';

class Favorite_Sports extends StatefulWidget {
  Favorite_Sports({Key? key, required this.uid}) : super(key: key);
  String uid;

  @override
  State<Favorite_Sports> createState() => _Favorite_SportsState();
}

class _Favorite_SportsState extends State<Favorite_Sports> {
  @override
  Widget build(BuildContext context) {
    Future<Map> favortiteSports = getFavoriteSports(widget.uid);
    return FutureBuilder<Map>(
        future: favortiteSports,
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          List<Widget> widget = [];
          if (snapshot.hasData) {
            Map? data = snapshot.data;
            data!.forEach((key, value) {
              widget.add(Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF1F1F1),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/icons/filtres/${data[key]["label"]}.png',
                          width: 40,
                          height: 40,
                        ),
                      )),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[key]["label"],
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8.0),
                      RatingBarIndicator(
                        rating: data[key]["rating"].toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Color(0xFF5AE999),
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ],
              ));
            });
          } else {
            widget.add(Container());
          }
          return Column(
            children: widget,
          );
        });
  }
}
