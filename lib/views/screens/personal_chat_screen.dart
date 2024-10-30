import 'package:flutter/material.dart';
import '../widgets/chat_bubble.dart';

class PersonalChatScreen extends StatefulWidget {
  final String contactName;

  const PersonalChatScreen({
    Key? key,
    required this.contactName,
  }) : super(key: key);

  @override
  _PersonalChatScreenState createState() => _PersonalChatScreenState();
}

class _PersonalChatScreenState extends State<PersonalChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {"message": "Hello!", "isSender": true},
    {"message": "Hi there!", "isSender": false},
    {"message": "How's it going?", "isSender": true},
  ];

  @override
  void dispose() {
    _messageController.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({"message": message, "isSender": true});
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the default back button
        backgroundColor: Colors.white, // Set the background color to white
        elevation: 0, // Optional: remove the AppBar shadow
        title: Text(
          widget.contactName,
          style: const TextStyle(color: Colors.black), // Set title text color to black
        ),
        centerTitle: true, // Optional: center the title
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final messageData = _messages[index];
                return ChatBubble(
                  message: messageData['message'],
                  isSender: messageData['isSender'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Type your message",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_messageController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
