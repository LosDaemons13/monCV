import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarDetail extends StatefulWidget {
  final int rating;
  const RatingBarDetail({Key? key, required this.rating}) : super(key: key);

  @override
  State<RatingBarDetail> createState() => _RatingBarDetailState();
}

class _RatingBarDetailState extends State<RatingBarDetail> {
  @override
  Widget build(BuildContext context) {
    String label = " - ";
    switch (widget.rating) {
      case 1:
        label = label + "Débutant";
        break;
      case 2:
        label = label + "Intermédiaire";
        break;
      case 3:
        label = label + "Confirmé";
        break;
      case 4:
        label = label + "Expert";
        break;
    }
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
      Text(label),
    ]);
  }
}
