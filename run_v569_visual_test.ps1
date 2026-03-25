#!/usr/bin/env pwsh
# Quick visual test of v569 title rendering

$romPath = "$PSScriptRoot\build\zelda_v569.md"
$blastemPath = "C:\tools\blastem\blastem.exe"
$biosPath = "C:\tools\blastem\rom.bin"

if (-not (Test-Path $romPath)) {
    Write-Error "ROM not found: $romPath"
    exit 1
}

if (-not (Test-Path $blastemPath)) {
    Write-Error "Blastem not found: $blastemPath"
    exit 1
}

Write-Host "Launching v569 in Blastem for visual inspection..."
Write-Host "Note: Let it run for ~10 seconds, then close manually"
Write-Host ""

# Launch Blastem
& $blastemPath -b $biosPath $romPath 2>&1 | Out-Null &
$blastemPid = $PID

# Wait a bit for it to start and render the title
Start-Sleep -Seconds 8

Write-Host "Closing Blastem..."
Get-Process blastem -ErrorAction SilentlyContinue | Stop-Process 2>$null
Start-Sleep -Seconds 1

Write-Host "Test complete. Check visually if title screen rendered."
