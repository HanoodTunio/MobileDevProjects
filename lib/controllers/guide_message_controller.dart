import 'package:flutter/cupertino.dart';
import '../models/guide_messages_model.dart';

class GuideMessageController extends ChangeNotifier {
  final List<GuideMessageModel> _messages = [
    GuideMessageModel(
      sender: "Client 1",
      message: "Can you help with tour arrangements?",
      profileImage: 'assets/images/guide1.png',
      count: "3",
      timestamp: DateTime.now().subtract(Duration(minutes: 15)),
    ),
    GuideMessageModel(
      sender: "Client 2",
      message: "What is your availability next week?",
      profileImage: 'assets/images/guide2.png',
      count: "2",
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
    ),
    GuideMessageModel(
      sender: "Client 3",
      message: "Looking forward to the trip!",
      profileImage: 'assets/images/guide3.png',
      count: "4",
      timestamp: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  List<GuideMessageModel> get messages => List.unmodifiable(_messages);
}
