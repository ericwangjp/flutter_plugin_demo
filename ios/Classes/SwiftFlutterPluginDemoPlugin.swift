import Flutter
import UIKit

public class SwiftFlutterPluginDemoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_plugin_demo", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPluginDemoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
        case "getScreenWidth":
            let screenRect = UIScreen.main.bounds
            let screenWidth = screenRect.size.width
            let screenHeight = screenRect.size.height
            result("iOS \(screenWidth)")
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        default:
            result("no such method !")
      }
  }
}
