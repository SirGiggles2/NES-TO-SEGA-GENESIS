$ErrorActionPreference = "Stop"

$BIZHAWK = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$BIZHAWK_CONFIG = "D:\Emulation\BizHawk-2.11-win-x64\config.ini"
$PROJECT = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$SCRIPT = "$PROJECT\diag\scripts\zelda_nes_gameplay_visual_capture.lua"
$NES_ROM = "$PROJECT\artifacts\nes_original_build\zelda_disassembly_og.nes"
$OUTPUT_PATH = "$PROJECT\diag\reports\nes_gameplay_visual_capture.txt"

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $BIZHAWK_CONFIG)) { throw "BizHawk config not found: $BIZHAWK_CONFIG" }
if (-not (Test-Path $NES_ROM)) { throw "NES ROM not found: $NES_ROM" }
if (-not (Test-Path $SCRIPT)) { throw "Lua script not found: $SCRIPT" }
if (Test-Path $OUTPUT_PATH) { Remove-Item $OUTPUT_PATH -Force }

Write-Host "=== GAMEPLAY VISUAL CAPTURE (NES) ===" -ForegroundColor Cyan
Write-Host "ROM:    $NES_ROM"
Write-Host "Output: $OUTPUT_PATH"
Write-Host "Core:   NesHawk (temporary override)"
Write-Host ""

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$originalConfig = [System.IO.File]::ReadAllText($BIZHAWK_CONFIG)
$patchedConfig = [System.Text.RegularExpressions.Regex]::Replace(
    $originalConfig,
    '("NES"\s*:\s*")[^"]+(")',
    '$1NesHawk$2',
    1
)

if ($patchedConfig -eq $originalConfig) {
    throw "Unable to override BizHawk NES preferred core in $BIZHAWK_CONFIG"
}

$proc = $null

try {
    [System.IO.File]::WriteAllText($BIZHAWK_CONFIG, $patchedConfig, $utf8NoBom)

    $BizArgs = ('"{0}" --lua="{1}"' -f $NES_ROM, $SCRIPT)
    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru
    $deadline = (Get-Date).AddMinutes(15)

    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500

        try {
            $proc.Refresh()
        } catch {
            break
        }

        if (Test-Path $OUTPUT_PATH) {
            $fs = [System.IO.File]::Open($OUTPUT_PATH, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
            $reader = New-Object System.IO.StreamReader($fs)
            $content = $reader.ReadToEnd()
            $reader.Close()
            $fs.Close()

            if ($content -match 'NES GAMEPLAY VISUAL CAPTURE COMPLETE') {
                break
            }
        }

        if ((Get-Date) -gt $deadline) {
            throw "Timed out after 15 minutes."
        }
    }
}
finally {
    if ($proc) {
        try {
            $proc.Refresh()
        } catch {
        }

        if (-not $proc.HasExited) {
            try {
                $null = $proc.CloseMainWindow()
                Start-Sleep -Seconds 2
                $proc.Refresh()
            } catch {
            }
        }

        if (-not $proc.HasExited) {
            Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
        }
    }

    [System.IO.File]::WriteAllText($BIZHAWK_CONFIG, $originalConfig, $utf8NoBom)
}

if (Test-Path $OUTPUT_PATH) {
    Get-Content $OUTPUT_PATH
} else {
    Write-Warning "No output file produced."
}
