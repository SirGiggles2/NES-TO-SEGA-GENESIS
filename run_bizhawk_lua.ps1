param(
    [Parameter(Mandatory = $true)]
    [string]$RomPath,

    [Parameter(Mandatory = $true)]
    [string]$LuaScript,

    [int]$TimeoutSec = 180,

    [string]$BizHawkPath = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $BizHawkPath)) { throw "EmuHawk.exe not found: $BizHawkPath" }
if (-not (Test-Path $RomPath))      { throw "ROM not found: $RomPath" }
if (-not (Test-Path $LuaScript))    { throw "Lua script not found: $LuaScript" }

Write-Host "=== BIZHAWK LUA RUNNER ===" -ForegroundColor Cyan
Write-Host "ROM:      $RomPath"
Write-Host "Lua:      $LuaScript"
Write-Host "Timeout:  $TimeoutSec seconds"
Write-Host ""

$BizArgs = ('"{0}" --lua="{1}"' -f $RomPath, $LuaScript)
$proc = Start-Process -FilePath $BizHawkPath -ArgumentList $BizArgs -PassThru
$deadline = (Get-Date).AddSeconds($TimeoutSec)

while (-not $proc.HasExited) {
    Start-Sleep -Milliseconds 500
    $proc.Refresh()

    if ((Get-Date) -gt $deadline) {
        Stop-Process -Id $proc.Id -Force
        throw "Timed out after $TimeoutSec seconds."
    }
}

Write-Host "BizHawk run complete." -ForegroundColor Green
