import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/message_controller.dart';
import '../widgets/message_card.dart';
import 'personal_chat_screen.dart';

class MainMessagesScreen extends StatelessWidget {
  final Function(String contactName) onOpenChat;

  const MainMessagesScreen({
    Key? key,
    required this.onOpenChat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageController = Provider.of<MessageController>(context);

    return Container(
      color: Colors.blue[50],
      child: ListView.builder(
        itemCount: messageController.messages.length,
        itemBuilder: (context, index) {
          final message = messageController.messages[index];
          return MessageCard(
            profileImage: message.profileImage,
            name: message.sender,
            message: message.message,
            count: message.count,
            timestamp: message.timestamp, // Pass timestamp to MessageCard
            onTap: () {
              // Navigate to PersonalChatScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalChatScreen(contactName: message.sender),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
