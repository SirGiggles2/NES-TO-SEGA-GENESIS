$ErrorActionPreference = "Stop"

$ARES       = "D:\Emulation\Multi system emus\ares.exe"
$PROJECT    = "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS"
$ROM        = "$PROJECT\build\zelda_v495.md"
$SETTINGS   = "$PROJECT\tools\ares_settings_parity.bml"

if (-not (Test-Path $ARES)) { throw "ares.exe not found: $ARES" }
if (-not (Test-Path $ROM)) { throw "ROM not found: $ROM" }
if (-not (Test-Path $SETTINGS)) { throw "Settings file not found: $SETTINGS" }

# Launch Ares with deterministic parity settings.
# Use hotkey from Ares to capture screenshot manually:
#   Hotkey/CaptureScreenshot (configure in Ares if unset)
& $ARES --system "Mega Drive" --settings-file "$SETTINGS" "$ROM"
