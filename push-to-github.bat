@echo off
title Push MuseKAI Billing 2.0 to GitHub
cd /d "%~dp0"
echo ============================================================
echo   Pushing MuseKAI Billing 2.0 to GitHub
echo   Repository: https://github.com/kawcharhabib-hue/MuseKai-Billing-2.0
echo ============================================================
echo.
echo Connecting to GitHub...
git push -u origin main
echo.
if %errorlevel% equ 0 (
    echo ============================================================
    echo   SUCCESS! All files and release pushed to GitHub!
    echo ============================================================
) else (
    echo [NOTICE] If prompted by Git Credential Manager, please sign in
    echo via your browser or provide your GitHub Personal Access Token.
)
echo.
pause
