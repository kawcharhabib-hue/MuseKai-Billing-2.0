@echo off
title MuseKAI Billing 2.0 - Launcher
color 0A
cls
echo.
echo  ========================================================
echo           MuseKAI Billing v2.0 Pro
echo       Jaber Al Hilali Travel Tourism ^& Cargo
echo  ========================================================
echo.
echo  [*] Starting MuseKAI Billing...
echo.

cd /d "%~dp0"

if not exist "resources\index.html" (
    echo  [ERROR] resources\index.html not found!
    pause
    exit /b 1
)

REM 1. Try starting the native Neutralino runner
if exist "MuseKAI-Billing-win_x64.exe" (
    start "" "MuseKAI-Billing-win_x64.exe"
    timeout /t 3 /nobreak >nul
    tasklist /fi "imagename eq MuseKAI-Billing-win_x64.exe" 2>nul | find /i "MuseKAI-Billing" >nul
    if not errorlevel 1 (
        echo  [OK] MuseKAI Billing running in Native Desktop Mode.
        timeout /t 1 >nul
        exit /b 0
    )
)

REM 2. Standalone Desktop App Window (Edge / Chrome Frameless Window)
set "APP_URL=file:///%~dp0resources/index.html"
set "APP_URL=%APP_URL:\=/%"
set "USER_DATA=%~dp0.tmp\app_profile"

if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --app="%APP_URL%" --user-data-dir="%USER_DATA%" --no-sandbox --disable-gpu --window-size=1366,850
    echo  [OK] MuseKAI Billing running in Standalone Desktop Mode.
    timeout /t 1 >nul
    exit /b 0
)

if exist "C:\Program Files (x86)\Microsoft\EdgeCore\154.0.4258.37\msedge.exe" (
    start "" "C:\Program Files (x86)\Microsoft\EdgeCore\154.0.4258.37\msedge.exe" --app="%APP_URL%" --user-data-dir="%USER_DATA%" --no-sandbox --disable-gpu --window-size=1366,850
    echo  [OK] MuseKAI Billing running in Standalone Desktop Mode.
    timeout /t 1 >nul
    exit /b 0
)

start "" "%APP_URL%"
exit /b 0
