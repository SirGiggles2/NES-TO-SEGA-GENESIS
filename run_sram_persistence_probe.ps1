param(
    [string]$Rom = "zelda_v542",
    [int]$TimeoutSeconds = 180,
    [string]$BizHawkPath = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
)

$ErrorActionPreference = "Stop"

$Project = (Resolve-Path ".").Path
$RomPath = Join-Path $Project "build\$Rom.md"
$WriteLua = Join-Path $Project "diag\scripts\sram_write_probe.lua"
$ReadLua = Join-Path $Project "diag\scripts\sram_read_probe.lua"
$ReportsDir = Join-Path $Project "diag\reports"
$WriteOut = Join-Path $ReportsDir "sram_write_probe.txt"
$ReadOut = Join-Path $ReportsDir "sram_read_probe.txt"
$WriteOutRom = Join-Path $ReportsDir "sram_write_probe_$Rom.txt"
$ReadOutRom = Join-Path $ReportsDir "sram_read_probe_$Rom.txt"

if (-not (Test-Path $BizHawkPath)) {
    $LocalBizHawkPath = Join-Path $Project "BizHawk\EmuHawk.exe"
    if (Test-Path $LocalBizHawkPath) {
        $BizHawkPath = $LocalBizHawkPath
    }
}

if (-not (Test-Path $BizHawkPath)) { throw "EmuHawk.exe not found: $BizHawkPath" }
if (-not (Test-Path $RomPath)) { throw "ROM not found: $RomPath" }
if (-not (Test-Path $WriteLua)) { throw "Missing Lua script: $WriteLua" }
if (-not (Test-Path $ReadLua)) { throw "Missing Lua script: $ReadLua" }

function Invoke-BizHawkLua {
    param(
        [string]$LuaPath,
        [string]$Label,
        [string]$ProbeOutputPath,
        [string]$CompletionMarker
    )

    Write-Host "Running $Label ..."
    $BizArgs = @(
        "`"$RomPath`"",
        "`"--lua=$LuaPath`""
    )
    $proc = Start-Process -FilePath $BizHawkPath -ArgumentList $BizArgs -PassThru
    $deadline = (Get-Date).AddSeconds($TimeoutSeconds)

    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $proc.Refresh()

        if (Test-Path $ProbeOutputPath) {
            $text = Get-Content $ProbeOutputPath -Raw
            if ($text -match [regex]::Escape($CompletionMarker)) {
                $null = $proc.CloseMainWindow()
                Start-Sleep -Seconds 2
                $proc.Refresh()
                if (-not $proc.HasExited) {
                    Stop-Process -Id $proc.Id -Force
                }
                break
            }
        }

        if ((Get-Date) -gt $deadline) {
            Stop-Process -Id $proc.Id -Force
            throw "$Label timed out after $TimeoutSeconds seconds"
        }
    }

    Write-Host "$Label finished (exit=$($proc.ExitCode))"
}

if (Test-Path $WriteOut) { Remove-Item $WriteOut -Force }
if (Test-Path $ReadOut) { Remove-Item $ReadOut -Force }

Invoke-BizHawkLua -LuaPath $WriteLua -Label "SRAM write probe" -ProbeOutputPath $WriteOut -CompletionMarker "SRAM WRITE PROBE COMPLETE"
Start-Sleep -Seconds 1
Invoke-BizHawkLua -LuaPath $ReadLua -Label "SRAM read probe" -ProbeOutputPath $ReadOut -CompletionMarker "SRAM READ PROBE COMPLETE"

if (Test-Path $WriteOut) { Copy-Item $WriteOut $WriteOutRom -Force }
if (Test-Path $ReadOut) { Copy-Item $ReadOut $ReadOutRom -Force }

Write-Host ""
Write-Host "=== SRAM WRITE PROBE ==="
if (Test-Path $WriteOutRom) {
    Get-Content $WriteOutRom
} else {
    Write-Warning "Missing output: $WriteOutRom"
}

Write-Host ""
Write-Host "=== SRAM READ PROBE ==="
if (Test-Path $ReadOutRom) {
    Get-Content $ReadOutRom
} else {
    Write-Warning "Missing output: $ReadOutRom"
}
