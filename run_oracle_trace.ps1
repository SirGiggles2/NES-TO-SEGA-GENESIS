# run_oracle_trace.ps1
# Usage: .\run_oracle_trace.ps1 -Rom zelda_v251
# Runs the oracle trace script on a single ROM to capture frame-by-frame state.

param(
    [Parameter(Mandatory=$true)]
    [string]$Rom
)

$ErrorActionPreference = "Stop"

$BIZHAWK   = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT   = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR = "$PROJECT\build"
$SCRIPT    = "$PROJECT\diag\scripts\zelda_oracle_trace.lua"
$LOCK_PATH = "$PROJECT\diag\scripts\zelda_oracle_trace.lock"

# Strip extension if user passed it
$BaseName = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath  = "$BUILD_DIR\$BaseName.md"
$SUMMARY_PATH = "$PROJECT\diag\reports\oracle_trace_${BaseName}_summary.txt"

if (-not (Test-Path $BIZHAWK)) {
    Write-Error "EmuHawk.exe not found at: $BIZHAWK"
    exit 1
}

if (-not (Test-Path $RomPath)) {
    Write-Error "ROM not found: $RomPath"
    exit 1
}

Write-Host "Running oracle trace on: $BaseName"
Write-Host "BizHawk will close automatically when the trace completes."
Write-Host ""

$SendMeDir = "$PROJECT\diag\reports\Files I Want"
$ReportsDir = "$PROJECT\diag\reports"
$LockAcquired = $false
$OriginalLuaContent = $null
$PreviousSummaryWriteUtc = $null

try {
    if (Test-Path $LOCK_PATH) {
        throw "Oracle trace runner is already active. Remove $LOCK_PATH if the previous run crashed."
    }

    New-Item -ItemType File -Path $LOCK_PATH | Out-Null
    $LockAcquired = $true

    if (Test-Path $SUMMARY_PATH) {
        $PreviousSummaryWriteUtc = (Get-Item $SUMMARY_PATH).LastWriteTimeUtc
    }

    $OriginalLuaContent = [System.IO.File]::ReadAllText($SCRIPT)
    $UpdatedLuaContent = $OriginalLuaContent -replace 'local TRACE_HINT = .*', "local TRACE_HINT = `"$BaseName`" -- auto-set by run_oracle_trace.ps1"
    [System.IO.File]::WriteAllText($SCRIPT, $UpdatedLuaContent)

    $BizArgs = @(
        "`"$RomPath`"",
        "`"--lua=$SCRIPT`""
    )
    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru

    $deadline = (Get-Date).AddMinutes(15)
    $summarySeen = $false
    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $proc.Refresh()

        if (-not $summarySeen -and (Test-Path $SUMMARY_PATH)) {
            $summaryWriteUtc = (Get-Item $SUMMARY_PATH).LastWriteTimeUtc
            $summarySeen = ($null -eq $PreviousSummaryWriteUtc) -or ($summaryWriteUtc -gt $PreviousSummaryWriteUtc)
            if ($summarySeen) {
                Start-Sleep -Seconds 2
                $proc.Refresh()
                if (-not $proc.HasExited) {
                    $null = $proc.CloseMainWindow()
                    Start-Sleep -Seconds 3
                    $proc.Refresh()
                }
                if (-not $proc.HasExited) {
                    Stop-Process -Id $proc.Id -Force
                    break
                }
            }
        }

        if ((Get-Date) -gt $deadline) {
            Stop-Process -Id $proc.Id -Force
            throw "Timed out waiting for oracle trace completion."
        }
    }

    $proc.WaitForExit()
    if ($proc.ExitCode -ne 0 -and -not $summarySeen) {
        throw "BizHawk exited with code $($proc.ExitCode)"
    }

    Write-Host ""
    Write-Host "=============================================="
    Write-Host "Copying trace files to Files I Want..."
    Write-Host "=============================================="

    Copy-Item "$ReportsDir\oracle_trace_$BaseName.csv" "$SendMeDir\" -ErrorAction SilentlyContinue
    Copy-Item "$ReportsDir\oracle_menu_$BaseName.csv" "$SendMeDir\" -ErrorAction SilentlyContinue
    Copy-Item "$ReportsDir\oracle_trace_${BaseName}_summary.txt" "$SendMeDir\" -ErrorAction SilentlyContinue
    Copy-Item "$ReportsDir\oracle_events_$BaseName.csv" "$SendMeDir\" -ErrorAction SilentlyContinue
    Copy-Item "$ReportsDir\oracle_writes_$BaseName.csv" "$SendMeDir\" -ErrorAction SilentlyContinue

    Write-Host "Original oracle script restored."
    Write-Host "=============================================="
    Write-Host ""
    Write-Host "Trace files copied to:"
    Write-Host "  $SendMeDir\oracle_trace_$BaseName.csv"
    Write-Host "  $SendMeDir\oracle_menu_$BaseName.csv"
    Write-Host "  $SendMeDir\oracle_trace_${BaseName}_summary.txt"
    Write-Host "  $SendMeDir\oracle_events_$BaseName.csv"
    Write-Host "  $SendMeDir\oracle_writes_$BaseName.csv"
}
finally {
    if ($null -ne $OriginalLuaContent) {
        [System.IO.File]::WriteAllText($SCRIPT, $OriginalLuaContent)
    }
    if ($LockAcquired -and (Test-Path $LOCK_PATH)) {
        Remove-Item $LOCK_PATH -Force
    }
}
