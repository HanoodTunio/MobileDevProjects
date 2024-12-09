// lib/views/widgets/rating_widget.dart

import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    int filledStars = rating.floor();
    int unfilledStars = 5 - filledStars;

    return Row(
      children: [
        ...List.generate(filledStars, (index) => const Icon(Icons.star_rounded, color: Colors.yellow, size: 20)),
        ...List.generate(unfilledStars, (index) => const Icon(Icons.star_border_rounded, color: Colors.grey, size: 20)),
      ],
    );
  }
}
