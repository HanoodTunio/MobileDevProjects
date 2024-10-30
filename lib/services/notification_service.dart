// services/notification_service.dart

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/notification_model.dart';

class NotificationService {
  final String apiUrl = 'https://example.com/api/notifications'; // Replace with your actual API URL

  // Fetch notifications from the API
  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => NotificationModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      print('Error fetching notifications: $e');
      // Return dummy data if the API fails
      return [
        NotificationModel(
          id: "1", // Unique id for each notification
          title: "Sample Notification 1",
          description: "This is a sample notification description.",
          timestamp: DateTime.now(),
        ),
        NotificationModel(
          id: "2",
          title: "Sample Notification 2",
          description: "Another sample notification description.",
          timestamp: DateTime.now().subtract(Duration(days: 1)),
        ),
      ];
    }
  }

  // Mark a notification as read on the backend
  Future<void> markNotificationAsRead(String notificationId) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/$notificationId/read'), // Use notificationId in the endpoint URL
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to mark notification as read');
      }
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }
}
