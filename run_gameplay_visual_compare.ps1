param(
    [string]$Rom = "zelda_v601"
)

$ErrorActionPreference = "Stop"

$PROJECT = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"

Write-Host "=== GAMEPLAY VISUAL COMPARE PIPELINE ===" -ForegroundColor Cyan
Write-Host "ROM: $Rom"
Write-Host ""

& "$PROJECT\run_nes_gameplay_visual_capture.ps1"
& "$PROJECT\run_gameplay_visual_capture.ps1" -Rom $Rom

python "$PROJECT\tools\gameplay_visual_compare.py"
