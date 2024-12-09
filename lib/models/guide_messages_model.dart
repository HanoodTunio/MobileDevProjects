class GuideMessageModel {
  final String sender;
  final String message;
  final String? profileImage;
  final String count; // Unread message count
  final DateTime timestamp;

  GuideMessageModel({
    required this.sender,
    required this.message,
    this.profileImage,
    required this.count,
    required this.timestamp,
  });

  // Factory method for JSON parsing (if needed in the future)
  factory GuideMessageModel.fromJson(Map<String, dynamic> json) {
    return GuideMessageModel(
      sender: json['sender'] as String,
      message: json['message'] as String,
      profileImage: json['profileImage'] as String?,
      count: json['count'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}
