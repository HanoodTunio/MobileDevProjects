class MessageModel {
  final String sender;
  final String message;
  final String profileImage;
  final String count;
  final DateTime timestamp; // New field for timestamp

  MessageModel({
    required this.sender,
    required this.message,
    required this.profileImage,
    required this.count,
    required this.timestamp,
  });

  // Factory method to create a MessageModel from a JSON-like map (if needed)
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sender: json['sender'],
      message: json['message'],
      profileImage: json['profileImage'],
      count: json['count'],
      timestamp: DateTime.parse(json['timestamp']), // Parse timestamp
    );
  }

  // Convert MessageModel instance to a JSON-like map (if needed for serialization)
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'message': message,
      'profileImage': profileImage,
      'count': count,
      'timestamp': timestamp.toIso8601String(), // Serialize timestamp
    };
  }
}
