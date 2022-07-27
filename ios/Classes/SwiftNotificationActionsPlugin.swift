import Flutter
import UIKit

public class SwiftNotificationActionsPlugin: NSObject, FlutterPlugin, UNUserNotificationCenterDelegate {
    
    static var flutterRegistrantCallback: FlutterPluginRegistrantCallback?
    private var _initialNotificationWithAction : NSDictionary?
    private lazy var _backgroundEngine = FlutterEngine(
        name: "NotificationActionsEngine"
    )
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        NSLog(">>>> register")
        let channel = FlutterMethodChannel(name: "notification_actions", binaryMessenger: registrar.messenger())
        let instance = SwiftNotificationActionsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.addApplicationDelegate(instance)
    }
    
    @objc
    public static func setPluginRegistrantCallback(_ callback: @escaping FlutterPluginRegistrantCallback) {
        flutterRegistrantCallback = callback
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        NSLog(">>>> handle")
        switch call.method {
        case "getInitialMessage":
            result(copyInitialNotification())
        default:
            result("")
        }
    }
    
    @available(iOS 10.0, *)
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        NSLog(">>>> UserInfo: \(response.notification.request.content.userInfo)")
        
        _initialNotificationWithAction = FLTFirebaseMessagingUtilities.remoteMessageUserInfo(toDict: response.notification.request.content.userInfo) as NSDictionary?
        if (_initialNotificationWithAction != nil) {
            _initialNotificationWithAction!.setValue(response.actionIdentifier, forKey: "actionIdentifier")
        }
        NSLog(">>>> initialMessage: \(_initialNotificationWithAction?.description)")
        
        completionHandler()
    }
    
    private func copyInitialNotification() -> NSDictionary? {
        NSLog(">>>> copyInitialNotification: \(_initialNotificationWithAction?.description)")
        if (_initialNotificationWithAction != nil) {
            var initialNotificationCopy: NSDictionary = _initialNotificationWithAction!.copy() as! NSDictionary;
            _initialNotificationWithAction = nil;
            NSLog(">>>> copyInitialNotification: \(initialNotificationCopy.description)")
            return initialNotificationCopy;
        }
        return nil
    }
}
