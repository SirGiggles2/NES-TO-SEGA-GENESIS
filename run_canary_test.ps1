param([string]$Rom = "zelda_v361")
$BIZHAWK  = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT  = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BaseName = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath  = "$PROJECT\build\$BaseName.md"
$LuaSrc   = "$PROJECT\diag\scripts\zelda_canary.lua"
$LuaTmp   = "$PROJECT\diag\scripts\zelda_canary_run.lua"
$OutPath  = "$PROJECT\diag\reports\canary_$BaseName.txt"

if (-not (Test-Path $BIZHAWK)) { Write-Error "BizHawk not found"; exit 1 }
if (-not (Test-Path $RomPath))  { Write-Error "ROM not found: $RomPath"; exit 1 }

$lua = [System.IO.File]::ReadAllText($LuaSrc)
$lua = $lua -replace 'canary_ROMNAME\.txt', "canary_$BaseName.txt"
[System.IO.File]::WriteAllText($LuaTmp, $lua)
if (Test-Path $OutPath) { Remove-Item $OutPath -Force }

Write-Host "Launching BizHawk with $BaseName -- waiting 30s for canary..."
$proc = Start-Process -FilePath $BIZHAWK -ArgumentList "`"$RomPath`"", "`"--lua=$LuaTmp`"" -PassThru
$deadline = (Get-Date).AddSeconds(30)

while (-not $proc.HasExited) {
    Start-Sleep -Milliseconds 500
    $proc.Refresh()
    if (Test-Path $OutPath) {
        Write-Host "CANARY APPEARED"
        Start-Sleep -Seconds 1
        $proc.CloseMainWindow() | Out-Null
        Start-Sleep -Seconds 2
        if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
        break
    }
    if ((Get-Date) -gt $deadline) {
        Write-Host "TIMEOUT - Lua never ran"
        Stop-Process -Id $proc.Id -Force
        break
    }
    Write-Host "." -NoNewline
}

$proc.WaitForExit()
if (Test-Path $LuaTmp) { Remove-Item $LuaTmp -Force }

if (Test-Path $OutPath) {
    Write-Host ""
    Write-Host "--- Canary output ---"
    Get-Content $OutPath
} else {
    Write-Host ""
    Write-Host "No canary file. BizHawk did not run Lua."
}
