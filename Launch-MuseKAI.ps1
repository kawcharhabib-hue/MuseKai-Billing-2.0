# MuseKAI Billing 2.0 — Production PowerShell Launcher
# Jaber Al Hilali Travel Tourism & Cargo

$Host.UI.RawUI.WindowTitle = "MuseKAI Billing 2.0 Launcher"

Write-Host ""
Write-Host "  ========================================================" -ForegroundColor Green
Write-Host "           MuseKAI Billing v2.0 Pro" -ForegroundColor Green
Write-Host "       Jaber Al Hilali Travel Tourism & Cargo" -ForegroundColor Green
Write-Host "  ========================================================" -ForegroundColor Green
Write-Host ""

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

$resources = Join-Path $scriptDir "resources\index.html"
$binary = Join-Path $scriptDir "MuseKAI-Billing-win_x64.exe"

if (-not (Test-Path $resources)) {
    Write-Host "  [ERROR] Application resources not found: $resources" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# 1. Try Native Neutralino Runner
if (Test-Path $binary) {
    Write-Host "  [*] Launching Native Desktop Runner..." -ForegroundColor Cyan
    $p = Start-Process -FilePath $binary -WorkingDirectory $scriptDir -PassThru
    Start-Sleep -Seconds 3
    if ($p -and -not $p.HasExited) {
        Write-Host "  [OK] MuseKAI Billing running in Native Desktop Mode (PID: $($p.Id))" -ForegroundColor Green
        exit 0
    }
    Write-Host "  [i] Switching to Standalone Desktop App Window..." -ForegroundColor Yellow
}

# 2. Standalone Desktop App Window (Chrome / Edge Frameless Window)
$appUrl = "file:///" + ($resources -replace '\\', '/')
$userData = Join-Path $scriptDir ".tmp\app_profile"

$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$edgePath = "C:\Program Files (x86)\Microsoft\EdgeCore\154.0.4258.37\msedge.exe"

if (Test-Path $chromePath) {
    Write-Host "  [*] Launching in Standalone App Window (Chrome)..." -ForegroundColor Cyan
    Start-Process -FilePath $chromePath -ArgumentList "--app=`"$appUrl`" --user-data-dir=`"$userData`" --no-sandbox --disable-gpu --window-size=1366,850"
    Write-Host "  [OK] Application window opened successfully." -ForegroundColor Green
    exit 0
}

if (Test-Path $edgePath) {
    Write-Host "  [*] Launching in Standalone App Window (Edge)..." -ForegroundColor Cyan
    Start-Process -FilePath $edgePath -ArgumentList "--app=`"$appUrl`" --user-data-dir=`"$userData`" --window-size=1366,850"
    Write-Host "  [OK] Application window opened successfully." -ForegroundColor Green
    exit 0
}

# 3. Default Browser Fallback
Start-Process $appUrl
Write-Host "  [OK] Launched in default browser." -ForegroundColor Green
