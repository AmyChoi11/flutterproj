# Procreate Helper Widget - Flutter iOS Project Setup Guide

## Prerequisites

1. **Mac with macOS 10.15 or later** (Required for iOS development)
2. **Xcode 12.0 or later** (Download from Mac App Store)
3. **Flutter SDK 3.0.0 or later** (https://flutter.dev/docs/get-started/install/macos)
4. **CocoaPods** (Install with: `sudo gem install cocoapods`)
5. **Apple Developer Account** (Free account is sufficient for development)

## Project Structure Overview

This project consists of:
- **Flutter App**: Main application that handles widget interactions
- **iOS Widget Extension**: Native iOS widget written in SwiftUI
- **Custom URL Scheme**: Communication channel between widget and app

## Step-by-Step Setup Instructions

### 1. Install Flutter and Dependencies

```bash
# Verify Flutter installation
flutter doctor

# Navigate to project directory
cd procreate_helper_widget

# Get Flutter dependencies
flutter pub get

# Install iOS dependencies
cd ios
pod install
cd ..
```

### 2. Open Project in Xcode

```bash
# Open the iOS project in Xcode
open ios/Runner.xcworkspace
```

**Important**: Always open `.xcworkspace` file, not `.xcodeproj` when using CocoaPods.

### 3. Configure Development Team Signing

In Xcode:

1. **Select the Runner target** in the project navigator
2. Go to **"Signing & Capabilities"** tab
3. **Check "Automatically manage signing"**
4. Select your **Apple ID team** from the dropdown
5. **Repeat for ProcreateHelperWidgetExtension target**:
   - Select "ProcreateHelperWidgetExtension" target
   - Go to "Signing & Capabilities" tab
   - Check "Automatically manage signing"
   - Select the same Apple ID team

### 4. Configure Bundle Identifiers

Make sure the bundle identifiers are unique:

1. **Runner target**:
   - Bundle Identifier: `com.yourname.procreateHelperWidget`
2. **ProcreateHelperWidgetExtension target**:
   - Bundle Identifier: `com.yourname.procreateHelperWidget.ProcreateHelperWidget`

Replace `yourname` with your actual name or organization identifier.

### 5. Connect iPad Device

1. Connect your iPad to Mac via USB
2. **Trust the computer** on iPad when prompted
3. In Xcode, select your iPad from the device list in the toolbar

### 6. Enable Developer Mode (iOS 16+)

If using iOS 16 or later:
1. Install the app once
2. Go to **Settings > Privacy & Security > Developer Mode** on iPad
3. Enable Developer Mode and restart device

### 7. Build and Install

```bash
# Build and install to device
flutter run
```

Or in Xcode:
1. Select your iPad device in the toolbar
2. Click the **Run button** (▶️) or press `Cmd + R`

### 8. Trust Developer Profile

On your iPad:
1. Go to **Settings > General > VPN & Device Management**
2. Find your developer profile under "Developer App"
3. Tap it and select **"Trust"**

### 9. Add Widget to Home Screen

1. **Long press** on empty area of iPad home screen
2. Tap the **"+"** button in top-left corner
3. Search for **"Procreate Helper"**
4. Select the widget size you prefer
5. Tap **"Add Widget"**

## Widget Functionality

The widget provides 4 main buttons:

- **Undo**: Triggers undo action (opens app with `procreatehelper://undo`)
- **Redo**: Triggers redo action (opens app with `procreatehelper://redo`)
- **Brush**: Switches to brush tool (opens app with `procreatehelper://brush`)
- **Eraser**: Switches to eraser tool (opens app with `procreatehelper://eraser`)

## Customization Options

### Modify Widget Appearance

Edit `ios/ProcreateHelperWidget/ProcreateHelperWidget.swift`:

```swift
// Change colors
.background(Color.blue)        // Button background
.foregroundColor(.white)       // Text/icon color

// Change button layout
HStack(spacing: 6) {           // Horizontal spacing
VStack(spacing: 8) {           // Vertical spacing
```

### Add New Actions

1. **Add new URL scheme** in widget Swift file:
```swift
Link(destination: URL(string: "procreatehelper://newaction")!) {
    // Button content
}
```

2. **Handle in Flutter app** (`lib/main.dart`):
```dart
void _handleIncomingUrl(String url) {
  if (url.contains('newaction')) {
    _performNewAction();
  }
}
```

### Implement Real Procreate Control

To actually control Procreate (not just show notifications):

1. **Bluetooth Communication**: If you have an ESP32 or similar device
2. **Accessibility API**: Requires special permissions and complex setup
3. **Third-party Integration**: If Procreate supports URL schemes or APIs

## Troubleshooting

### Common Issues

1. **"Developer cannot be verified"**:
   - Go to Settings > General > VPN & Device Management
   - Trust your developer profile

2. **Widget not appearing**:
   - Make sure both app and extension have the same team signing
   - Restart device after installation

3. **Build errors**:
   - Run `flutter clean && flutter pub get`
   - Delete `ios/Pods` and run `pod install`

4. **URL scheme not working**:
   - Check Info.plist for correct URL scheme configuration
   - Verify bundle identifiers match between app and extension

### Advanced Debugging

```bash
# Check device logs
flutter logs

# Rebuild everything
flutter clean
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
flutter run
```

## Security Considerations

- This method uses development provisioning profiles
- Apps installed this way expire after 7 days (free accounts) or 1 year (paid accounts)
- For permanent installation without expiry, you need App Store distribution

## Next Steps

1. **Test all widget buttons** ensure they open the app correctly
2. **Implement actual Procreate control** based on your specific needs
3. **Customize widget appearance** to match your preferences
4. **Add more functionality** like brush size controls, color selection, etc.

The widget is now ready for development and testing on your iPad!