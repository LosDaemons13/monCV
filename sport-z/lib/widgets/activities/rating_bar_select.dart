import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarSelect extends StatefulWidget {
  final updateRating;
  const RatingBarSelect({Key? key, required this.updateRating})
      : super(key: key);

  @override
  State<RatingBarSelect> createState() => _RatingBarSelectState();
}

String label = "";

class _RatingBarSelectState extends State<RatingBarSelect> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      RatingBar.builder(
        minRating: 1,
        maxRating: 4,
        itemBuilder: (context, index) => const Icon(
          Icons.local_fire_department,
          color: Color(0xFF5AE999),
        ),
        itemCount: 4,
        itemSize: 25.0,
        unratedColor: const Color(0xFF5AE999).withAlpha(70),
        direction: Axis.horizontal,
        onRatingUpdate: (rating) {
          switch (rating.toInt()) {
            case 1:
              setState(() {
                label = " - Débutant";
              });
              break;
            case 2:
              setState(() {
                label = " - Intermédiaire";
              });
              break;
            case 3:
              setState(() {
                label = " - Confirmé";
              });
              break;
            case 4:
              setState(() {
                label = " - Expert";
              });
              break;
          }
          widget.updateRating(rating.toInt());
        },
      ),
      Text(label),
    ]);
  }
}
