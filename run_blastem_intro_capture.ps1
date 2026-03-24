$ErrorActionPreference = "Stop"

$BLASTEM = "D:\Emulation\Sega\Genesis\blastem-win64-0.6.3-pre-884de5ef1263\blastem.exe"
$PROJECT = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$ROM     = "$PROJECT\build\zelda_v498.md"
$REPORTS = "$PROJECT\diag\reports"
$PREFIX  = "blastem_intro_cap"

if (-not (Test-Path $BLASTEM)) { throw "BlastEm not found: $BLASTEM" }
if (-not (Test-Path $ROM)) { throw "ROM not found: $ROM" }

# 1) Capture full intro as a dense frame burst.
& "$PROJECT\tools\window_capture_burst.ps1" `
  -ExePath "$BLASTEM" `
  -ExeArgs @("$ROM") `
  -OutputDir "$REPORTS" `
  -Prefix "$PREFIX" `
  -DurationSec 220 `
  -IntervalMs 100

# 2) Build a lightweight preview GIF from captured frames.
py -3 "$PROJECT\tools\make_intro_gif.py" "$REPORTS" --prefix "$PREFIX" --out "blastem_intro_preview.gif" --step 4 --max-frames 320 --frame-ms 80
