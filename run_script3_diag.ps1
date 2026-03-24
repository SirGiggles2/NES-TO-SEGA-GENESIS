# run_script3_diag.ps1
# Deep per-frame script=3 diagnostic for world-load hang investigation.
# Monitors screen_ready_flag, ppu_load_index, ram_007C every frame during script=3.
# Usage: .\run_script3_diag.ps1 -Rom zelda_v372

param(
    [string]$Rom = "zelda_v393"
)

$ErrorActionPreference = "Stop"

$BIZHAWK    = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR  = "$PROJECT\build"
$SCRIPT     = "$PROJECT\diag\scripts\zelda_script3_diag.lua"
$LOCK_PATH  = "$PROJECT\diag\scripts\zelda_script3_diag.lock"
$SendMeDir  = "$PROJECT\diag\reports\Files I Want"
$ReportsDir = "$PROJECT\diag\reports"

$BaseName   = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath    = "$BUILD_DIR\$BaseName.md"
$OutputPath = "$ReportsDir\script3_diag_$BaseName.txt"

if (-not (Test-Path $BIZHAWK)) { Write-Error "EmuHawk.exe not found at: $BIZHAWK"; exit 1 }
if (-not (Test-Path $RomPath))  { Write-Error "ROM not found: $RomPath";             exit 1 }

Write-Host "=== SCRIPT3 DEEP DIAGNOSTIC ===" -ForegroundColor Cyan
Write-Host "ROM:    $BaseName"
Write-Host "Output: $OutputPath"
Write-Host ""
Write-Host "Monitors per-frame: screen_ready_flag, ppu_load_index, ram_007C, ram_007D, render_flag"
Write-Host "Key: ready=0 => PRIMARY handler runs; ready!=0 => SECONDARY handler runs"
Write-Host ""

if (Test-Path $LOCK_PATH) {
    throw "Already running. Remove $LOCK_PATH if previous run crashed."
}

New-Item -ItemType File -Path $LOCK_PATH | Out-Null

$OriginalLua = [System.IO.File]::ReadAllText($SCRIPT)
$UpdatedLua  = $OriginalLua -replace 'local ROM_VERSION\s*=.*', "local ROM_VERSION  = `"$BaseName`"   -- patched by PS launcher"
[System.IO.File]::WriteAllText($SCRIPT, $UpdatedLua)

try {
    $BizArgs = ('"{0}" --lua="{1}"' -f $RomPath, $SCRIPT)
    $proc    = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru

    $deadline = (Get-Date).AddMinutes(15)
    $done     = $false

    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $proc.Refresh()

        if (-not $done -and (Test-Path $OutputPath)) {
            $fs     = [System.IO.File]::Open($OutputPath, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
            $reader = New-Object System.IO.StreamReader($fs)
            $content = $reader.ReadToEnd()
            $reader.Close(); $fs.Close()

            if ($content -match '=== SUMMARY ===') {
                Start-Sleep -Milliseconds 500
                $done = $true
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

    $proc.WaitForExit()

    if (Test-Path $OutputPath) {
        Copy-Item $OutputPath "$SendMeDir\" -Force
        Write-Host ""
        Write-Host "Results copied to Files I Want\" -ForegroundColor Green
        Write-Host ""
        Get-Content $OutputPath
    } else {
        Write-Warning "No output file produced."
    }
}
finally {
    [System.IO.File]::WriteAllText($SCRIPT, $OriginalLua)
    if (Test-Path $LOCK_PATH) { Remove-Item $LOCK_PATH -Force }
}
