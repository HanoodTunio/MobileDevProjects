import '../models/guide_notification_model.dart';

class NotificationService {
  Future<List<GuideNotificationModel>> fetchNotifications() async {
    // Fetch the notifications from your backend API or local storage
    return [];
  }

  Future<void> markNotificationAsRead(String notificationId) async {
    // Mark the notification as read in your backend or local storage
  }
}
