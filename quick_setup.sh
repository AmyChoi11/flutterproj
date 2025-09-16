#!/bin/bash

# 🚀 Procreate Helper Widget - Quick Setup Script
# This script automates the setup process for device installation

echo "🚀 Procreate Helper Widget Setup Script"
echo "========================================"
echo ""

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Error: Please run this script from the procreate_helper_widget directory"
    echo "   cd procreate_helper_widget && ./quick_setup.sh"
    exit 1
fi

echo "📋 Step 1: Checking Flutter installation..."
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first:"
    echo "   https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -n 1)"
echo ""

echo "📋 Step 2: Getting Flutter dependencies..."
flutter pub get

echo ""
echo "📋 Step 3: Installing iOS dependencies..."
cd ios
if ! command -v pod &> /dev/null; then
    echo "❌ CocoaPods is not installed. Installing now..."
    sudo gem install cocoapods
fi

pod install
cd ..

echo ""
echo "📋 Step 4: Opening Xcode project..."
open ios/Runner.xcworkspace

echo ""
echo "🎉 Setup Complete!"
echo ""
echo "Next steps in Xcode:"
echo "1. 🔐 Set up signing for both 'Runner' and 'ProcreateHelperWidget' targets"
echo "2. 📱 Connect your iPad and select it as the target device"
echo "3. ▶️  Click the Run button (or press Cmd+R)"
echo ""
echo "📱 After installation on iPad:"
echo "1. 🛡️  Trust the developer profile in Settings → General → VPN & Device Management"
echo "2. ➕ Add the widget to your home screen (long press → + → search 'Procreate Helper')"
echo ""
echo "🔧 If you encounter issues, check setup_for_device.md for troubleshooting!"
echo ""
echo "Happy coding! 🎨"