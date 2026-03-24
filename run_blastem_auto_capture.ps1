$ErrorActionPreference = "Stop"

$BLASTEM = "D:\Emulation\Sega\Genesis\blastem-win64-0.6.3-pre-884de5ef1263\blastem.exe"
$PROJECT = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$ROM     = "$PROJECT\build\zelda_v526.md"
$REPORTS = "$PROJECT\diag\reports"

if (-not (Test-Path $BLASTEM)) { throw "BlastEm not found: $BLASTEM" }
if (-not (Test-Path $ROM)) { throw "ROM not found: $ROM" }

# 1) Capture a timed burst of window frames.
& "$PROJECT\tools\window_capture_burst.ps1" `
  -ExePath "$BLASTEM" `
  -ExeArgs @("$ROM") `
  -OutputDir "$REPORTS" `
  -Prefix "blastem_cap" `
  -DurationSec 160 `
  -IntervalMs 250

# 2) Auto-select best-matching checkpoint frames.
py -3 "$PROJECT\tools\select_checkpoint_frames.py" blastem_cap blastem
