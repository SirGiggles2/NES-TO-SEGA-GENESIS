param(
    [string]$Rom = "zelda_v391"
)

$ErrorActionPreference = "Stop"

$BIZHAWK = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR = "$PROJECT\build"
$SCRIPT = "$PROJECT\diag\scripts\zelda_boot_diag.lua"
$LOCK_PATH = "$PROJECT\diag\scripts\zelda_boot_diag.lock"
$REPORTS_DIR = "$PROJECT\diag\reports"

$BaseName = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath = "$BUILD_DIR\$BaseName.md"
$OutputPath = "$REPORTS_DIR\boot_diag_$BaseName.txt"

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found at $BIZHAWK" }
if (-not (Test-Path $RomPath)) { throw "ROM not found: $RomPath" }
if (Test-Path $LOCK_PATH) { throw "Already running. Remove $LOCK_PATH if previous run crashed." }

New-Item -ItemType File -Path $LOCK_PATH | Out-Null

$OriginalLua = [System.IO.File]::ReadAllText($SCRIPT)
$UpdatedLua = $OriginalLua -replace 'local ROM_VERSION = ".*"', "local ROM_VERSION = `"$BaseName`""
[System.IO.File]::WriteAllText($SCRIPT, $UpdatedLua)

try {
    if (Test-Path $OutputPath) { Remove-Item $OutputPath -Force }

    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList @("`"$RomPath`"", "`"--lua=$SCRIPT`"") -PassThru
    $deadline = (Get-Date).AddMinutes(5)

    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $proc.Refresh()

        if (Test-Path $OutputPath) {
            $content = Get-Content $OutputPath -Raw
            if ($content -match '=== SUMMARY ===') {
                $null = $proc.CloseMainWindow()
                Start-Sleep -Seconds 2
                $proc.Refresh()
                if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
                break
            }
        }

        if ((Get-Date) -gt $deadline) {
            Stop-Process -Id $proc.Id -Force
            throw "Timed out."
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
