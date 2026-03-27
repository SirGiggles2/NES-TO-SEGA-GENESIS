param(
    [string]$Rom = "zelda_v599"
)

$ErrorActionPreference = "Stop"

$BIZHAWK    = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR  = "$PROJECT\build"
$SCRIPT     = "$PROJECT\diag\scripts\zelda_smoke_test.lua"
$TEMP_SCRIPT = "$PROJECT\diag\scripts\zelda_smoke_test.runtime.lua"
$REPORTS    = "$PROJECT\diag\reports"

$BaseName   = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath    = "$BUILD_DIR\$BaseName.md"
$OutputPath = "$REPORTS\smoke_test_$BaseName.json"

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $RomPath))  { throw "ROM not found: $RomPath" }
if (-not (Test-Path $SCRIPT))   { throw "Probe Lua not found: $SCRIPT" }

# Patch ROM_VERSION into the Lua script
$OriginalLua = [System.IO.File]::ReadAllText($SCRIPT)
$UpdatedLua  = $OriginalLua -replace 'local ROM_VERSION\s*=.*', "local ROM_VERSION = `"$BaseName`""
[System.IO.File]::WriteAllText($TEMP_SCRIPT, $UpdatedLua)

try {
    # Remove stale output
    if (Test-Path $OutputPath) { Remove-Item $OutputPath -Force }

    Write-Host "=== SMOKE TEST ===" -ForegroundColor Cyan
    Write-Host "ROM:    $BaseName"
    Write-Host "Output: $OutputPath"
    Write-Host ""

    $BizArgs = ('"{0}" --lua="{1}"' -f $RomPath, $TEMP_SCRIPT)
    $proc = Start-Process -FilePath $BIZHAWK -ArgumentList $BizArgs -PassThru
    $deadline = (Get-Date).AddMinutes(5)

    while (-not $proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $proc.Refresh()

        if (Test-Path $OutputPath) {
            # JSON written = smoke test done
            Start-Sleep -Seconds 2
            if (-not $proc.HasExited) {
                $null = $proc.CloseMainWindow()
                Start-Sleep -Seconds 3
                $proc.Refresh()
                if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
            }
            break
        }

        if ((Get-Date) -gt $deadline) {
            Stop-Process -Id $proc.Id -Force
            throw "Timed out after 5 minutes."
        }
    }

    if (Test-Path $OutputPath) {
        Write-Host ""
        $result = Get-Content $OutputPath -Raw | ConvertFrom-Json
        Write-Host "VRAM:    $(if ($result.pass_vram) {'PASS'} else {'FAIL'})" -ForegroundColor $(if ($result.pass_vram) {'Green'} else {'Red'})
        Write-Host "Ready:   $(if ($result.pass_ready) {'PASS (count=' + $result.ready_count + ')'} else {'FAIL'})" -ForegroundColor $(if ($result.pass_ready) {'Green'} else {'Red'})
        Write-Host "Info:    max_script=$($result.max_script) frm_cnt=$($result.final_frm_cnt) frames=$($result.frames)"
        Write-Host ""
        if ($result.pass) {
            Write-Host "RESULT: PASS" -ForegroundColor Green
        } else {
            Write-Host "RESULT: FAIL" -ForegroundColor Red
        }
    } else {
        Write-Warning "No output file produced. BizHawk may have crashed."
    }
}
finally {
    if (Test-Path $TEMP_SCRIPT) { Remove-Item $TEMP_SCRIPT -Force }
}
