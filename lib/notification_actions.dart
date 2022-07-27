import 'notification_actions_platform_interface.dart';

class NotificationActions {
  Future<Map<String, dynamic>?> getInitialMessage() {
    return NotificationActionsPlatform.instance.getInitialMessage();
  }
}
