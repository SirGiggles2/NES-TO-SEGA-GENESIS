param(
    [Parameter(Mandatory=$true)]
    [string]$Rom
)

$ErrorActionPreference = "Stop"

$BIZHAWK   = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT   = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR = "$PROJECT\build"
$SCRIPT    = "$PROJECT\diag\scripts\zelda_title_timeline.lua"
$LOCK_PATH = "$PROJECT\diag\scripts\zelda_title_timeline.lock"

$BaseName = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath  = "$BUILD_DIR\$BaseName.md"
$DonePath = "$PROJECT\diag\reports\title_timeline_${BaseName}.done"
$OutPath  = "$PROJECT\diag\reports\title_timeline_${BaseName}.txt"

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
        throw "Title timeline runner is already active. Remove $LOCK_PATH if the previous run crashed."
    }

    New-Item -ItemType File -Path $LOCK_PATH | Out-Null
    $LockAcquired = $true

    $OriginalLuaContent = [System.IO.File]::ReadAllText($SCRIPT)
    $UpdatedLuaContent = $OriginalLuaContent -replace 'local TRACE_HINT = .*', "local TRACE_HINT = `"$BaseName`""
    [System.IO.File]::WriteAllText($SCRIPT, $UpdatedLuaContent)

    if (Test-Path $DonePath) {
        $PreviousDoneWriteTime = (Get-Item $DonePath).LastWriteTimeUtc
    }

    $BizArgs = @(
        "`"$RomPath`"",
        "`"--lua=$SCRIPT`""
    )
    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru

    $timeout = [TimeSpan]::FromMinutes(8)
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

    if (-not $Completed -and -not (Test-Path $OutPath)) {
        throw "Title timeline probe did not produce $OutPath"
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

if (Test-Path $OutPath) {
    Get-Content $OutPath
}