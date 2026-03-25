param(
    [Parameter(Mandatory = $true)]
    [string]$Rom,
    [string]$ProbeReport,
    [string]$StateReport,
    [string]$AttrReport
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ToolPath = Join-Path $RepoRoot "tools\gameplay_parity_gate.py"

if (!(Test-Path $ToolPath)) {
    throw "Missing gameplay gate script: $ToolPath"
}

$Args = @(
    "-3",
    $ToolPath,
    "--rom", $Rom
)

if ($ProbeReport) {
    $Args += @("--probe-report", $ProbeReport)
}
if ($StateReport) {
    $Args += @("--state-report", $StateReport)
}
if ($AttrReport) {
    $Args += @("--attr-report", $AttrReport)
}

& py @Args
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}