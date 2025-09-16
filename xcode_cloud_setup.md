# 🚀 Xcode Cloud Setup Guide - Procreate Helper Widget

## Overview
Xcode Cloud allows you to build iOS apps without owning a Mac! This guide will help you set up automated building for your Procreate Helper Widget.

## Prerequisites
- Apple ID (free)
- GitHub/GitLab account (free)
- iPad for testing
- Your completed Flutter project (✅ You have this!)

---

## Step 1: Apple Developer Account Setup

### 1.1 Create Developer Account
1. **Visit**: https://developer.apple.com
2. **Sign In** with your Apple ID
3. **Choose Account Type**:
   - **Free**: 7-day app expiry, basic features
   - **Paid ($99/year)**: 1-year expiry, full features, App Store publishing

### 1.2 Access App Store Connect
1. **Visit**: https://appstoreconnect.apple.com
2. **Sign in** with the same Apple ID
3. **Accept** terms and conditions
4. **Note**: Even free accounts can access App Store Connect

---

## Step 2: Prepare Your Project for Git

### 2.1 Initialize Git Repository
```bash
# In your project folder
cd procreate_helper_widget
git init
git add .
git commit -m "Initial commit - Procreate Helper Widget"
```

### 2.2 Create GitHub Repository
1. **Go to**: https://github.com
2. **Create new repository**: "procreate-helper-widget"
3. **Make it private** (recommended for personal projects)
4. **Don't initialize** with README (you already have files)

### 2.3 Push to GitHub
```bash
# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/procreate-helper-widget.git
git branch -M main
git push -u origin main
```

---

## Step 3: Create App in App Store Connect

### 3.1 Register New App
1. **In App Store Connect**, click "Apps"
2. **Click** the "+" button
3. **Select** "New App"
4. **Fill out form**:
   - **Name**: "Procreate Helper Widget"
   - **Primary Language**: English
   - **Bundle ID**: Create new → `com.yourname.procreateHelperWidget`
   - **SKU**: `procreate-helper-widget-001`
   - **User Access**: Full Access

### 3.2 App Information
- **Subtitle**: "Quick Procreate Controls"
- **Description**: "Widget for quick access to Procreate undo, redo, brush, and eraser tools"
- **Keywords**: "procreate,widget,art,drawing,productivity"
- **Category**: Productivity

---

## Step 4: Set Up Xcode Cloud

### 4.1 Enable Xcode Cloud
1. **In App Store Connect**, go to your app
2. **Click** "Xcode Cloud" tab
3. **Click** "Enable Xcode Cloud"
4. **Connect** your GitHub repository

### 4.2 Configure Repository Access
1. **Install GitHub App**: Allow App Store Connect to access your repo
2. **Select Repository**: Choose your "procreate-helper-widget" repo
3. **Grant Permissions**: Read access to code and metadata

---

## Step 5: Create Xcode Cloud Workflow

### 5.1 Create Workflow File
Create `.github/workflows/xcode-cloud.yml` in your project:

```yaml
name: Xcode Cloud Build

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: macos-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.13.0'
        
    - name: Install dependencies
      run: flutter pub get
      
    - name: Install iOS dependencies
      run: |
        cd ios
        pod install
        
    - name: Build iOS
      run: flutter build ios --release --no-codesign
```

### 5.2 Configure Build Settings in App Store Connect
1. **Go to** Xcode Cloud tab in your app
2. **Create Workflow**:
   - **Name**: "Main Build"
   - **Description**: "Build Procreate Helper Widget"
   - **Branch**: main
   - **Actions**: 
     - ✅ Build
     - ✅ Test (optional)
     - ✅ Archive

---

## Step 6: Code Signing Setup

### 6.1 Create Certificates (in App Store Connect)
1. **Go to** "Certificates, Identifiers & Profiles"
2. **Create** iOS Development Certificate
3. **Download** and note the details

### 6.2 Create App IDs
1. **Create** App ID for main app: `com.yourname.procreateHelperWidget`
2. **Create** App ID for widget: `com.yourname.procreateHelperWidget.ProcreateHelperWidget`
3. **Enable** App Groups capability

### 6.3 Create Provisioning Profiles
1. **Create** Development profile for main app
2. **Create** Development profile for widget extension
3. **Add** your iPad's UDID to profiles

---

## Step 7: Configure Your Project for Xcode Cloud

### 7.1 Update Bundle IDs in Xcode Project
Since you don't have Xcode, we'll create a script to update the project:

```bash
# This would normally be done in Xcode, but we can prepare the files
# The bundle IDs are already set in your project files
```

### 7.2 Add Device UDID
1. **Connect iPad** to any Mac (or use Apple Configurator 2 on Windows)
2. **Get UDID** from iTunes/Finder or Apple Configurator
3. **Add device** in App Store Connect → Devices

---

## Step 8: Build and Deploy

### 8.1 Trigger Build
1. **Push changes** to your GitHub repository
2. **Xcode Cloud** automatically detects changes
3. **Build starts** in the cloud (check progress in App Store Connect)

### 8.2 Download and Install
1. **When build completes**, download the .ipa file
2. **Install using**:
   - **TestFlight** (easiest method)
   - **Apple Configurator 2**
   - **Xcode Organizer** (if you have Mac access)

---

## Step 9: TestFlight Distribution (Recommended)

### 9.1 Set Up TestFlight
1. **In App Store Connect**, go to TestFlight tab
2. **Add** your build when it's ready
3. **Add** yourself as internal tester
4. **Install TestFlight** app on your iPad

### 9.2 Install Your App
1. **Receive** TestFlight invitation email
2. **Open** on your iPad
3. **Install** Procreate Helper Widget
4. **Add widget** to home screen

---

## 🎉 Success! Your Widget is Now Live

After installation:
1. **Add widget** to iPad home screen
2. **Test all 4 buttons** (Undo, Redo, Brush, Eraser)
3. **Verify** app opens and shows confirmation messages

---

## 📊 Xcode Cloud Free Tier Limits

- **25 compute hours/month** (plenty for this project)
- **Unlimited builds** within hour limit
- **TestFlight distribution** included
- **Up to 100 internal testers**

---

## 🔧 Troubleshooting

### Common Issues:
1. **Build fails**: Check Flutter/iOS version compatibility
2. **Code signing errors**: Verify certificates and profiles
3. **Widget not appearing**: Ensure both targets are signed correctly
4. **Repository access**: Make sure GitHub integration is working

### Getting Help:
- **Apple Developer Forums**: developer.apple.com/forums
- **Xcode Cloud Documentation**: developer.apple.com/xcode-cloud
- **Your project is well-structured**, so most issues will be configuration-related

---

## 🚀 Next Steps After Success

1. **Customize widget appearance** (colors, layout)
2. **Add more buttons** for additional Procreate features
3. **Implement actual Procreate control** via accessibility or Bluetooth
4. **Share with other artists** via TestFlight

Your Flutter project is perfectly set up for this workflow! 🎨