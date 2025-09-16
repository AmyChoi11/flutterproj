# 📱 Direct iOS App Installation Guide

## Build and Install iOS App Without App Store Connect

This guide shows you how to build your Procreate Helper Widget using GitHub Actions and install it directly on your iPad.

---

## 🚀 **How It Works**

1. **GitHub Actions** builds your iOS app on Apple's macOS servers (free)
2. **Download .ipa file** from GitHub 
3. **Install directly** on your iPad using various methods
4. **No App Store Connect** or developer program enrollment needed

---

## 📋 **Step-by-Step Process**

### **Step 1: Trigger Build**
1. **Go to your GitHub repository**
2. **Navigate to "Actions" tab**
3. **Click "Build iOS App" workflow**
4. **Click "Run workflow"** button
5. **Wait 10-15 minutes** for build to complete

### **Step 2: Download Built App**
1. **When build completes**, go to the workflow run
2. **Scroll down to "Artifacts" section**
3. **Download** "ProcreateHelperWidget-iOS.zip"
4. **Extract** to get the .ipa file

### **Step 3: Install on iPad**

#### **Method A: 3uTools (Easiest - Windows)**
1. **Download 3uTools**: http://www.3u.com
2. **Install and connect iPad** to PC
3. **Click "Apps"** → "Install Local App" 
4. **Select your .ipa file**
5. **Click Install**

#### **Method B: AltStore (Alternative)**
1. **Download AltStore**: https://altstore.io
2. **Install AltServer** on PC
3. **Install AltStore** on iPad
4. **Use AltStore** to install your .ipa

#### **Method C: iOS App Installer (Advanced)**
1. **Download iOS App Installer** from Microsoft Store
2. **Connect iPad** and trust computer
3. **Install .ipa file** directly

#### **Method D: Xcode (If you have Mac access)**
1. **Open Xcode**
2. **Window** → **Devices and Simulators**
3. **Drag .ipa file** to device

---

## 🔧 **What the GitHub Action Does**

### **Build Process:**
1. ✅ **Sets up Flutter** environment
2. ✅ **Installs dependencies** (pub get, pod install)
3. ✅ **Builds iOS app** without code signing
4. ✅ **Creates .ipa file** for installation
5. ✅ **Uploads as downloadable artifact**

### **Output Files:**
- **ProcreateHelperWidget.ipa** - Ready to install
- **Runner.app** - Raw app bundle (alternative)

---

## 🆓 **GitHub Actions Free Tier**

- **2,000 minutes/month** free on macOS runners
- **Each build takes ~10-15 minutes**
- **~133 builds per month** available
- **More than enough** for your project!

---

## 📱 **App Installation Notes**

### **Trust Developer Certificate:**
After installation:
1. **Go to Settings** → **General** → **VPN & Device Management**
2. **Find your certificate** under "Developer App"
3. **Tap and Trust** the certificate

### **App Expiry:**
- **Apps expire after 7 days** (free developer limitation)
- **Reinstall using same method** when needed
- **Takes 30 seconds** to reinstall

### **Widget Installation:**
After app installs:
1. **Long press** iPad home screen
2. **Tap "+"** button
3. **Search "Procreate Helper"**
4. **Add widget** in desired size

---

## 🔄 **Development Workflow**

1. **Edit code** in VS Code (Windows)
2. **Push to GitHub** (triggers automatic build)
3. **Download new .ipa** when build completes
4. **Reinstall** on iPad
5. **Test new features**

---

## 🛠️ **Troubleshooting**

### **Build Fails:**
- Check GitHub Actions logs for errors
- Verify Flutter and iOS versions compatibility
- Ensure all dependencies are correct

### **Installation Fails:**
- Try different installation method (3uTools vs AltStore)
- Ensure iPad trusts your computer
- Check iPad storage space

### **App Won't Open:**
- Trust developer certificate in Settings
- Restart iPad after installation
- Check for iOS version compatibility

---

## 🎯 **Why This Method Works**

- ✅ **No Apple Developer Program** enrollment needed
- ✅ **Free GitHub Actions** for building
- ✅ **Direct installation** tools available
- ✅ **Perfect for testing** and personal use
- ✅ **Your Flutter project** is already configured correctly

---

## 🎉 **Success Indicators**

When everything works:
- ✅ GitHub Actions build completes successfully
- ✅ .ipa file downloads without errors
- ✅ App installs on iPad
- ✅ Widget appears in widget gallery
- ✅ All 4 buttons work (Undo, Redo, Brush, Eraser)

**This approach gives you complete iOS development capability without any Apple payments!** 🚀