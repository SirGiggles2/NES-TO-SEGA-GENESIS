param(
    [Parameter(Mandatory = $true)]
    [string]$Rom,
    [string]$ProbeReport
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ToolPath = Join-Path $RepoRoot "tools\gameplay_interaction_gate.py"

if (!(Test-Path $ToolPath)) {
    throw "Missing gameplay interaction gate script: $ToolPath"
}

$Args = @(
    "-3",
    $ToolPath,
    "--rom", $Rom
)

if ($ProbeReport) {
    $Args += @("--probe-report", $ProbeReport)
}

& py @Args
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
