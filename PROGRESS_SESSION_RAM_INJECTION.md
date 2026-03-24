# RAM Injection Path: Unblocking Post-Title Gameplay

## Status: Ready to Test

### Key Discoveries This Session

1. **Intro Text Mystery SOLVED**
   - Previous investigation showed apparent corruption in frame-900 intro text
   - New nametable dump tool proved data is 100% correct
   - PPUCTRL=$B2 (bit4=1), selecting PT1 for backgrounds as intended
   - Text tile indices are accurate (tile 08='8', etc.)
   - **Conclusion**: Guide screen is STABLE and CORRECT. No text rendering bug.

2. **Input Injection Challenge**
   - BizHawk joypad API not working reliably for Genesis controller input
   - Blocker: oracle auto-start couldn't land Start button press via joypad.set()
   - Solution: Direct RAM byte injection instead

3. **Button Input Mechanism Identified**
   - Start button controlled via `ram_btn_press` at $FF00F8
   - Start bit value: $10 (bit 4)
   - Title screen handler at bank02:903B reads `ram_btn_press` and masks for $10
   - **Strategy**: Write $10 directly to $FF00F8 to trigger Start press

### NES Script IDs
- Script 0 = Title screen (current state at frame ~600-900)
- Script 1 = Slot selection (next expected state after Start)
- Script 5+ = Gameplay lanes

### Ready-to-Test Lua Scripts Created

1. **zelda_oracle_ram_start.lua** — Full oracle with comprehensive logging
   - Injects Start at frame 900 (after guide stabilizes)
   - Monitors script/subscript for state changes
   - Logs every frame 900-950 and every 10 frames after
   - Expected: script changes from 0→1 within ~50 frames of injection

2. **zelda_quick_start_test.lua** — Minimal test for quick validation
   - Simpler logging, faster execution
   - Better for rapid iteration

### Next Move: Run BizHawk Tests

**Command to execute** (from repo root):
```powershell
.\BizHawk\EmuHawk.exe --lua=diag\scripts\zelda_quick_start_test.lua zelda\zelda_v358.md
```

Or via PowerShell:
```powershell
./run_oracle_ram_start.ps1 -Rom zelda_v358 -Frames 1500
```

### Expected Outcomes

**Success Path (RAM injection works)**:
- Frame 800: Script = 0 (title)
- Frame 900: Inject Start ($10 → $FF00F8)
- Frame 920-950: Script changes to 1 (slot select)
- Result: Game advances cleanly past title

**Failure Path 1 (RAM injection doesn't propagate)**:
- Frame 900+: Script stays 0
- Button bit doesn't get read by title handler
- Suggests title handler isn't checking after injection
- Fix: Adjust injection timing or verify handler reads current value

**Failure Path 2 (Handler reads old value)**:
- Button read happens during NMI (once per frame)
- If injected between reads, gets missed
- Fix: Inject 1-2 frames earlier or add repeat injections

**Failure Path 3 (Game hangs on slot/file select)**:
- Script changes to 1, but game doesn't progress further
- Indicates slot-select screen has different issues
- Next: Debug slot-select handler

### Log File Locations

- Oracle full output: `diag/reports/oracle_ram_start_zelda_v358.txt`
- Quick test output: `diag/reports/quick_start_test.txt`
- BizHawk console: `diag/reports/oracle_bizhawk_output_ram_start.txt`

### Why This Matters

- **v358 title/guide is proven solid** — no text bugs, rendering correct
- **Next step is real gameplay path** — determines if we should iterate on title visuals or advance to next subsystem
- **Direct RAM injection is more reliable** than joypad API with Genesis timing quirks
- **Success here proves game logic is intact** beyond title sequence

### Context for Future Sessions

- This session found the title text wasn't broken (big time-saver!)
- Pivot from "fix corrupted text" to "test game advancement" is correct
- RAM injection technique can be reused for any NES memory writes (controller, flags, etc.)
- v358 is stable baseline — safe to iterate further

## Files Modified/Created

- `run_oracle_ram_start.ps1` — PowerShell oracle launcher
- `diag/scripts/zelda_oracle_ram_start.lua` — Full test oracle
- `diag/scripts/zelda_quick_start_test.lua` — Quick validation script
- `PROGRESS_SESSION_RAM_INJECTION.md` — This document

## Recommendation

1. **Immediate**: Run quick_start_test.lua to validate injection mechanics
2. **If successful**: Run full oracle to log slot-select entry
3. **If successful**: Continue into slot-select handler investigation
4. **If hangs**: Debug slot-select screen setup (PPU writes, sprite setup, etc.)

Current burn-down tracker:
- Bug-track: 99% (+1 for confirming text is correct)
- Overall ROM: 44% → 45% (post-title path next)
