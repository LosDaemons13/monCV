import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarCard extends StatefulWidget {
  final int rating;
  const RatingBarCard({Key? key, required this.rating}) : super(key: key);

  @override
  State<RatingBarCard> createState() => _RatingBarCardState();
}

class _RatingBarCardState extends State<RatingBarCard> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      RatingBarIndicator(
        rating: widget.rating.toDouble(),
        itemBuilder: (context, index) => const Icon(
          Icons.local_fire_department,
          color: Color(0xFF5AE999),
        ),
        itemCount: 4,
        itemSize: 25.0,
        direction: Axis.horizontal,
      ),
    ]);
  }
}
