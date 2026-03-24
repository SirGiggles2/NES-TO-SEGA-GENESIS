$ErrorActionPreference = "Stop"

$PROJECT = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$REPORTS = "$PROJECT\diag\reports"

$BIZHAWK = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
$NES_ROM = "$PROJECT\artifacts\nes_original_build\zelda_disassembly_og.nes"

$BLASTEM = "D:\Emulation\Sega\Genesis\blastem-win64-0.6.3-pre-884de5ef1263\blastem.exe"
$GEN_ROM = "$PROJECT\build\zelda_v498.md"

$NES_PREFIX = "nes_intro_cap"
$GEN_PREFIX = "blastem_intro_cap"

if (-not (Test-Path $REPORTS)) { New-Item -ItemType Directory -Path $REPORTS | Out-Null }
if (-not (Test-Path $BIZHAWK)) { throw "EmuHawk.exe not found: $BIZHAWK" }
if (-not (Test-Path $NES_ROM)) { throw "NES ROM not found: $NES_ROM" }
if (-not (Test-Path $BLASTEM)) { throw "BlastEm not found: $BLASTEM" }
if (-not (Test-Path $GEN_ROM)) { throw "Genesis ROM not found: $GEN_ROM" }

# Clear prior intro captures to avoid stale frame mix.
Get-ChildItem -Path $REPORTS -Filter "$NES_PREFIX*.png" -ErrorAction SilentlyContinue | Remove-Item -Force
Get-ChildItem -Path $REPORTS -Filter "$GEN_PREFIX*.png" -ErrorAction SilentlyContinue | Remove-Item -Force

Write-Host "Capturing NES intro burst..."
& "$PROJECT\tools\window_capture_burst.ps1" `
  -ExePath "$BIZHAWK" `
  -ExeArgs @("$NES_ROM") `
  -OutputDir "$REPORTS" `
  -Prefix "$NES_PREFIX" `
  -DurationSec 220 `
  -IntervalMs 100

Write-Host "Capturing BlastEm intro burst..."
& "$PROJECT\tools\window_capture_burst.ps1" `
  -ExePath "$BLASTEM" `
  -ExeArgs @("$GEN_ROM") `
  -OutputDir "$REPORTS" `
  -Prefix "$GEN_PREFIX" `
  -DurationSec 220 `
  -IntervalMs 100

$NES_MP4 = "$REPORTS\nes_intro_reference.mp4"
$GEN_MP4 = "$REPORTS\blastem_intro_current.mp4"

Write-Host "Encoding NES intro MP4..."
ffmpeg -y -framerate 10 -i "$REPORTS\$NES_PREFIX"_%05d.png -c:v libx264 -pix_fmt yuv420p -crf 18 "$NES_MP4"

Write-Host "Encoding BlastEm intro MP4..."
ffmpeg -y -framerate 10 -i "$REPORTS\$GEN_PREFIX"_%05d.png -c:v libx264 -pix_fmt yuv420p -crf 18 "$GEN_MP4"

Write-Host "Done."
Write-Host "NES video: $NES_MP4"
Write-Host "GEN video: $GEN_MP4"
