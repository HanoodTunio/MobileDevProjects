import 'package:flutter/cupertino.dart';
import '../models/message_model.dart';

class MessageController extends ChangeNotifier {
  final List<MessageModel> _messages = [
    MessageModel(
      sender: "Arden Jhones",
      message: "Mobile Footer Inspirational designs, i...",
      profileImage: 'assets/images/user1.png',
      count: "2",
      timestamp: DateTime.now().subtract(Duration(minutes: 5)), // 5 minutes ago
    ),
    MessageModel(
      sender: "Peter Parker",
      message: "Check out my new design!",
      profileImage: 'assets/user_profile.dart.png',
      count: "1",
      timestamp: DateTime.now().subtract(Duration(hours: 1)), // 1 hour ago
    ),
    MessageModel(
      sender: "Bruce Wayne",
      message: "Are you coming to the meeting?",
      profileImage: 'assets/user2.png',
      count: "5",
      timestamp: DateTime.now().subtract(Duration(days: 1)), // 1 day ago
    ),
  ];

  List<MessageModel> get messages => List.unmodifiable(_messages);
}
