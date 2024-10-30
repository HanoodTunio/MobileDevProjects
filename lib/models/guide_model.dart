// lib/models/guide_model.dart

class Guide {
  final String username;
  final String profilePicture;
  final String description;
  final double rating;
  final int reviewCount;

  Guide({
    required this.username,
    required this.profilePicture,
    required this.description,
    required this.rating,
    required this.reviewCount,
  });

  // Factory constructor to create a Guide from a JSON object
  factory Guide.fromJson(Map<String, dynamic> json) {
    return Guide(
      username: json['username'] as String,
      profilePicture: json['profile_picture'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(), // Ensure it's converted to double
      reviewCount: json['review_count'] as int,
    );
  }

  // Convert a Guide to a JSON object (optional, but useful for sending data back to API)
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'profile_picture': profilePicture,
      'description': description,
      'rating': rating,
      'review_count': reviewCount,
    };
  }
}
