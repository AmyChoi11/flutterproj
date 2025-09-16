@echo off
echo Xcode Cloud Setup - Step by Step Guide
echo =======================================
echo.

echo Step 1: Install Required Tools
echo ------------------------------
echo You need to install these tools first:
echo.
echo 1. Git for Windows
echo    Download from: https://git-scm.com/download/win
echo    - Use default settings during installation
echo    - This enables version control for your project
echo.
echo 2. GitHub Desktop (Optional but easier)
echo    Download from: https://desktop.github.com/
echo    - User-friendly interface for Git operations
echo.
echo Step 2: Create GitHub Account
echo ----------------------------
echo 1. Go to: https://github.com
echo 2. Sign up for a free account
echo 3. Verify your email address
echo.

echo Step 3: After installing Git, run this script again
echo --------------------------------------------------
echo This script will continue with repository setup
echo.

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git is not installed yet
    echo Please install Git first, then run this script again
    echo.
    echo Opening Git download page...
    start https://git-scm.com/download/win
    pause
    exit /b 0
)

echo ✅ Git is installed!
echo.

echo Step 4: Repository Setup
echo -----------------------
echo Setting up your project for Xcode Cloud...
echo.

REM Initialize Git repository
echo Initializing Git repository...
git init

REM Create .gitignore for Flutter projects
echo Creating .gitignore file...
(
echo # Flutter/Dart/Pub related
echo **/doc/api/
echo **/ios/Flutter/flutter_assets/
echo **/ios/Flutter/flutter_export_environment.sh
echo **/ios/ServiceDefinitions.json
echo **/ios/Runner/GeneratedPluginRegistrant.*
echo.
echo # Xcode
echo **/ios/**/*.mode1v3
echo **/ios/**/*.mode2v3
echo **/ios/**/*.moved-aside
echo **/ios/**/*.pbxuser
echo **/ios/**/*.perspectivev3
echo **/ios/**/*sync/
echo **/ios/**/.sconsign.dblite
echo **/ios/**/.tags*
echo **/ios/**/.vagrant/
echo **/ios/**/DerivedData/
echo **/ios/**/Icon?
echo **/ios/**/Pods/
echo **/ios/**/.symlinks/
echo **/ios/**/profile
echo **/ios/**/xcuserdata
echo **/ios/.generated/
echo **/ios/Flutter/app.flx
echo **/ios/Flutter/app.zip
echo **/ios/Flutter/flutter_assets/
echo **/ios/Flutter/flutter_export_environment.sh
echo.
echo # Android
echo **/android/**/gradle-wrapper.jar
echo **/android/.gradle
echo **/android/captures/
echo **/android/gradlew
echo **/android/gradlew.bat
echo **/android/local.properties
echo **/android/**/GeneratedPluginRegistrant.java
echo.
echo # VS Code
echo .vscode/
echo.
echo # Build outputs
echo **/build/
echo.
echo # macOS
echo .DS_Store
) > .gitignore

echo Adding all files to Git...
git add .

echo Creating initial commit...
git commit -m "Initial commit - Procreate Helper Widget for Xcode Cloud"

echo.
echo ✅ Git repository set up successfully!
echo.
echo Step 5: Next Actions
echo ------------------
echo 1. Create a GitHub repository:
echo    - Go to: https://github.com/new
echo    - Repository name: procreate-helper-widget
echo    - Make it Private (recommended)
echo    - Do NOT initialize with README
echo.
echo 2. After creating the repository, GitHub will show you commands like:
echo    git remote add origin https://github.com/YOUR_USERNAME/procreate-helper-widget.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 3. Run those commands in this folder
echo.
echo 4. Then follow the xcode_cloud_setup.md guide for the rest!
echo.
echo Opening GitHub new repository page...
start https://github.com/new
echo.
echo Your project is ready for Xcode Cloud! 🚀
pause