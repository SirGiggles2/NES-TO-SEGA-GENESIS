# run_start_injection_test.ps1
# Tests Start button RAM injection on a given ROM build.
# Usage: .\run_start_injection_test.ps1 -Rom zelda_v358

param(
    [string]$Rom = "zelda_v375"
)

$ErrorActionPreference = "Stop"

$BIZHAWK    = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR  = "$PROJECT\build"
$SCRIPT     = "$PROJECT\diag\scripts\zelda_quick_start_test.lua"
$LOCK_PATH  = "$PROJECT\diag\scripts\zelda_start_injection.lock"
$SendMeDir  = "$PROJECT\diag\reports\Files I Want"
$ReportsDir = "$PROJECT\diag\reports"

$BaseName   = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath    = "$BUILD_DIR\$BaseName.md"
$OutputPath = "$ReportsDir\start_injection_$BaseName.txt"

if (-not (Test-Path $BIZHAWK)) { Write-Error "EmuHawk.exe not found at: $BIZHAWK"; exit 1 }
if (-not (Test-Path $RomPath))  { Write-Error "ROM not found: $RomPath";             exit 1 }

Write-Host "=== START INJECTION TEST ===" -ForegroundColor Cyan
Write-Host "ROM:    $BaseName"
Write-Host "Output: $OutputPath"
Write-Host ""

if (Test-Path $LOCK_PATH) {
    throw "Already running. Remove $LOCK_PATH if previous run crashed."
}

New-Item -ItemType File -Path $LOCK_PATH | Out-Null
$PrevWriteUtc = if (Test-Path $OutputPath) { (Get-Item $OutputPath).LastWriteTimeUtc } else { $null }

$OriginalLua = [System.IO.File]::ReadAllText($SCRIPT)
$UpdatedLua  = $OriginalLua -replace 'local ROM_VERSION\s*=.*', "local ROM_VERSION  = `"$BaseName`"   -- patched by PS launcher"
[System.IO.File]::WriteAllText($SCRIPT, $UpdatedLua)

try {
    $BizArgs = @("`"$RomPath`"", "`"--lua=$SCRIPT`"")
    $proc    = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru

    $deadline = (Get-Date).AddMinutes(10)
    $done     = $false

    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $proc.Refresh()

        if (-not $done -and (Test-Path $OutputPath)) {
            # Wait for Lua to write the summary section, not just the header
            $fs = [System.IO.File]::Open($OutputPath, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
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
            throw "Timed out."
        }
    }

    $proc.WaitForExit()

    # Copy results
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
