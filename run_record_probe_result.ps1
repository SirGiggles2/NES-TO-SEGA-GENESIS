param(
    [string]$Rom,
    [string]$InteractionReport,
    [string]$Notes,
    [switch]$AllowRegression
)

$ErrorActionPreference = "Stop"

$ProjectRoot = $PSScriptRoot
$BuildDir = Join-Path $ProjectRoot "build"
$RecordScript = Join-Path $ProjectRoot "tools\record_probe_result.py"

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

    throw "No usable Python interpreter found for record_probe_result.py"
}

function Get-LatestRomName {
    $latest = Get-ChildItem -Path $BuildDir -Filter "zelda_v*.md" -File |
        Where-Object { $_.BaseName -match '^zelda_v\d+$' } |
        Sort-Object {
            if ($_.BaseName -match 'v(\d+)$') { [int]$Matches[1] } else { -1 }
        } -Descending |
        Select-Object -First 1

    if (-not $latest) {
        throw "No ROM metadata files found under $BuildDir"
    }

    return $latest.BaseName
}

if ([string]::IsNullOrWhiteSpace($Rom)) {
    $Rom = Get-LatestRomName
} else {
    $Rom = [System.IO.Path]::GetFileNameWithoutExtension($Rom)
}

if ([string]::IsNullOrWhiteSpace($InteractionReport)) {
    $InteractionReport = Join-Path $ProjectRoot ("diag\reports\gameplay_interaction_probe_" + $Rom + ".txt")
}

if (-not (Test-Path $InteractionReport)) {
    throw "Interaction report not found: $InteractionReport"
}

$Version = if ($Rom -match 'v(\d+)$') { [int]$Matches[1] } else { throw "Could not parse version from '$Rom'" }
$python = Resolve-PythonCommand

$argsList = @(
    $RecordScript,
    "--version", "$Version",
    "--interaction", $InteractionReport
)

if (-not [string]::IsNullOrWhiteSpace($Notes)) {
    $argsList += @("--notes", $Notes)
}
if (-not $AllowRegression) {
    $argsList += "--fail-on-regression"
}

& $python.command @($python.args + $argsList)
exit $LASTEXITCODE
