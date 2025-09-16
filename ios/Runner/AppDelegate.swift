import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Set up method channel for URL handling
    setupMethodChannel()
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func setupMethodChannel() {
    guard let controller = window?.rootViewController as? FlutterViewController else {
      return
    }
    
    let navigationChannel = FlutterMethodChannel(
      name: "procreate_helper_widget/navigation",
      binaryMessenger: controller.binaryMessenger
    )
  }
  
  // Handle URL schemes from widget
  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
    
    // Handle our custom URL scheme
    if url.scheme == "procreatehelper" {
      handleIncomingURL(url)
      return true
    }
    
    return super.application(app, open: url, options: options)
  }
  
  private func handleIncomingURL(_ url: URL) {
    guard let controller = window?.rootViewController as? FlutterViewController else {
      return
    }
    
    let navigationChannel = FlutterMethodChannel(
      name: "procreate_helper_widget/navigation",
      binaryMessenger: controller.binaryMessenger
    )
    
    // Send the URL to Flutter
    navigationChannel.invokeMethod("handleUrl", arguments: url.absoluteString)
    
    // Log for debugging
    print("Received URL from widget: \(url.absoluteString)")
  }
}