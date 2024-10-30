// lib/models/review_model.dart

class Review {
  final String username;
  final String comment;
  final double rating;

  Review({
    required this.username,
    required this.comment,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      username: json['username'] as String,
      comment: json['comment'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
