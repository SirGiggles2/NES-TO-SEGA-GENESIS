# run_oracle_trace.ps1
# Usage: .\run_oracle_trace.ps1 -Rom zelda_v251
# Runs the oracle trace script on a single ROM to capture frame-by-frame state.

param(
    [Parameter(Mandatory=$true)]
    [string]$Rom
)

$BIZHAWK   = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT   = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR = "$PROJECT\build"
$SCRIPT    = "$PROJECT\diag\scripts\zelda_oracle_trace.lua"

# Strip extension if user passed it
$BaseName = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath  = "$BUILD_DIR\$BaseName.md"

if (-not (Test-Path $BIZHAWK)) {
    Write-Error "EmuHawk.exe not found at: $BIZHAWK"
    exit 1
}

if (-not (Test-Path $RomPath)) {
    Write-Error "ROM not found: $RomPath"
    exit 1
}

Write-Host "Running oracle trace on: $BaseName"
Write-Host "Close BizHawk when the trace completes (watch console for 'Trace complete')."
Write-Host ""

# Backup original script
$BackupScript = "$SCRIPT.backup"
Copy-Item $SCRIPT $BackupScript -Force

# Modify TRACE_HINT in the original script
$LuaContent = Get-Content $SCRIPT -Raw
$LuaContent = $LuaContent -replace 'local TRACE_HINT = nil.*', "local TRACE_HINT = `"$BaseName`" -- auto-set by run_oracle_trace.ps1"
Set-Content -Path $SCRIPT -Value $LuaContent -NoNewline

$SendMeDir = "$PROJECT\diag\reports\Files I Want"

& $BIZHAWK "$RomPath" --lua="$SCRIPT"

Write-Host ""
Write-Host "=============================================="
Write-Host "Copying trace files to Files I Want..."
Write-Host "=============================================="

# Copy trace files to Files I Want
$ReportsDir = "$PROJECT\diag\reports"
Copy-Item "$ReportsDir\oracle_trace_$BaseName.csv" "$SendMeDir\" -ErrorAction SilentlyContinue
Copy-Item "$ReportsDir\oracle_menu_$BaseName.csv" "$SendMeDir\" -ErrorAction SilentlyContinue
Copy-Item "$ReportsDir\oracle_trace_${BaseName}_summary.txt" "$SendMeDir\" -ErrorAction SilentlyContinue
Copy-Item "$ReportsDir\oracle_events_$BaseName.csv" "$SendMeDir\" -ErrorAction SilentlyContinue

Write-Host "IMPORTANT: Restore the original script when done!"
Write-Host "Run: Move-Item `"$BackupScript`" `"$SCRIPT`" -Force"
Write-Host "=============================================="
Write-Host ""
Write-Host "Trace files copied to:"
Write-Host "  $SendMeDir\oracle_trace_$BaseName.csv"
Write-Host "  $SendMeDir\oracle_menu_$BaseName.csv"
Write-Host "  $SendMeDir\oracle_trace_${BaseName}_summary.txt"
Write-Host "  $SendMeDir\oracle_events_$BaseName.csv"
