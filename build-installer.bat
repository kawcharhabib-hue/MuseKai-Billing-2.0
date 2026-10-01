@echo off
title MuseKAI Billing - Installer Builder
echo ============================================================
echo   MuseKAI Billing 2.0 - Windows Setup Package Builder
echo ============================================================
echo.
echo [1/3] Bundling application frontend and binaries...
call npx @neutralinojs/neu build --release
if %errorlevel% neq 0 (
    echo [ERROR] Neutralino bundle failed.
    pause
    exit /b %errorlevel%
)

echo [2/3] Syncing distribution runtime files...
copy /Y "dist\MuseKAI-Billing\resources.neu" "resources.neu" >nul

echo [3/3] Compiling Windows Setup Installer with Inno Setup 6...
"C:\Users\Arigato\AppData\Local\Programs\Inno Setup 6\ISCC.exe" "setup.iss"
if %errorlevel% neq 0 (
    echo [ERROR] Inno Setup compilation failed.
    pause
    exit /b %errorlevel%
)

copy /Y "dist\installer\MuseKAI-Billing-Setup-v2.0.0.exe" "MuseKAI-Billing-Setup-v2.0.0.exe" >nul

echo.
echo ============================================================
echo   SUCCESS! Production Setup Installer Generated:
echo   E:\MuseKai Billing 2.0\MuseKAI-Billing-Setup-v2.0.0.exe
echo ============================================================
echo.
pause
