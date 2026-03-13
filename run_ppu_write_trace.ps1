param(
    [Parameter(Mandatory=$true)]
    [string]$Rom
)

$ErrorActionPreference = "Stop"

$BIZHAWK   = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT   = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR = "$PROJECT\build"
$SCRIPT    = "$PROJECT\diag\scripts\zelda_ppu_write_trace.lua"
$LOCK_PATH = "$PROJECT\diag\scripts\zelda_ppu_write_trace.lock"

$BaseName = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath  = "$BUILD_DIR\$BaseName.md"
$ReportPath = "$PROJECT\diag\reports\ppu_writes_${BaseName}.csv"
$DonePath = "$PROJECT\diag\reports\ppu_writes_${BaseName}.done"

if (-not (Test-Path $BIZHAWK)) {
    Write-Error "EmuHawk.exe not found at: $BIZHAWK"
    exit 1
}

if (-not (Test-Path $RomPath)) {
    Write-Error "ROM not found: $RomPath"
    exit 1
}

$LockAcquired = $false
$OriginalLuaContent = $null
$PreviousDoneWriteTime = $null

try {
    if (Test-Path $LOCK_PATH) {
        throw "PPU write trace runner is already active. Remove $LOCK_PATH if the previous run crashed."
    }

    New-Item -ItemType File -Path $LOCK_PATH | Out-Null
    $LockAcquired = $true

    $OriginalLuaContent = [System.IO.File]::ReadAllText($SCRIPT)
    $UpdatedLuaContent = $OriginalLuaContent -replace 'local TRACE_HINT = .*', "local TRACE_HINT = `"$BaseName`" -- auto-set by runner"
    [System.IO.File]::WriteAllText($SCRIPT, $UpdatedLuaContent)
    if (Test-Path $DonePath) {
        $PreviousDoneWriteTime = (Get-Item $DonePath).LastWriteTimeUtc
    }

    $BizArgs = @(
        "`"$RomPath`"",
        "`"--lua=$SCRIPT`""
    )
    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru

    $timeout = [TimeSpan]::FromMinutes(3)
    $deadline = [DateTime]::UtcNow + $timeout
    while ([DateTime]::UtcNow -lt $deadline) {
        Start-Sleep -Milliseconds 250
        if ($proc.HasExited) {
            break
        }
        if (Test-Path $DonePath) {
            $doneTime = (Get-Item $DonePath).LastWriteTimeUtc
            if ($null -eq $PreviousDoneWriteTime -or $doneTime -gt $PreviousDoneWriteTime) {
                break
            }
        }
    }

    if (-not $proc.HasExited) {
        if ($proc.CloseMainWindow()) {
            Start-Sleep -Seconds 2
            $proc.Refresh()
        }
        if (-not $proc.HasExited) {
            Stop-Process -Id $proc.Id -Force
        }
    }

    $Completed = $false
    if (Test-Path $DonePath) {
        $doneTime = (Get-Item $DonePath).LastWriteTimeUtc
        if ($null -eq $PreviousDoneWriteTime -or $doneTime -gt $PreviousDoneWriteTime) {
            $Completed = $true
        }
    }

    if (-not $Completed -and -not (Test-Path $ReportPath)) {
        throw "PPU write trace did not produce $ReportPath"
    }

    if (-not $Completed -and $proc.HasExited -and $proc.ExitCode -ne 0) {
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
