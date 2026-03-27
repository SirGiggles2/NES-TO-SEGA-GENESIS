param(
    [string]$Rom = "zelda_v378"
)

$ErrorActionPreference = "Stop"

$BIZHAWK    = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR  = "$PROJECT\build"
$SCRIPT     = "$PROJECT\diag\scripts\zelda_gameplay_probe.lua"
$TEMP_SCRIPT = "$PROJECT\diag\scripts\zelda_gameplay_probe.runtime.lua"
$LOCK_PATH  = "$PROJECT\diag\scripts\zelda_gameplay_probe.lock"
$SEND_ME    = "$PROJECT\diag\reports\Files I Want"
$REPORTS    = "$PROJECT\diag\reports"

$BaseName   = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath    = "$BUILD_DIR\$BaseName.md"
$OutputPath = "$REPORTS\gameplay_probe_$BaseName.txt"

$PreviousOutputWriteUtc = $null
if (Test-Path $OutputPath) {
    $PreviousOutputWriteUtc = (Get-Item $OutputPath).LastWriteTimeUtc
    Remove-Item $OutputPath -Force
}

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $RomPath))  { throw "ROM not found: $RomPath" }
if (-not (Test-Path $SCRIPT))   { throw "Probe Lua not found: $SCRIPT" }
if (Test-Path $LOCK_PATH)       { throw "Probe already running. Remove $LOCK_PATH if stale." }

try {
    New-Item -ItemType File -Path $LOCK_PATH | Out-Null
    $OriginalLua = [System.IO.File]::ReadAllText($SCRIPT)
    $UpdatedLua  = $OriginalLua -replace 'local ROM_VERSION\s*=.*', "local ROM_VERSION = `"$BaseName`""
    [System.IO.File]::WriteAllText($TEMP_SCRIPT, $UpdatedLua)

    Write-Host "=== GAMEPLAY PROBE ===" -ForegroundColor Cyan
    Write-Host "ROM:    $BaseName"
    Write-Host "Output: $OutputPath"
    Write-Host ""

    $BizArgs = ('"{0}" --lua="{1}"' -f $RomPath, $TEMP_SCRIPT)
    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru
    $deadline = (Get-Date).AddMinutes(15)
    $summarySeen = $false

    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $proc.Refresh()

        if (Test-Path $OutputPath) {
            $outputWriteUtc = (Get-Item $OutputPath).LastWriteTimeUtc
            $isFreshOutput = ($null -eq $PreviousOutputWriteUtc) -or ($outputWriteUtc -gt $PreviousOutputWriteUtc)

            $fs = [System.IO.File]::Open($OutputPath, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
            $reader = New-Object System.IO.StreamReader($fs)
            $content = $reader.ReadToEnd()
            $reader.Close()
            $fs.Close()

            if ($isFreshOutput -and $content -match '=== SUMMARY ===') {
                $summarySeen = $true
                $null = $proc.CloseMainWindow()
                Start-Sleep -Seconds 3
                $proc.Refresh()
                if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
                break
            }
        }

        if ((Get-Date) -gt $deadline) {
            Stop-Process -Id $proc.Id -Force
            throw "Timed out after 15 minutes."
        }
    }

    if ($summarySeen -and (Test-Path $OutputPath)) {
        Copy-Item $OutputPath "$SEND_ME\" -Force
        Write-Host ""
        Get-Content $OutputPath
    } else {
        Write-Warning "No output file produced."
    }
}
finally {
    if (Test-Path $TEMP_SCRIPT) { Remove-Item $TEMP_SCRIPT -Force }
    if (Test-Path $LOCK_PATH) { Remove-Item $LOCK_PATH -Force }
}
