$ErrorActionPreference = "Stop"

$BIZHAWK = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$SCRIPT  = "$PROJECT\diag\scripts\zelda_dot_diag.lua"
$ROM     = "$PROJECT\build\zelda_v519.md"
$OUT     = "$PROJECT\diag\reports\dot_diag_report.txt"

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $ROM)) { throw "ROM not found: $ROM" }
if (Test-Path $OUT) { Remove-Item $OUT }

$BizArgs = ('"{0}" --lua="{1}"' -f $ROM, $SCRIPT)
$proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru
$deadline = (Get-Date).AddMinutes(12)

while (-not $proc.HasExited) {
    Start-Sleep -Milliseconds 500
    $proc.Refresh()
    if (Test-Path $OUT) {
        $fs = [System.IO.File]::Open($OUT, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
        $reader = New-Object System.IO.StreamReader($fs)
        $content = $reader.ReadToEnd()
        $reader.Close()
        $fs.Close()
        if ($content -match 'DOT DIAGNOSTIC COMPLETE') {
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
        throw "Dot diagnostic timed out."
    }
}

if (Test-Path $OUT) { Get-Content $OUT }
