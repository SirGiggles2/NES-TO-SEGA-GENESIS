$ErrorActionPreference = "Stop"

$BIZHAWK    = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$SCRIPT     = "$PROJECT\diag\scripts\zelda_nes_intro_loop.lua"
$REPORTS    = "$PROJECT\diag\reports"
$NES_ROM    = "$PROJECT\artifacts\nes_original_build\zelda_disassembly_og.nes"
$OutputPath = "$REPORTS\nes_intro_loop_nes_original.txt"

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $NES_ROM)) { throw "NES ROM not found: $NES_ROM" }

Write-Host "=== NES INTRO LOOP ORACLE ===" -ForegroundColor Cyan
Write-Host "ROM:    $NES_ROM"
Write-Host "Output: $OutputPath"
Write-Host ""

$BizArgs = ('"{0}" --lua="{1}"' -f $NES_ROM, $SCRIPT)
$proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru
$deadline = (Get-Date).AddMinutes(15)

while (-not $proc.HasExited) {
    Start-Sleep -Milliseconds 500
    $proc.Refresh()

    if (Test-Path $OutputPath) {
        $fs = [System.IO.File]::Open($OutputPath, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
        $reader = New-Object System.IO.StreamReader($fs)
        $content = $reader.ReadToEnd()
        $reader.Close()
        $fs.Close()

        if ($content -match 'NES INTRO LOOP ORACLE COMPLETE') {
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

if (Test-Path $OutputPath) {
    Write-Host ""
    Get-Content $OutputPath
} else {
    Write-Warning "No output file produced."
}
