#import "NotificationActionsPlugin.h"
#if __has_include(<notification_actions/notification_actions-Swift.h>)
#import <notification_actions/notification_actions-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "notification_actions-Swift.h"
#endif

@implementation NotificationActionsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNotificationActionsPlugin registerWithRegistrar:registrar];
}
@end
