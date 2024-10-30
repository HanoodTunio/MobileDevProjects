// views/screens/notification_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/notification_controller.dart';
import '../../models/notification_model.dart';
import '../widgets/notification_card.dart';

class UserNotificationScreen extends StatefulWidget {
  const UserNotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<UserNotificationScreen> {
  @override
  void initState() {
    super.initState();
    final notificationController = Provider.of<NotificationController>(context, listen: false);
    notificationController.loadNotifications(); // Load notifications when screen initializes
  }

  @override
  Widget build(BuildContext context) {
    final notificationController = Provider.of<NotificationController>(context);
    final groupedNotifications = notificationController.getGroupedNotifications();

    return Scaffold(
      body: ListView(
        children: [
          if (groupedNotifications['Today']!.isNotEmpty)
            _buildSection("Today", groupedNotifications['Today']!, notificationController),
          if (groupedNotifications['Yesterday']!.isNotEmpty)
            _buildSection("Yesterday", groupedNotifications['Yesterday']!, notificationController),
          if (groupedNotifications['Older']!.isNotEmpty)
            _buildSection("Older", groupedNotifications['Older']!, notificationController),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<NotificationModel> notifications, NotificationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        ...notifications.map((notification) {
          return NotificationCard(
            notification: notification,
            onTap: () => controller.markAsRead(notification),
          );
        }).toList(),
      ],
    );
  }
}
