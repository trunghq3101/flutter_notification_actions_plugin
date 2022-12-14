import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'notification_actions_method_channel.dart';

class NotificationActionsMessage {
  final int? value;

  NotificationActionsMessage({this.value});

  factory NotificationActionsMessage.fromMap(Map<String, dynamic> map) {
    return NotificationActionsMessage(value: map['value']);
  }
}

abstract class NotificationActionsPlatform extends PlatformInterface {
  /// Constructs a NotificationActionsPlatform.
  NotificationActionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static NotificationActionsPlatform _instance =
      MethodChannelNotificationActions();

  /// The default instance of [NotificationActionsPlatform] to use.
  ///
  /// Defaults to [MethodChannelNotificationActions].
  static NotificationActionsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NotificationActionsPlatform] when
  /// they register themselves.
  static set instance(NotificationActionsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map<String, dynamic>?> getInitialMessage() async {
    return _instance.getInitialMessage();
  }
}
