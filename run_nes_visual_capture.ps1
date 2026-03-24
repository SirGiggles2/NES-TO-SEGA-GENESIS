$ErrorActionPreference = "Stop"

$BIZHAWK    = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$SCRIPT     = "$PROJECT\diag\scripts\zelda_nes_visual_capture.lua"
$REPORTS    = "$PROJECT\diag\reports"
$NES_ROM    = "$PROJECT\artifacts\nes_original_build\zelda_disassembly_og.nes"
$OutputPath = "$REPORTS\nes_visual_capture.txt"

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $NES_ROM)) { throw "NES ROM not found: $NES_ROM" }

if (Test-Path $OutputPath) { Remove-Item $OutputPath }

$BizArgs = ('"{0}" --lua="{1}"' -f $NES_ROM, $SCRIPT)
$proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru
$deadline = (Get-Date).AddMinutes(10)

while (-not $proc.HasExited) {
    Start-Sleep -Milliseconds 500
    $proc.Refresh()
    if (Test-Path $OutputPath) {
        $fs = [System.IO.File]::Open($OutputPath, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
        $reader = New-Object System.IO.StreamReader($fs)
        $content = $reader.ReadToEnd()
        $reader.Close()
        $fs.Close()
        if ($content -match 'NES VISUAL CAPTURE COMPLETE') {
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
        if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
        throw "Timed out."
    }
}

if (Test-Path $OutputPath) { Get-Content $OutputPath }
