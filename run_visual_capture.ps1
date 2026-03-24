$ErrorActionPreference = "Stop"
$BIZHAWK    = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$SCRIPT     = "$PROJECT\diag\scripts\zelda_visual_capture.lua"
$RomPath    = "$PROJECT\build\zelda_v495.md"
$OutputPath = "$PROJECT\diag\reports\visual_capture.txt"
if (Test-Path $OutputPath) { Remove-Item $OutputPath }
$BizArgs = ('"{0}" --lua="{1}"' -f $RomPath, $SCRIPT)
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
        if ($content -match 'PROBE COMPLETE') {
            $proc.Refresh()
            if (-not $proc.HasExited) {
                $null = $proc.CloseMainWindow()
                Start-Sleep -Seconds 3
                $proc.Refresh()
                if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
            }
            break
        }
    }
    if ((Get-Date) -gt $deadline) {
        Stop-Process -Id $proc.Id -Force
        throw "Timed out."
    }
}
if (Test-Path $OutputPath) { Get-Content $OutputPath }
