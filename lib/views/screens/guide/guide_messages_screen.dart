import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/guide/message_card.dart';
import '../../../controllers/guide_message_controller.dart';
import 'guide_chat_screen.dart';

class GuideMessagesScreen extends StatelessWidget {
  const GuideMessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageController = Provider.of<GuideMessageController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
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
              timestamp: message.timestamp,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuideChatScreen(contactName: message.sender),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
