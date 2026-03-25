param(
    [string]$Rom,
    [int]$Score,
    [int]$MaxEntryFrame = 1200
)

$ErrorActionPreference = "Stop"

$ProjectRoot = $PSScriptRoot
$BuildDir = Join-Path $ProjectRoot "build"
$ReportsDir = Join-Path $ProjectRoot "diag\reports"
$LedgerPath = Join-Path $ProjectRoot "artifacts\score_ledger.csv"
$GateScript = Join-Path $ProjectRoot "tools\regression_gate.py"

function Get-LatestRomName {
    $latest = Get-ChildItem -Path $BuildDir -Filter "zelda_v*.md" -File |
        Where-Object { $_.BaseName -match '^zelda_v\d+$' } |
        Sort-Object {
            if ($_.BaseName -match 'v(\d+)$') { [int]$Matches[1] } else { -1 }
        } -Descending |
        Select-Object -First 1

    if (-not $latest) {
        throw "No build ROMs found under $BuildDir"
    }

    return $latest.BaseName
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

    throw "No usable Python interpreter found for regression_gate.py"
}

function Get-LedgerScore([int]$VersionNumber) {
    if (-not (Test-Path $LedgerPath)) {
        return $null
    }

    $row = Import-Csv $LedgerPath |
        Where-Object { $_.version -eq "$VersionNumber" } |
        Select-Object -Last 1

    if (-not $row -or -not $row.static_score) {
        return $null
    }

    return [int]$row.static_score
}

function Read-JsonFile([string]$Path) {
    if (-not (Test-Path $Path)) {
        throw "JSON report not found: $Path"
    }

    return Get-Content $Path -Raw | ConvertFrom-Json
}

function Read-KeyValueReport([string]$Path) {
    if (-not (Test-Path $Path)) {
        throw "Text report not found: $Path"
    }

    $data = @{}
    foreach ($line in Get-Content $Path) {
        if ($line -match '^([^=]+)=(.*)$') {
            $data[$Matches[1].Trim()] = $Matches[2].Trim()
        }
    }

    return $data
}

function Get-LastBranchScript([string]$Path) {
    if (-not (Test-Path $Path)) {
        throw "Frontend report not found: $Path"
    }

    $line = Get-Content $Path |
        Select-String 'branch_frame=\d+ branch_script=\d+' |
        Select-Object -Last 1

    if (-not $line) {
        return $null
    }

    if ($line.Line -match 'branch_script=(\d+)') {
        return [int]$Matches[1]
    }

    return $null
}

function Test-FrontendSuccess([string]$Path) {
    $report = Read-KeyValueReport $Path
    $branchScript = Get-LastBranchScript $Path

    if (-not $report.ContainsKey("title_ready_frame")) {
        throw "Frontend probe never reached title_ready_frame"
    }

    if (-not $report.ContainsKey("file_select_ready_frame")) {
        throw "Frontend probe never reached file_select_ready_frame"
    }

    if ($null -eq $branchScript) {
        throw "Frontend probe never recorded a branch_script"
    }

    if (($branchScript -lt 5) -and ($branchScript -notin 13, 14, 15)) {
        throw "Frontend probe branched to unexpected script $branchScript"
    }

    return [pscustomobject]@{
        branch_script = $branchScript
        final_phase = $report["final_phase"]
    }
}

function Test-GameplaySuccess([string]$Path, [int]$EntryBudget) {
    $report = Read-KeyValueReport $Path
    $entryFrame = $null

    if ($report.ContainsKey("gameplay_entry_frame") -and $report["gameplay_entry_frame"] -match '^\d+$') {
        $entryFrame = [int]$report["gameplay_entry_frame"]
    }

    if ($report["final_phase"] -ne "capture_gameplay") {
        throw "Gameplay probe ended in final_phase=$($report["final_phase"])"
    }

    if ($null -eq $entryFrame) {
        throw "Gameplay probe did not record gameplay_entry_frame"
    }

    if ($entryFrame -gt $EntryBudget) {
        throw "Gameplay entry frame $entryFrame exceeded budget $EntryBudget"
    }

    return [pscustomobject]@{
        branch_script = if ($report.ContainsKey("branch_script") -and $report["branch_script"] -match '^\d+$') { [int]$report["branch_script"] } else { $null }
        entry_frame = $entryFrame
        final_phase = $report["final_phase"]
    }
}

