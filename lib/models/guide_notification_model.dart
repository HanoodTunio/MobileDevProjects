class GuideNotificationModel {
  final String id;
  final String name; // User's name
  final String message; // Notification message
  final DateTime timestamp;
  final double rating; // User's rating
  final String? imageUrl; // User's profile image URL (optional)
  bool isRead;

  GuideNotificationModel({
    required this.id,
    required this.name,
    required this.message,
    required this.timestamp,
    required this.rating,
    this.imageUrl,
    this.isRead = false,
  });

  // Factory method for JSON parsing
  factory GuideNotificationModel.fromJson(Map<String, dynamic> json) {
    return GuideNotificationModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      message: json['message'] as String? ?? '',
      timestamp: DateTime.parse(json['timestamp'] as String),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] as String?,
      isRead: json['isRead'] as bool? ?? false,
    );
  }
}
