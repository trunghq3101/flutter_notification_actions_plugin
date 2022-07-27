import 'package:flutter_test/flutter_test.dart';
import 'package:notification_actions/notification_actions.dart';
import 'package:notification_actions/notification_actions_platform_interface.dart';
import 'package:notification_actions/notification_actions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNotificationActionsPlatform
    with MockPlatformInterfaceMixin
    implements NotificationActionsPlatform {
  @override
  Future<String?> getInitialMessage() => Future.value('42');
}

void main() {
  final NotificationActionsPlatform initialPlatform =
      NotificationActionsPlatform.instance;

  test('$MethodChannelNotificationActions is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNotificationActions>());
  });

  test('getInitialMessage', () async {
    NotificationActions notificationActionsPlugin = NotificationActions();
    MockNotificationActionsPlatform fakePlatform =
        MockNotificationActionsPlatform();
    NotificationActionsPlatform.instance = fakePlatform;

    expect(await notificationActionsPlugin.getInitialMessage(), '42');
  });
}
