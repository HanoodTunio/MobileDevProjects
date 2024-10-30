// lib/widgets/guide_review.dart

import 'package:flutter/material.dart';
import '../../models/review_model.dart';

class GuideReview extends StatelessWidget {
  final Review review;

  const GuideReview({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(
        review.username,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        review.comment,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          if (index < review.rating) {
            return const Icon(Icons.star, color: Colors.amber, size: 16);
          } else {
            return const Icon(Icons.star_border, color: Colors.amber, size: 16);
          }
        }),
      ),
    );
  }
}
