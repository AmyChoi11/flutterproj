@echo off
echo Procreate Helper Widget - Quick Setup Script
echo ==========================================
echo.

REM Check if we're in the right directory
if not exist "pubspec.yaml" (
    echo Error: Please run this script from the procreate_helper_widget directory
    echo    Navigate to the project folder and run quick_setup.bat
    pause
    exit /b 1
)

echo Step 1: Project structure verified
echo Your project is ready for iOS development!
echo.

echo Step 2: Requirements Check
echo - This project requires macOS with Xcode for iOS development
echo - Flutter needs to be installed on the Mac
echo - An iPad or iPhone for testing
echo.

echo Step 3: Transfer to Mac
echo Copy this entire project folder to a Mac computer
echo.

echo Step 4: Setup on macOS
echo 1. Install Flutter (if not already installed)
echo 2. Open Terminal and navigate to this project folder
echo 3. Run: flutter pub get
echo 4. Run: cd ios && pod install && cd ..
echo 5. Open: open ios/Runner.xcworkspace
echo.

echo Step 5: In Xcode on Mac
echo 1. Set up signing for both 'Runner' and 'ProcreateHelperWidget' targets
echo 2. Connect your iPad and select it as the target device
echo 3. Click the Run button (or press Cmd+R)
echo.

echo Step 6: On iPad after installation
echo 1. Trust the developer profile in Settings - General - VPN Device Management
echo 2. Add the widget to home screen (long press + button, search 'Procreate Helper')
echo.

echo Check setup_for_device.md for detailed instructions!
echo.
echo Happy coding!
pause