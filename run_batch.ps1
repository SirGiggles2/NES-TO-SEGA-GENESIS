# run_batch.ps1
# Usage: .\run_batch.ps1 -StartRom zelda_v254
# Launches BizHawk with the specified ROM and runs zelda_diag_v9.lua in batch mode.
# BizHawk will close itself automatically when the batch finishes.

param(
    [Parameter(Mandatory=$true)]
    [string]$StartRom
)

$BIZHAWK   = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT   = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR = "$PROJECT\build"
$SCRIPT    = "$PROJECT\diag\scripts\zelda_diag_v9.lua"

# Strip extension if user passed it
$BaseName = [System.IO.Path]::GetFileNameWithoutExtension($StartRom)
$RomPath  = "$BUILD_DIR\$BaseName.md"

if (-not (Test-Path $BIZHAWK)) {
    Write-Error "EmuHawk.exe not found at: $BIZHAWK"
    exit 1
}

if (-not (Test-Path $RomPath)) {
    Write-Error "ROM not found: $RomPath"
    exit 1
}

Write-Host "Starting batch from: $BaseName"
Write-Host "BizHawk will close automatically when done."
Write-Host ""

& $BIZHAWK "$RomPath" --lua="$SCRIPT"

Write-Host ""
Write-Host "Batch complete. Reports are in:"
Write-Host "  $PROJECT\diag\reports\Files I Want\"
