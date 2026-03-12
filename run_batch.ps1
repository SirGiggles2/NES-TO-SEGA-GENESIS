# run_batch.ps1
# Usage: .\run_batch.ps1 -StartRom zelda_v254
# Launches BizHawk with the specified ROM and runs zelda_diag_v9.lua in batch mode.
# BizHawk will close itself automatically when the batch finishes.

param(
    [Parameter(Mandatory=$true)]
    [string]$StartRom
)

$ErrorActionPreference = "Stop"

$BIZHAWK   = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT   = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR = "$PROJECT\build"
$SCRIPT    = "$PROJECT\diag\scripts\zelda_diag_v9.lua"
$LOCK_PATH = "$PROJECT\diag\scripts\zelda_diag_v9.lock"
$SUMMARY_PATH = "$PROJECT\diag\reports\diag_batch_summary_v9.txt"

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

$LockAcquired = $false
$OriginalLuaContent = $null
$PreviousSummaryWriteUtc = $null

try {
    if (Test-Path $LOCK_PATH) {
        throw "Batch runner is already active. Remove $LOCK_PATH if the previous run crashed."
    }

    New-Item -ItemType File -Path $LOCK_PATH | Out-Null
    $LockAcquired = $true

    if (Test-Path $SUMMARY_PATH) {
        $PreviousSummaryWriteUtc = (Get-Item $SUMMARY_PATH).LastWriteTimeUtc
    }

    $OriginalLuaContent = [System.IO.File]::ReadAllText($SCRIPT)
    $UpdatedLuaContent = $OriginalLuaContent -replace 'local START_ROM_HINT = .*', "local START_ROM_HINT = `"$BaseName.md`" -- auto-set by run_batch.ps1 when needed"
    [System.IO.File]::WriteAllText($SCRIPT, $UpdatedLuaContent)

    $BizArgs = @(
        "`"$RomPath`"",
        "`"--lua=$SCRIPT`""
    )
    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru

    $deadline = (Get-Date).AddMinutes(30)
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
            throw "Timed out waiting for BizHawk batch completion."
        }
    }

    $proc.WaitForExit()
    if ($proc.ExitCode -ne 0 -and -not $summarySeen) {
        throw "BizHawk exited with code $($proc.ExitCode)"
    }
}
finally {
    if ($null -ne $OriginalLuaContent) {
        [System.IO.File]::WriteAllText($SCRIPT, $OriginalLuaContent)
    }
    if ($LockAcquired -and (Test-Path $LOCK_PATH)) {
        Remove-Item $LOCK_PATH -Force
    }
}

Write-Host ""
Write-Host "Batch complete. Reports are in:"
Write-Host "  $PROJECT\diag\reports\Files I Want\"
