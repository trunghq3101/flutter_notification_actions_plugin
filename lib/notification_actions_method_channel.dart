import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'notification_actions_platform_interface.dart';

/// An implementation of [NotificationActionsPlatform] that uses method channels.
class MethodChannelNotificationActions extends NotificationActionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('notification_actions');

  @override
  Future<Map<String, dynamic>?> getInitialMessage() async {
    return await methodChannel
        .invokeMapMethod<String, dynamic>('getInitialMessage');
  }
}
