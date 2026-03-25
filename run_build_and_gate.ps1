param(
    [string]$Rom,
    [switch]$SkipBuild,
    [int]$MaxEntryFrame = 1200
)

$ErrorActionPreference = "Stop"

$ProjectRoot = $PSScriptRoot
$BuildDir = Join-Path $ProjectRoot "build"
$BuildScript = Join-Path $BuildDir "build.bat"
$RuntimeGateScript = Join-Path $ProjectRoot "run_runtime_gate.ps1"
$StaticScoreScript = Join-Path $ProjectRoot "tools\static_score.py"
$AccuracyTrackerScript = Join-Path $ProjectRoot "tools\accuracy_tracker.py"
$ReportsDir = Join-Path $ProjectRoot "diag\reports"

function Get-LatestBuildArtifact([string]$Extension) {
    $latest = Get-ChildItem -Path $BuildDir -Filter "zelda_v*.$Extension" -File |
        Where-Object { $_.BaseName -match '^zelda_v\d+$' } |
        Sort-Object {
            if ($_.BaseName -match 'v(\d+)$') { [int]$Matches[1] } else { -1 }
        } -Descending |
        Select-Object -First 1

    return $latest
}

function Get-VersionNumber([string]$BaseName) {
    if ($BaseName -notmatch 'v(\d+)$') {
        throw "Could not parse version number from ROM name '$BaseName'"
    }

    return [int]$Matches[1]
}

function Resolve-PythonCommand {
    $candidates = @(
        @{ command = "C:\Users\Jake Diggity\AppData\Local\Python\pythoncore-3.14-64\python.exe"; args = @() },
        @{ command = "py"; args = @("-3") },
        @{ command = "python"; args = @() },
        @{ command = "python3"; args = @() }
    )

    foreach ($candidate in $candidates) {
        $path = $null

        if ($candidate.command.Contains("\\")) {
            if (-not (Test-Path $candidate.command)) {
                continue
            }

            $path = $candidate.command
        } else {
            $resolved = Get-Command $candidate.command -ErrorAction SilentlyContinue
            if (-not $resolved) {
                continue
            }

            $path = if ($resolved.Path) { $resolved.Path } else { $candidate.command }
        }

        try {
            & $path @($candidate.args + @("-c", "import sys")) *> $null
            if ($LASTEXITCODE -eq 0) {
                return @{ command = $path; args = $candidate.args }
            }
        }
        catch {
            continue
        }
    }

    throw "No usable Python interpreter found for static_score.py"
}

function Get-StaticScore([string]$ListingPath) {
    if (-not (Test-Path $ListingPath)) {
        throw "Listing file not found for static score: $ListingPath"
    }

    $python = Resolve-PythonCommand
    $output = & $python.command @($python.args + @($StaticScoreScript, "--lst", $ListingPath, "--json"))
    if ($LASTEXITCODE -ne 0) {
        throw "static_score.py failed with exit code $LASTEXITCODE"
    }

    $parsed = $output | ConvertFrom-Json
    return [int]$parsed.static_score
}

function Invoke-Stage([string]$Name, [scriptblock]$Action) {
    Write-Host ""
    Write-Host "=== $Name ===" -ForegroundColor Cyan
    $timer = [System.Diagnostics.Stopwatch]::StartNew()
    & $Action
    $timer.Stop()
    Write-Host ("{0} time: {1:N1}s" -f $Name, $timer.Elapsed.TotalSeconds) -ForegroundColor DarkCyan
}

if ($Rom -and -not $SkipBuild) {
    throw "Use -Rom only with -SkipBuild, or omit -Rom to build the next version automatically."
}

$BeforeRom = Get-LatestBuildArtifact "md"
$TargetRom = $null
$StaticScore = $null
$totalTimer = [System.Diagnostics.Stopwatch]::StartNew()

Write-Host "=== BUILD + RUNTIME GATE ===" -ForegroundColor Green
if ($SkipBuild) {
    Write-Host "Mode:            runtime gate only" -ForegroundColor Yellow
} else {
    Write-Host "Mode:            build then runtime gate"
}
Write-Host "Entry budget:    $MaxEntryFrame"

if (-not $SkipBuild) {
    Invoke-Stage "Build" {
        & $BuildScript
        if ($LASTEXITCODE -ne 0) {
            throw "build.bat failed with exit code $LASTEXITCODE"
        }
    }

    $AfterRom = Get-LatestBuildArtifact "md"
    if (-not $AfterRom) {
        throw "Build finished, but no ROM was found under $BuildDir"
    }

    if ($BeforeRom -and ($AfterRom.BaseName -eq $BeforeRom.BaseName)) {
        throw "Build finished, but no newer ROM version was created."
    }

    $TargetRom = $AfterRom.BaseName
} else {
    if ([string]::IsNullOrWhiteSpace($Rom)) {
        $LatestRom = Get-LatestBuildArtifact "md"
        if (-not $LatestRom) {
            throw "No build ROMs found under $BuildDir"
        }
        $TargetRom = $LatestRom.BaseName
    } else {
        $TargetRom = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
    }
}

$TargetVersion = Get-VersionNumber $TargetRom
$TargetListing = Join-Path $BuildDir ($TargetRom + ".lst")

Invoke-Stage "Static Score" {
    $script:StaticScore = Get-StaticScore $TargetListing
    Write-Host "ROM:             $TargetRom"
    Write-Host "Version:         $TargetVersion"
    Write-Host "Static score:    $script:StaticScore" -ForegroundColor Green

    Invoke-Command -ScriptBlock {
        & $RuntimeGateScript -Rom $TargetRom -Score $script:StaticScore -MaxEntryFrame $MaxEntryFrame
        if ($LASTEXITCODE -ne 0) {
            throw "run_runtime_gate.ps1 failed with exit code $LASTEXITCODE"
        }
    }
}

Invoke-Stage "Accuracy Tracker" {
    if ($null -eq $script:StaticScore) {
        throw "Static score is missing before accuracy tracking"
    }

    $python = Resolve-PythonCommand
    $frontendReport = Join-Path $ReportsDir ("frontend_probe_" + $TargetRom + ".txt")
    $gameplayReport = Join-Path $ReportsDir ("gameplay_probe_" + $TargetRom + ".txt")

    $trackerArgs = @(
        $AccuracyTrackerScript,
        "--version", "$TargetVersion",
        "--static-score", "$script:StaticScore",
        "--frontend", $frontendReport,
        "--gameplay", $gameplayReport,
        "--update-ledger",
        "--fail-on-regression"
    )

    & $python.command @($python.args + $trackerArgs)
    if ($LASTEXITCODE -ne 0) {
        throw "accuracy_tracker.py reported a regression (exit code $LASTEXITCODE)"
    }
}

Write-Host ""
$totalTimer.Stop()
Write-Host ("Total build+gate time: {0:N1}s" -f $totalTimer.Elapsed.TotalSeconds) -ForegroundColor Cyan
Write-Host "BUILD + RUNTIME GATE PASSED: $TargetRom" -ForegroundColor Green