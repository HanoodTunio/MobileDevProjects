import 'package:flutter/material.dart';
import '../../../models/guide_messages_model.dart';

class MessageCard extends StatelessWidget {
  final String? profileImage;
  final String name;
  final String message;
  final String count;
  final DateTime timestamp;
  final VoidCallback onTap;

  const MessageCard({
    Key? key,
    required this.profileImage,
    required this.name,
    required this.message,
    required this.count,
    required this.timestamp,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: profileImage != null && profileImage!.isNotEmpty
                ? NetworkImage(profileImage!)
                : const AssetImage('assets/profile.png') as ImageProvider,
          ),
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                count,
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                _formatTimestamp(timestamp),
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    if (timestamp.difference(now).inDays == 0) {
      return "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}";
    } else {
      return "${timestamp.month}/${timestamp.day}";
    }
  }
}
