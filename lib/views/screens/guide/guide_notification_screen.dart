import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/guide_notification_controller.dart';
import '../../widgets/guide/notification_card.dart';
import '../../../models/guide_notification_model.dart';

class GuideNotificationScreen extends StatefulWidget {
  const GuideNotificationScreen({Key? key}) : super(key: key);

  @override
  _GuideNotificationScreenState createState() => _GuideNotificationScreenState();
}

class _GuideNotificationScreenState extends State<GuideNotificationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notificationController = Provider.of<GuideNotificationController>(context, listen: false);
      notificationController.loadNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationController = Provider.of<GuideNotificationController>(context);
    final groupedNotifications = notificationController.getGroupedNotifications();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: groupedNotifications.isEmpty
          ? const Center(child: Text('No notifications available'))
          : ListView(
        children: [
          if (groupedNotifications['New']!.isNotEmpty)
            _buildSection("New", groupedNotifications['New']!, notificationController),
          if (groupedNotifications['Yesterday']!.isNotEmpty)
            _buildSection("Yesterday", groupedNotifications['Yesterday']!, notificationController),
          if (groupedNotifications['Older']!.isNotEmpty)
            _buildSection("Older", groupedNotifications['Older']!, notificationController),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<GuideNotificationModel> notifications, GuideNotificationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return NotificationCard(
              notification: notification,
              onTap: () => controller.markAsRead(notification),
            );
          },
        ),
      ],
    );
  }
}
