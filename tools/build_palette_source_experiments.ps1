[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$ConfigPath = Join-Path $RepoRoot "src/bridge/palette_experiment_config.asm"
$BuildBat = Join-Path $RepoRoot "build/build.bat"
$BuildDir = Join-Path $RepoRoot "build"

$Profiles = @(
    @{
        Name = "baseline"
        Equ = "PALETTE_EXPERIMENT_BASELINE"
        Description = "Mixed v677 palette tables"
    },
    @{
        Name = "raw_all"
        Equ = "PALETTE_EXPERIMENT_RAW_ALL"
        Description = "NES_PALETTE_DATA everywhere"
    },
    @{
        Name = "corrected_all"
        Equ = "PALETTE_EXPERIMENT_CORRECTED_ALL"
        Description = "CORRECT_NES_PALETTE everywhere"
    }
)

function Get-TrackedBuilds {
    $map = @{}
    Get-ChildItem -Path $BuildDir -Filter "zelda_v*.md" -File | ForEach-Object {
        if ($_.BaseName -match '^zelda_v(\d+)$') {
            $map[$Matches[1]] = $_.FullName
        }
    }
    return $map
}

function Set-Profile {
    param(
        [Parameter(Mandatory = $true)]
        [string]$EquName
    )

    $text = Get-Content -Path $ConfigPath -Raw
    $pattern = 'PALETTE_EXPERIMENT_PROFILE\s+EQU\s+\w+'
    if (-not [System.Text.RegularExpressions.Regex]::IsMatch($text, $pattern)) {
        throw "Could not update palette experiment profile in $ConfigPath."
    }
    $updated = [System.Text.RegularExpressions.Regex]::Replace(
        $text,
        $pattern,
        "PALETTE_EXPERIMENT_PROFILE       EQU $EquName"
    )
    [System.IO.File]::WriteAllText($ConfigPath, $updated, [System.Text.Encoding]::ASCII)
}

$OriginalConfig = Get-Content -Path $ConfigPath -Raw
$Results = @()

try {
    foreach ($profile in $Profiles) {
        Write-Host ""
        Write-Host "=== Building $($profile.Name) ===" -ForegroundColor Cyan
        Write-Host $profile.Description

        Set-Profile -EquName $profile.Equ
        $Before = Get-TrackedBuilds

        $env:SKIP_FRONTEND_PALETTE_CHECK = "1"
        try {
            & $BuildBat
            if ($LASTEXITCODE -ne 0) {
                throw "Build failed for profile $($profile.Name)."
            }
        }
        finally {
            Remove-Item Env:SKIP_FRONTEND_PALETTE_CHECK -ErrorAction SilentlyContinue
        }

        $After = Get-TrackedBuilds
        $NewVersion = $null
        foreach ($key in $After.Keys) {
            if (-not $Before.ContainsKey($key)) {
                $NewVersion = $key
                break
            }
        }
        if ($null -eq $NewVersion) {
            throw "Could not determine the new build version for $($profile.Name)."
        }

        $VersionTag = "zelda_v$NewVersion"
        $RomPath = Join-Path $BuildDir "$VersionTag.md"
        $LstPath = Join-Path $BuildDir "$VersionTag.lst"
        $TaggedRomPath = Join-Path $BuildDir "$VersionTag-palette-$($profile.Name).md"
        $TaggedLstPath = Join-Path $BuildDir "$VersionTag-palette-$($profile.Name).lst"

        Copy-Item -Path $RomPath -Destination $TaggedRomPath -Force
        if (Test-Path $LstPath) {
            Copy-Item -Path $LstPath -Destination $TaggedLstPath -Force
        }

        $Results += [PSCustomObject]@{
            Profile = $profile.Name
            Version = $VersionTag
            Rom = $TaggedRomPath
            List = $TaggedLstPath
        }
    }
}
finally {
    [System.IO.File]::WriteAllText($ConfigPath, $OriginalConfig, [System.Text.Encoding]::ASCII)
}

Write-Host ""
Write-Host "=== Palette Source Experiment Builds ===" -ForegroundColor Green
$Results | ForEach-Object {
    Write-Host ("{0} -> {1}" -f $_.Profile, $_.Version)
    Write-Host ("  ROM:  {0}" -f $_.Rom)
    if (Test-Path $_.List) {
        Write-Host ("  LST:  {0}" -f $_.List)
    }
}
