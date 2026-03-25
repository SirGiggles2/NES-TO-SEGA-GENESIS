param(
    [string]$Rom,
    [string]$ReportPath
)

$ErrorActionPreference = "Stop"

if (-not $ReportPath) {
    if (-not $Rom) {
        throw "Provide -Rom <zelda_vNNN> or -ReportPath <file>."
    }
    $ReportPath = "diag/reports/title_timeline_${Rom}.txt"
}

if (-not (Test-Path $ReportPath)) {
    throw "Report not found: $ReportPath"
}

$lines = Get-Content $ReportPath

$currentFrame = $null
$indexTransitions = @()
$lastIdx = $null
$firstNt08 = $null
$firstNt11 = $null

foreach ($line in $lines) {
    if ($line -match '^SNAPSHOT frame=(\d+) reason=([A-Za-z0-9_]+)') {
        $currentFrame = [int]$Matches[1]
        continue
    }

    if ($line -match 'state .* ppu_idx=([0-9A-F]{2}) ') {
        $idx = $Matches[1]
        if ($lastIdx -ne $idx) {
            $indexTransitions += [pscustomobject]@{ Frame = $currentFrame; Index = $idx }
            $lastIdx = $idx
        }
        continue
    }

    if (-not $firstNt08 -and $line -match '^\s*nt_row_08=(.+)$') {
        $row = $Matches[1].Trim()
        if ($row -notmatch '^(00\s+){31}00$') {
            $firstNt08 = [pscustomobject]@{ Frame = $currentFrame; Row = $row }
        }
        continue
    }

    if (-not $firstNt11 -and $line -match '^\s*nt_row_11=(.+)$') {
        $row = $Matches[1].Trim()
        if ($row -notmatch '^(00\s+){31}00$') {
            $firstNt11 = [pscustomobject]@{ Frame = $currentFrame; Row = $row }
        }
        continue
    }
}

Write-Host "=== TITLE TIMELINE SUMMARY ==="
Write-Host "Report: $ReportPath"
Write-Host ""
Write-Host "Index transitions:"
if ($indexTransitions.Count -eq 0) {
    Write-Host "  (none)"
} else {
    foreach ($t in $indexTransitions) {
        Write-Host ("  frame={0} idx={1}" -f $t.Frame, $t.Index)
    }
}

Write-Host ""
if ($firstNt08) {
    Write-Host ("First nt_row_08 non-zero: frame={0}" -f $firstNt08.Frame)
    Write-Host ("  {0}" -f $firstNt08.Row)
} else {
    Write-Host "First nt_row_08 non-zero: not found"
}

Write-Host ""
if ($firstNt11) {
    Write-Host ("First nt_row_11 non-zero: frame={0}" -f $firstNt11.Frame)
    Write-Host ("  {0}" -f $firstNt11.Row)
} else {
    Write-Host "First nt_row_11 non-zero: not found"
}
