
import 'notification_actions_platform_interface.dart';

class NotificationActions {
  Future<String?> getPlatformVersion() {
    return NotificationActionsPlatform.instance.getPlatformVersion();
  }
}
