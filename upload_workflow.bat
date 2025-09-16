@echo off
echo Uploading GitHub Actions Workflow
echo =================================
echo.

echo This script uploads your new iOS build workflow to GitHub
echo.

REM Check if Git is available
git --version >nul 2>&1
if errorlevel 1 (
    echo Git is not installed. Please either:
    echo 1. Install Git from https://git-scm.com/download/win
    echo 2. Use GitHub Desktop to upload files
    echo 3. Manually upload files through GitHub web interface
    pause
    exit /b 1
)

echo Adding updated workflow file...
git add .github/workflows/xcode-cloud.yml

echo Adding installation guide...
git add direct_installation_guide.md

echo Committing changes...
git commit -m "Add GitHub Actions iOS build workflow for direct installation"

echo Pushing to GitHub...
git push

echo.
echo ✅ Workflow uploaded successfully!
echo.
echo Next steps:
echo 1. Go to your GitHub repository
echo 2. Click "Actions" tab
echo 3. Click "Build iOS App" workflow
echo 4. Click "Run workflow" button
echo 5. Wait for build to complete (~15 minutes)
echo 6. Download the .ipa file from artifacts
echo.
pause