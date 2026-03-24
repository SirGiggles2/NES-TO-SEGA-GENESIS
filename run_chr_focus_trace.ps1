param(
    [string]$Rom = "zelda_v423"
)

$ErrorActionPreference = "Stop"

$BIZHAWK    = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR  = "$PROJECT\build"
$SCRIPT     = "$PROJECT\diag\scripts\zelda_chr_focus_trace.lua"
$LOCK_PATH  = "$PROJECT\diag\scripts\zelda_chr_focus_trace.lock"
$REPORTS    = "$PROJECT\diag\reports"

$BaseName   = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath    = "$BUILD_DIR\$BaseName.md"
$OutputPath = "$REPORTS\chr_focus_trace_$BaseName.csv"

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $RomPath))  { throw "ROM not found: $RomPath" }
if (Test-Path $LOCK_PATH)       { throw "Trace already running. Remove $LOCK_PATH if stale." }
if (Test-Path $OutputPath)      { Remove-Item $OutputPath -Force }

New-Item -ItemType File -Path $LOCK_PATH | Out-Null
$OriginalLua = [System.IO.File]::ReadAllText($SCRIPT)
$UpdatedLua  = $OriginalLua -replace 'local ROM_VERSION = ".*?"', "local ROM_VERSION = `"$BaseName`""
[System.IO.File]::WriteAllText($SCRIPT, $UpdatedLua)

try {
    $BizArgs = @(
        "`"$RomPath`"",
        "`"--lua=$SCRIPT`""
    )
    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru
    $deadline = (Get-Date).AddMinutes(5)

    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $proc.Refresh()

        if (Test-Path $OutputPath) {
            $fs = [System.IO.File]::Open($OutputPath, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
            $reader = New-Object System.IO.StreamReader($fs)
            $content = $reader.ReadToEnd()
            $reader.Close()
            $fs.Close()

            if ($content -match 'END') {
                $null = $proc.CloseMainWindow()
                Start-Sleep -Seconds 3
                $proc.Refresh()
                if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
                break
            }
        }

        if ((Get-Date) -gt $deadline) {
            Stop-Process -Id $proc.Id -Force
            throw "Timed out after 5 minutes."
        }
    }

    if (Test-Path $OutputPath) {
        Get-Content $OutputPath
    } else {
        Write-Warning "No output file produced."
    }
}
finally {
    [System.IO.File]::WriteAllText($SCRIPT, $OriginalLua)
    if (Test-Path $LOCK_PATH) { Remove-Item $LOCK_PATH -Force }
}
