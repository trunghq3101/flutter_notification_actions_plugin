import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notification_actions/notification_actions_method_channel.dart';

void main() {
  MethodChannelNotificationActions platform =
      MethodChannelNotificationActions();
  const MethodChannel channel = MethodChannel('notification_actions');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getInitialMessage', () async {
    expect(await platform.getInitialMessage(), '42');
  });
}
