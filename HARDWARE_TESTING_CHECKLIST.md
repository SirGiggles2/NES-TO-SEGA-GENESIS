# HARDWARE BUILD TESTING CHECKLIST

Quick reference for on-site hardware validation

---

## PRE-HARDWARE PREPARATION

- [ ] Verify ROM file matches v542 (CRC 947300F8)
- [ ] Check cartridge SRAM battery health
- [ ] Prepare Genesis console with controller
- [ ] Have emulator test results available for comparison
- [ ] Document baseline: Frame 300 injection = Frame 330 advancement

---

## HARDWARE TEST SEQUENCE

### Test 1: Cold Boot Progression (5 mins)
- [ ] Insert cartridge
- [ ] Power on console
- [ ] Inject Start button at **Frame 300** (use stopwatch: ~5 seconds after power-on)
- [ ] **Expected**: Game advances to gameplay
- [ ] **Measure**: Advancement frame (compare to baseline 330±30)
- [ ] **Result**: PASS / FAIL

### Test 2: SRAM Write-Persist-Read (10 mins)
- [ ] Reach save screen
- [ ] Save game in slot 1 (note save data marker)
- [ ] Power off console
- [ ] Wait 30 seconds
- [ ] Power on console
- [ ] Navigate to load screen
- [ ] **Expected**: Saved game visible and loadable
- [ ] **Result**: PASS / FAIL

### Test 3: Input Responsiveness (5 mins)
- [ ] On title screen, test D-Pad directions
  - [ ] Up: responsive?
  - [ ] Down: responsive?
  - [ ] Left: responsive?
  - [ ] Right: responsive?
- [ ] Test buttons
  - [ ] Start: advances game
  - [ ] A: selects
  - [ ] B: cancels
- [ ] **Result**: All responsive / Some lag / No response

### Test 4: Extended Gameplay (optional, 10 mins)
- [ ] After progression, play for ~60 frames minimum
- [ ] Check for crashes, glitches, audio sync issues
- [ ] Verify standard game behavior (no anomalies)
- [ ] **Result**: PASS / FAIL

---

## CONTINGENCY TESTS

### If Progression Fails at Frame 300

Try alternate frames in order:
- [ ] Frame 250 (earlier margin)
- [ ] Frame 500 (later margin)
- [ ] Frame 400 (middle of window)

**Note**: Any frame 215-1850 should work.

### If SRAM Doesn't Persist

- [ ] Check cartridge battery indicator
- [ ] Try save in different slot (1-3)
- [ ] Verify game reaches actual save routine (not just menu)
- [ ] If repeatable failure, document cartridge batch/date code

### If Inputs Feel Sluggish

- [ ] Test on fresh ROM load (power-cycle first)
- [ ] Swap controller (rule out controller issue)
- [ ] Compare perceived latency to emulator (play both back-to-back)

---

## RESULTS FORM

| Test | Expected | Actual | Status | Notes |
|------|----------|--------|--------|-------|
| Progression Frame | 330±30 | ____ | ✓/✗ | |
| Advancement Success | YES | ____ | ✓/✗ | |
| SRAM Persist | YES | ____ | ✓/✗ | |
| D-Pad Input | Responsive | ____ | ✓/✗ | |
| Button Input | Responsive | ____ | ✓/✗ | |
| Gameplay | Playable | ____ | ✓/✗ | |
| **Overall** | **PASS** | ____ | **✓/✗** | |

---

## PASS CRITERIA

- [x] Progression: Game advances within 100-150 frames of Start injection
- [x] SRAM: Save persists through power cycle
- [x] Input: All controller inputs register immediately
- [x] Gameplay: No crashes or anomalies during extended play

**Hardware Build Status**: ✓ PASS if all criteria met

---

## TIMING REFERENCE

From emulator baseline (measure against this):

```
Console Power On → Store time as T0
Inject Start button → T0 + ~5 seconds
Expect progression → T0 + ~6-7 seconds (frame 330)
```

**Variance tolerance**: ±1 second (±60 frames @ 60fps)

---

## KEY DIFFERENCES v540 vs v542

Use **v542** for hardware: longer injection window, identical behavior otherwise.

If v542 unavailable, v540 also tested and confirmed working (shorter window: 215-1100).

---

## CONTACT / REFERENCE

Detailed results: Run `.\run_oracle_ram_start.ps1 -Rom zelda_v542 -StartFrame 300`
Full guide: Read `HARDWARE_TESTING_GUIDE.md`
Baseline report: See `BUILD_COMPARISON_REPORT.md`

---

**Print date**: ____________  |  **Tester**: ________________  |  **Hardware ID**: ________________
