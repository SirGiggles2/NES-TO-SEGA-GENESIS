$ErrorActionPreference = "Stop"

$ARES     = "D:\Emulation\Multi system emus\ares.exe"
$PROJECT  = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$ROM      = "$PROJECT\build\zelda_v495.md"
$SETTINGS = "$PROJECT\tools\ares_settings_parity.bml"
$REPORTS  = "$PROJECT\diag\reports"

if (-not (Test-Path $ARES)) { throw "Ares not found: $ARES" }
if (-not (Test-Path $ROM)) { throw "ROM not found: $ROM" }
if (-not (Test-Path $SETTINGS)) { throw "Settings not found: $SETTINGS" }

# 1) Capture a timed burst of window frames.
& "$PROJECT\tools\window_capture_burst.ps1" `
  -ExePath "$ARES" `
  -ExeArgs @("--system","Mega Drive","--settings-file",$SETTINGS,"--no-file-prompt",$ROM) `
  -OutputDir "$REPORTS" `
  -Prefix "ares_cap" `
  -DurationSec 160 `
  -IntervalMs 250

# 2) Auto-select best-matching checkpoint frames.
py -3 "$PROJECT\tools\select_checkpoint_frames.py" ares_cap ares
