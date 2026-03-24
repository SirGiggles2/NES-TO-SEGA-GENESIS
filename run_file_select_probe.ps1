param(
    [string]$Rom = "zelda_v430"
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$BizHawk = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$LuaPath = Join-Path $RepoRoot "diag\scripts\zelda_file_select_probe.lua"
$RomPath = Join-Path $RepoRoot ("build\" + $Rom + ".md")
$OutPath = Join-Path $RepoRoot ("diag\reports\file_select_probe_" + $Rom + ".txt")
$LockPath = Join-Path $RepoRoot "diag\reports\file_select_probe.lock"

if (!(Test-Path $BizHawk)) {
    throw "BizHawk not found at $BizHawk"
}
if (!(Test-Path $RomPath)) {
    throw "ROM not found: $RomPath"
}

$luaOriginal = Get-Content $LuaPath -Raw
try {
    $luaPatched = $luaOriginal -replace 'local ROM_VERSION = ".*?"', ('local ROM_VERSION = "' + $Rom + '"')
    Set-Content $LuaPath $luaPatched -NoNewline

    if (Test-Path $OutPath) { Remove-Item $OutPath -Force }
    if (Test-Path $LockPath) { Remove-Item $LockPath -Force }
    New-Item -ItemType File -Path $LockPath -Force | Out-Null

    $BizArgs = ('"{0}" --lua="{1}"' -f $RomPath, $LuaPath)
    $proc = Start-Process -FilePath $BizHawk -ArgumentList $BizArgs -PassThru

    $deadline = (Get-Date).AddMinutes(3)
    while ((Get-Date) -lt $deadline) {
        Start-Sleep -Milliseconds 500

        if (Test-Path $OutPath) {
            $content = Get-Content $OutPath -Raw -ErrorAction SilentlyContinue
            if ($content -match "=== SUMMARY ===") {
                break
            }
        }

        if ($proc.HasExited) {
            break
        }
    }

    if (!$proc.HasExited) {
        Stop-Process -Id $proc.Id -Force
    }

    if (Test-Path $OutPath) {
        Get-Content $OutPath
    } else {
        Write-Error "Probe output was not created: $OutPath"
    }
}
finally {
    Set-Content $LuaPath $luaOriginal -NoNewline
    if (Test-Path $LockPath) { Remove-Item $LockPath -Force }
}
