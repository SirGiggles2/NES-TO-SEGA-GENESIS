param(
    [string]$Rom = "zelda_v478"
)

$ErrorActionPreference = "Stop"

$BIZHAWK    = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$BUILD_DIR  = "$PROJECT\build"
$SCRIPT     = "$PROJECT\diag\scripts\zelda_transition_trace.lua"
$REPORTS    = "$PROJECT\diag\reports"

$BaseName   = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
$RomPath    = "$BUILD_DIR\$BaseName.md"
$OutputPath = "$REPORTS\transition_trace_$BaseName.txt"

if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $RomPath))  { throw "ROM not found: $RomPath" }

$OriginalLua = [System.IO.File]::ReadAllText($SCRIPT)
$UpdatedLua  = $OriginalLua -replace 'local ROM_VERSION\s*=.*', "local ROM_VERSION = `"$BaseName`""
[System.IO.File]::WriteAllText($SCRIPT, $UpdatedLua)

try {
    Write-Host "=== TRANSITION TRACE ===" -ForegroundColor Cyan
    Write-Host "ROM:    $BaseName"
    Write-Host "Output: $OutputPath"
    Write-Host ""

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

            if ($content -match 'TRACE COMPLETE') {
                $null = $proc.CloseMainWindow()
                Start-Sleep -Seconds 3
                $proc.Refresh()
                if (-not $proc.HasExited) { Stop-Process -Id $proc.Id -Force }
                break
            }
        }

        if ((Get-Date) -gt $deadline) {
            Stop-Process -Id $proc.Id -Force
            throw "Timed out after 10 minutes."
        }
    }

    if (Test-Path $OutputPath) {
        Write-Host ""
        Get-Content $OutputPath
    } else {
        Write-Warning "No output file produced."
    }
}
finally {
    [System.IO.File]::WriteAllText($SCRIPT, $OriginalLua)
}
