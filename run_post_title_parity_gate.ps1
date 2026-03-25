param(
    [Parameter(Mandatory = $true)]
    [string]$Rom,
    [string]$ProbeReport,
    [string]$StateReport,
    [string]$StartReport,
    [int]$ExpectedSlot = 3,
    [string]$ExpectedActive = "00,00,00,01,01",
    [int]$MinStable = 90
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ToolPath = Join-Path $RepoRoot "tools\post_title_parity_gate.py"

if (!(Test-Path $ToolPath)) {
    throw "Missing gate script: $ToolPath"
}

$Python = "py"
$Args = @(
    "-3",
    $ToolPath,
    "--rom", $Rom,
    "--expected-slot", $ExpectedSlot,
    "--expected-active", $ExpectedActive,
    "--min-stable", $MinStable
)

if ($ProbeReport) {
    $Args += @("--probe-report", $ProbeReport)
}
if ($StateReport) {
    $Args += @("--state-report", $StateReport)
}
if ($StartReport) {
    $Args += @("--start-report", $StartReport)
}

& $Python @Args
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}