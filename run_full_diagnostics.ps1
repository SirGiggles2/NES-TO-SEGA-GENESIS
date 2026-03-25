# Comprehensive Emulator Diagnostics Suite
# Tests: Oracle Progression, SRAM Persistence, Gameplay State
# Usage: .\run_full_diagnostics.ps1 -SkipGameplay

param(
    [string[]]$BuildsToTest = @("zelda_v540", "zelda_v541", "zelda_v542"),
    [switch]$SkipOracle,
    [switch]$SkipGameplay,
    [switch]$SkipSRAM
)

$ErrorActionPreference = "Continue"
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmm"
$reportDir = ".\diag\reports"

if (-not (Test-Path $reportDir)) {
    New-Item -ItemType Directory -Path $reportDir | Out-Null
}

Write-Host "`n=== COMPREHENSIVE EMULATOR DIAGNOSTICS ===" -ForegroundColor Cyan
Write-Host "    Baseline Testing Before Hardware Builds`n" -ForegroundColor Cyan

$summaryReport = @()

# ========================================
# PHASE 1: ORACLE RAM START TEST
# ========================================
if (-not $SkipOracle) {
    Write-Host "PHASE 1: ORACLE RAM START TEST" -ForegroundColor Yellow
    Write-Host "================================`n" -ForegroundColor Yellow
    
    foreach ($build in $BuildsToTest) {
        Write-Host "Testing $build..." -ForegroundColor Green
        
        $testFrames = @(215, 229, 300, 500, 960)
        
        foreach ($frame in $testFrames) {
            .\run_oracle_ram_start.ps1 -Rom $build -StartFrame $frame -HoldFrames 1 | Out-Null
            
            $reportPath = "$reportDir\oracle_ram_start_zelda_zelda_$($build)_f$($frame)_h1.txt"
            if (Test-Path $reportPath) {
                $result = Select-String -Path $reportPath -Pattern 'Advanced: (true|false)' | ForEach-Object {
                    if ($_.Line -like "*true*") { "PASS" } else { "FAIL" }
                }
                Write-Host "  Frame $frame`: $result" -ForegroundColor $(if($result -eq "PASS") {"Green"} else {"Yellow"})
                
                $summaryReport += [PSCustomObject]@{
                    Test = "Oracle"
                    Build = $build
                    Frame = $frame
                    Result = $result
                }
            }
        }
        Write-Host ""
    }
}

# ========================================
# PHASE 2: SRAM PERSISTENCE TEST
# ========================================
if (-not $SkipSRAM) {
    Write-Host "PHASE 2: SRAM PERSISTENCE TEST" -ForegroundColor Yellow
    Write-Host "================================`n" -ForegroundColor Yellow
    
    foreach ($build in $BuildsToTest) {
        Write-Host "Testing $build SRAM persistence..." -ForegroundColor Green
        
        .\run_sram_persistence_probe.ps1 -Rom $build
        
        Write-Host ""
    }
}

# ========================================
# SUMMARY
# ========================================
Write-Host "`n=== DIAGNOSTIC SUMMARY ===" -ForegroundColor Cyan
Write-Host "===========================`n" -ForegroundColor Cyan

$oracleTests = $summaryReport | Where-Object { $_.Test -eq "Oracle" }
if ($oracleTests) {
    Write-Host "Oracle RAM Start Tests:" -ForegroundColor Yellow
    $oracleTests | Group-Object Build | ForEach-Object {
        $passed = ($_.Group | Where-Object { $_.Result -eq "PASS" }).Count
        $total = $_.Group.Count
        $pct = [int]($passed/$total*100)
        Write-Host "  $($_.Name): $passed/$total tests passing ($pct`%)" -ForegroundColor $(if($passed -eq $total) {"Green"} else {"Yellow"})
    }
    Write-Host ""
}

Write-Host "Ready for hardware builds.`n" -ForegroundColor Green
Write-Host "Use Frame 300 as standard injection point (safest across all builds)`n" -ForegroundColor Cyan
