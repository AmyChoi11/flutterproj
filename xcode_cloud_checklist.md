# 📋 Xcode Cloud Setup Checklist

Use this checklist to track your progress setting up Xcode Cloud for your Procreate Helper Widget.

## ✅ Prerequisites Setup

### 1. Install Required Software
- [ ] **Git for Windows** - Download from https://git-scm.com/download/win
- [ ] **GitHub Desktop** (optional) - Download from https://desktop.github.com
- [ ] **Apple Configurator 2** (for getting device UDID) - Download from Microsoft Store

### 2. Create Accounts
- [ ] **GitHub Account** - Sign up at https://github.com
- [ ] **Apple Developer Account** - Sign up at https://developer.apple.com
  - [ ] Free account (7-day app expiry)
  - [ ] Paid account ($99/year, recommended)

---

## 🔧 Project Setup

### 3. Git Repository Setup
- [ ] Run `setup_xcode_cloud.bat` in your project folder
- [ ] Create GitHub repository at https://github.com/new
  - Repository name: `procreate-helper-widget`
  - Visibility: Private (recommended)
  - Don't initialize with README
- [ ] Push your code to GitHub using the commands shown after creating repo

### 4. Verify Project Structure
Your project should have:
- [ ] `lib/main.dart` - Flutter app code ✅
- [ ] `ios/ProcreateHelperWidget/ProcreateHelperWidget.swift` - Widget code ✅
- [ ] `ios/Runner/Info.plist` - URL scheme configuration ✅
- [ ] `pubspec.yaml` - Flutter dependencies ✅
- [ ] `.github/workflows/xcode-cloud.yml` - Build configuration ✅

---

## 🍎 Apple Developer Setup

### 5. App Store Connect Configuration
- [ ] Go to https://appstoreconnect.apple.com
- [ ] Sign in with your Apple ID
- [ ] Accept terms and agreements
- [ ] Navigate to "Apps" section

### 6. Create New App
- [ ] Click "Apps" → "+" → "New App"
- [ ] Fill out app information:
  - **Name**: Procreate Helper Widget
  - **Primary Language**: English
  - **Bundle ID**: `com.yourname.procreateHelperWidget` (replace yourname)
  - **SKU**: `procreate-helper-widget-001`
  - **User Access**: Full Access

### 7. App Details
- [ ] **App Information**:
  - Subtitle: "Quick Procreate Controls"
  - Description: "Widget for quick access to Procreate undo, redo, brush, and eraser tools"
  - Keywords: "procreate,widget,art,drawing,productivity"
  - Category: Productivity
  - Content Rights: Choose appropriate option

---

## ☁️ Xcode Cloud Setup

### 8. Enable Xcode Cloud
- [ ] In your app in App Store Connect, click "Xcode Cloud" tab
- [ ] Click "Get Started" or "Enable Xcode Cloud"
- [ ] Connect to your GitHub repository
- [ ] Install the App Store Connect GitHub app when prompted
- [ ] Grant repository access permissions

### 9. Create Build Workflow
- [ ] Create new workflow in Xcode Cloud:
  - **Name**: "Main Build"
  - **Description**: "Build Procreate Helper Widget"
  - **Repository**: Your GitHub repository
  - **Branch**: main
  - **Start Condition**: On push to main branch
- [ ] Configure workflow actions:
  - ✅ Archive
  - ✅ Test (optional)
  - ✅ Analyze (optional)

---

## 🔐 Code Signing Setup

### 10. Certificates and Identifiers
- [ ] Go to "Certificates, Identifiers & Profiles" in developer portal
- [ ] Create **iOS Development Certificate**
- [ ] Create **App IDs**:
  - [ ] Main app: `com.yourname.procreateHelperWidget`
  - [ ] Widget extension: `com.yourname.procreateHelperWidget.ProcreateHelperWidget`
- [ ] Enable **App Groups** capability for both App IDs

### 11. Device Registration
- [ ] Get your iPad's UDID:
  - Connect to Mac and use Xcode/Finder, OR
  - Use Apple Configurator 2 on Windows, OR
  - Use online UDID finder tools
- [ ] Add device in "Devices" section of developer portal
- [ ] Create **Development Provisioning Profiles** for both app and widget

---

## 🚀 Build and Deploy

### 12. Trigger Build
- [ ] Push any change to your GitHub repository main branch
- [ ] Verify build starts in Xcode Cloud (check App Store Connect)
- [ ] Monitor build progress and fix any issues
- [ ] Wait for successful build completion

### 13. TestFlight Distribution
- [ ] When build completes, go to TestFlight tab in App Store Connect
- [ ] Add the build to TestFlight
- [ ] Add yourself as an internal tester
- [ ] Install TestFlight app on your iPad
- [ ] Accept TestFlight invitation and install your app

### 14. Widget Installation
- [ ] After app installs via TestFlight:
  - [ ] Long press on iPad home screen
  - [ ] Tap "+" button
  - [ ] Search for "Procreate Helper"
  - [ ] Add widget in desired size
  - [ ] Test all 4 buttons (Undo, Redo, Brush, Eraser)

---

## 🎉 Success Verification

### 15. Final Testing
- [ ] Widget appears on home screen with 4 colored buttons
- [ ] Tapping "Undo" opens app and shows "Undo action performed!"
- [ ] Tapping "Redo" opens app and shows "Redo action performed!"
- [ ] Tapping "Brush" opens app and shows "Switched to Brush!"
- [ ] Tapping "Eraser" opens app and shows "Switched to Eraser!"
- [ ] All buttons work reliably
- [ ] Widget has beautiful gradient background

---

## 📊 Xcode Cloud Usage Tracking

### 16. Monitor Usage
- [ ] Check compute hours used in App Store Connect
- [ ] Free tier: 25 hours/month (should be plenty for this project)
- [ ] Plan future builds accordingly

---

## 🔧 Troubleshooting Resources

If you encounter issues:

- [ ] **Build Failures**: Check Xcode Cloud logs in App Store Connect
- [ ] **Code Signing Issues**: Verify certificates and provisioning profiles
- [ ] **Repository Access**: Ensure GitHub integration is working
- [ ] **Flutter Issues**: Check Flutter version compatibility
- [ ] **Widget Issues**: Verify bundle IDs match between app and extension

### Help Resources:
- **Apple Developer Forums**: https://developer.apple.com/forums
- **Xcode Cloud Documentation**: https://developer.apple.com/xcode-cloud
- **Flutter iOS Documentation**: https://docs.flutter.dev/deployment/ios

---

## 🎯 Estimated Timeline

- **Prerequisites Setup**: 30 minutes
- **Apple Developer Setup**: 45 minutes  
- **Xcode Cloud Configuration**: 30 minutes
- **First Build**: 15-30 minutes
- **Testing and Deployment**: 15 minutes

**Total**: ~2-3 hours for complete setup

Your Flutter project is perfectly structured for this process! 🚀