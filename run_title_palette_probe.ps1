param(
    [string]$Rom = "zelda_v659"
)

$ErrorActionPreference = "Stop"

$BIZHAWK = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR = "$PROJECT\build"
$SCRIPT = "$PROJECT\diag\scripts\zelda_title_palette_probe.lua"
$TEMP_SCRIPT = "$PROJECT\diag\scripts\zelda_title_palette_probe.runtime.lua"
$ROM_BASENAME = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$ROM_PATH = "$BUILD_DIR\$ROM_BASENAME.md"
$OUTPUT_PATH = "$PROJECT\diag\reports\title_palette_probe_$ROM_BASENAME.txt"

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $ROM_PATH)) { throw "ROM not found: $ROM_PATH" }
if (-not (Test-Path $SCRIPT)) { throw "Lua script not found: $SCRIPT" }
if (Test-Path $OUTPUT_PATH) { Remove-Item $OUTPUT_PATH -Force }

$OriginalLua = [System.IO.File]::ReadAllText($SCRIPT)
$UpdatedLua = $OriginalLua -replace 'local ROM_VERSION\s*=.*', "local ROM_VERSION = `"$ROM_BASENAME`""
[System.IO.File]::WriteAllText($TEMP_SCRIPT, $UpdatedLua)

try {
    Write-Host "=== TITLE PALETTE PROBE ===" -ForegroundColor Cyan
    Write-Host "ROM:    $ROM_BASENAME"
    Write-Host "Output: $OUTPUT_PATH"
    Write-Host ""

    $BizArgs = ('"{0}" --lua="{1}"' -f $ROM_PATH, $TEMP_SCRIPT)
    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru
    $deadline = (Get-Date).AddMinutes(5)

    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $proc.Refresh()

        if (Test-Path $OUTPUT_PATH) {
            $fs = [System.IO.File]::Open($OUTPUT_PATH, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
            $reader = New-Object System.IO.StreamReader($fs)
            $content = $reader.ReadToEnd()
            $reader.Close()
            $fs.Close()

            if ($content -match 'TITLE PALETTE PROBE COMPLETE') {
                if (-not $proc.HasExited) {
                    $null = $proc.CloseMainWindow()
                    Start-Sleep -Seconds 2
                    $proc.Refresh()
                    if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
                }
                break
            }
        }

        if ((Get-Date) -gt $deadline) {
            Stop-Process -Id $proc.Id -Force
            throw "Timed out after 5 minutes."
        }
    }

    if (Test-Path $OUTPUT_PATH) {
        Get-Content $OUTPUT_PATH
    } else {
        Write-Warning "No output file produced."
    }
}
finally {
    if (Test-Path $TEMP_SCRIPT) { Remove-Item $TEMP_SCRIPT -Force }
}
