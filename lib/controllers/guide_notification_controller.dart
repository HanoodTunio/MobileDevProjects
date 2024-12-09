import 'package:flutter/material.dart';
import '../models/guide_notification_model.dart';
import '../services/notification_service.dart';

class GuideNotificationController extends ChangeNotifier {
  final NotificationService _notificationService = NotificationService();
  List<GuideNotificationModel> _notifications = [];

  List<GuideNotificationModel> get notifications => List.unmodifiable(_notifications);

  // Load notifications for the guide with dummy data
  Future<void> loadNotifications() async {
    try {
      _notifications = [
        GuideNotificationModel(
          id: '1',
          name: 'Arden Jhone',
          message: 'Great experience as always!',
          timestamp: DateTime.now(),
          rating: 5.0,
          imageUrl: 'https://via.placeholder.com/150',
          isRead: false,
        ),
        GuideNotificationModel(
          id: '2',
          name: 'Sandeep',
          message: 'Excellent work!',
          timestamp: DateTime.now().subtract(const Duration(days: 1)),
          rating: 4.8,
          imageUrl: null, // No image URL, use default image
          isRead: false,
        ),
        GuideNotificationModel(
          id: '3',
          name: 'John Doe',
          message: 'Very satisfied with the service.',
          timestamp: DateTime.now().subtract(const Duration(days: 7)),
          rating: 4.5,
          imageUrl: null, // No image URL, use default image
          isRead: true,
        ),
      ];
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading notifications: $e");
    }
  }

  Future<void> markAsRead(GuideNotificationModel notification) async {
    if (!notification.isRead) {
      notification.isRead = true;
      notifyListeners();
      await _notificationService.markNotificationAsRead(notification.id);
    }
  }

  // Group notifications into categories: New, Yesterday, and Older
  Map<String, List<GuideNotificationModel>> getGroupedNotifications() {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    final Map<String, List<GuideNotificationModel>> groupedNotifications = {
      'New': [],
      'Yesterday': [],
      'Older': [],
    };

    for (var notification in _notifications) {
      if (_isSameDay(notification.timestamp, now)) {
        groupedNotifications['New']?.add(notification);
      } else if (_isSameDay(notification.timestamp, yesterday)) {
        groupedNotifications['Yesterday']?.add(notification);
      } else {
        groupedNotifications['Older']?.add(notification);
      }
    }

    return groupedNotifications;
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
