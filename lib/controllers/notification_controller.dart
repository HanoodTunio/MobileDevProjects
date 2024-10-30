// controllers/notification_controller.dart

import 'package:flutter/material.dart';
import '../models/notification_model.dart';
import '../services/notification_service.dart';

class NotificationController extends ChangeNotifier {
  final NotificationService _notificationService = NotificationService();
  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => List.unmodifiable(_notifications);

  // Load notifications from the service
  Future<void> loadNotifications() async {
    _notifications = await _notificationService.fetchNotifications();
    notifyListeners();
  }

  // Mark a notification as read and update it in the backend
  Future<void> markAsRead(NotificationModel notification) async {
    notification.isRead = true;
    notifyListeners();

    await _notificationService.markNotificationAsRead(notification.id); // Pass the id to the service
  }

  // Group notifications by day: Today, Yesterday, and Older
  Map<String, List<NotificationModel>> getGroupedNotifications() {
    final today = DateTime.now();
    final yesterday = today.subtract(Duration(days: 1));

    final Map<String, List<NotificationModel>> groupedNotifications = {
      'Today': [],
      'Yesterday': [],
      'Older': [],
    };

    for (var notification in _notifications) {
      if (isSameDay(notification.timestamp, today)) {
        groupedNotifications['Today']?.add(notification);
      } else if (isSameDay(notification.timestamp, yesterday)) {
        groupedNotifications['Yesterday']?.add(notification);
      } else {
        groupedNotifications['Older']?.add(notification);
      }
    }

    return groupedNotifications;
  }

  // Helper function to check if two dates are on the same day
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }
}