function Invoke-Stage([string]$Name, [scriptblock]$Action) {
    Write-Host ""
    Write-Host "=== $Name ===" -ForegroundColor Cyan
    $timer = [System.Diagnostics.Stopwatch]::StartNew()
    & $Action
    $timer.Stop()
    Write-Host ("{0} time: {1:N1}s" -f $Name, $timer.Elapsed.TotalSeconds) -ForegroundColor DarkCyan
}

$BaseName = if ([string]::IsNullOrWhiteSpace($Rom)) { Get-LatestRomName } else { [System.IO.Path]::GetFileNameWithoutExtension($Rom) }
$VersionNumber = Get-VersionNumber $BaseName
$ResolvedScore = if ($PSBoundParameters.ContainsKey("Score")) { $Score } else { Get-LedgerScore $VersionNumber }

$SmokePath = Join-Path $ReportsDir "smoke_test_$BaseName.json"
$FrontendPath = Join-Path $ReportsDir "frontend_probe_$BaseName.txt"
$GameplayPath = Join-Path $ReportsDir "gameplay_probe_$BaseName.txt"

Write-Host "=== RUNTIME GATE ===" -ForegroundColor Green
$totalTimer = [System.Diagnostics.Stopwatch]::StartNew()
Write-Host "ROM:             $BaseName"
Write-Host "Version:         $VersionNumber"
Write-Host "Entry budget:    $MaxEntryFrame"
if ($null -ne $ResolvedScore) {
    Write-Host "Static score:    $ResolvedScore"
} else {
    Write-Host "Static score:    <not provided; gate will skip score check>" -ForegroundColor Yellow
}

Invoke-Stage "Smoke" {
    & (Join-Path $ProjectRoot "run_smoke_test.ps1") -Rom $BaseName
    $smoke = Read-JsonFile $SmokePath
    if (-not $smoke.pass) {
        throw "Smoke test failed for $BaseName"
    }
    Write-Host "Smoke summary: pass=$($smoke.pass) ready_count=$($smoke.ready_count) frames=$($smoke.frames)" -ForegroundColor Green
}

Invoke-Stage "Frontend" {
    & (Join-Path $ProjectRoot "run_frontend_probe.ps1") -Rom $BaseName
    $frontend = Test-FrontendSuccess $FrontendPath
    Write-Host "Frontend summary: branch_script=$($frontend.branch_script) final_phase=$($frontend.final_phase)" -ForegroundColor Green
}

Invoke-Stage "Gameplay" {
    & (Join-Path $ProjectRoot "run_gameplay_probe.ps1") -Rom $BaseName
    $gameplay = Test-GameplaySuccess $GameplayPath $MaxEntryFrame
    Write-Host "Gameplay summary: branch_script=$($gameplay.branch_script) entry_frame=$($gameplay.entry_frame) final_phase=$($gameplay.final_phase)" -ForegroundColor Green
}

Invoke-Stage "Regression Gate" {
    $python = Resolve-PythonCommand
    $gateArgs = @($GateScript, "--version", "$VersionNumber", "--require-gameplay", "--max-entry-frame", "$MaxEntryFrame")
    if ($null -ne $ResolvedScore) {
        $gateArgs += @("--score", "$ResolvedScore")
    }

    & $python.command @($python.args + $gateArgs)
    if ($LASTEXITCODE -ne 0) {
        throw "Regression gate failed with exit code $LASTEXITCODE"
    }
}

Write-Host ""
$totalTimer.Stop()
Write-Host ("Total runtime gate time: {0:N1}s" -f $totalTimer.Elapsed.TotalSeconds) -ForegroundColor Cyan
Write-Host "RUNTIME GATE PASSED: $BaseName" -ForegroundColor Green