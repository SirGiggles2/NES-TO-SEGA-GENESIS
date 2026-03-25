# Title Sequence Architecture: Phase 1 vs Phase 2

## Two-Phase Title System

The title screen in the original NES Zelda is implemented as a **two-phase system**:

### Why Two Phases?
- **Phase 1**: Runs while `screen_ready == 0` (loading/setup phase)
- **Phase 2**: Runs when gameplay is ready (`screen_ready != 0`)

---

## Phase 1: Title Logo and Demo Loading (bank_FF + bank_02)

### Entry Point (Phase 1 Handler)
- **Location**: `src/banks/nes_original/bank_FF.asm` offset 0x01E94B
- **Label**: `ofs_main_script_1_E94B_00_title_screen`
- **Script Number**: 0x00 (title script, Phase 1 variant)

### Phase 1 Execution Path
```
ofs_main_script_1_E94B_00_title_screen (bank_FF, line 997)
    ↓
    [Some setup logic]
    ↓
    JMP loc_0x009010 (line 1015 in bank_FF)  ← JUMPS TO BANK 02
    ↓
loc_0x009010 (bank_02, line ~130)
    ├─ LSR sub_0x01E635_disable_rendering_and_nmi
    ├─ Check ram_042B_enemy (demo mode flag)
    │
    ├─ If NOT demo (ram_042B != 0):
    │   ├─ Subscript 0: ofs_94E7_00
    │   ├─ Subscript 1: ofs_9512_01
    │   └─ Subscript 2: ofs_9545_02
    │
    └─ If IS demo (ram_042B == 0):
        ├─ Subscript 0: ofs_94E7_00
        ├─ Subscript 1: ofs_9573_01
        └─ Subscript 2: ofs_959A_02
```

### Phase 1 Subscript Dispatch

**Non-Demo Path (ram_042B_enemy != 0):**

| Subscript | Label | Offset | Behavior |
|-----------|-------|--------|----------|
| 0 | `ofs_94E7_00` | 0x0094F7 | Setup/initialization |
| 1 | `ofs_9512_01` | 0x009522 | State progression |
| 2 | `ofs_9545_02` | 0x009555 | **Queues Title Nametable Buffer ($10)** ← CRITICAL |

**Demo Path (ram_042B_enemy == 0):**

| Subscript | Label | Offset | Behavior |
|-----------|-------|--------|----------|
| 0 | `ofs_94E7_00` | 0x0094F7 | Setup |
| 1 | `ofs_9573_01` | 0x009583 | Demo palette setup |
| 2 | `ofs_959A_02` | 0x0095AA | Queues Guide Buffer ($02), sets screen_ready=1 |

### Critical Discovery: Nametable Queue Location

**Phase 1, Subscript 2, Non-Demo Path**
- **Location**: `src/banks/nes_original/bank_02.asm` offset 0x009555
- **Label**: `ofs_9545_02`
- **Code**:
  ```asm
  LDA #con_music_title           ; 0x00955A: A9 80
  STA ram_music                  ; 0x00955C: 8D 00 06
  LDA #con_ppu_buf_title_screen  ; 0x00955E: A9 10  ← TITLE NAMETABLE ($10)
  JMP loc_95A2                   ; 0x009560: 4C A2 95
  
  loc_95A2:
  STA ram_ppu_load_index         ; 0x0095B2: 85 14  ← QUEUE BUFFER
  ```

---

## Phase 2: Title Screen with "Press Start" (bank_02)

### Entry Point (Phase 2 Handler)
- **Location**: `src/banks/nes_original/bank_02.asm` offset 0x009030
- **Label**: `ofs_main_script_2_0x009030_00_title_screen`
- **Script Number**: 0x00 (title script, Phase 2 variant)
- **Registered in**: `src/banks/nes_original/bank_FF.asm` phase 2 dispatch table

### Phase 2 Execution Path
```
ofs_main_script_2_0x009030_00_title_screen (line 158)
    ├─ If subscript == 0 AND condition met:
    │   └─ JSR sub_90CF (demo handler logic)
    │
    ├─ Check screen_ready flag
    │
    └─ Dispatch based on subscript:
        ├─ Subscript 0: ofs_006_903B_00_title_screen_handler
        ├─ Subscript 1: ofs_006_A2A0_01_prepare_slot_select_screen_1
        └─ Subscript 2: ofs_006_905D_02_prepare_slot_select_screen_2
```

### Phase 2 Subscript Dispatch

**Main Title Script Subscripts**:

| Subscript | Label | Offset | Behavior |
|-----------|-------|--------|----------|
| 0 | `ofs_006_903B_00_title_screen_handler` | 0x00904B | **Waits for Start button, Queues Palette Buffer ($12)** ← CRITICAL |
| 1 | `ofs_006_A2A0_01_prepare_slot_select_screen_1` | 0x00A2A0 | Prepares save slot display |
| 2 | `ofs_006_905D_02_prepare_slot_select_screen_2` | 0x00905D | Finishes slot select prep |

### Palette Queue Location (Phase 2, Subscript 0)

**Phase 2, Subscript 0 Handler**
- **Location**: `src/banks/nes_original/bank_02.asm` offset 0x00904B
- **Label**: `ofs_006_903B_00_title_screen_handler`
- **Code**:
  ```asm
  LDA ram_btn_press              ; 0x00904B: A5 F8
  AND #con_btn_Start             ; 0x00904D: 29 10
  BEQ bra_905C_RTS               ; 0x00904F: F0 1B  (if not Start, return)
  
  [... button handling ...]
  
  LDA #con_ppu_buf_12            ; 0x009068: A9 12  ← PALETTE BUFFER ($12)
  STA ram_ppu_load_index         ; 0x00906A: 85 14  ← QUEUE BUFFER
  INC ram_subscript              ; 0x009062: E6 13
  ```

---

## Buffer Index Constants

Defined in `src/includes/bank_val.inc` (lines 173-233):

| Constant | Value | Purpose |
|----------|-------|---------|
| `con_ppu_buf_title_screen` | $10 | Title nametable buffer |
| `con_ppu_buf_12` | $12 | Palette buffer (title use) |
| `con_ppu_buf_guide` | $02 | Guide screen nametable |
| `con_ppu_buf_00` | $00 | (other buffers) |
| `con_ppu_buf_06` through `con_ppu_buf_78` | Various | Gameplay buffers, palettes, etc. |

---

## Critical Timeline: When Buffers Are Queued

### Scenario: Non-Demo Title Playthrough

**Frame T (Phase 1 subscript 2 period):**
- **Non-demo path activation**: ram_042B_enemy != 0
- **Subscript dispatch**: ofs_9545_02 runs
- **Action**: `LDA #con_ppu_buf_title_screen` → `STA ram_ppu_load_index`
- **Result**: Title nametable buffer ($10) QUEUED in PPU command buffer

**Frame T+N (Phase 2 subscript 0 period, user pressing Start):**
- **Script dispatch**: ofs_006_903B_00_title_screen_handler runs
- **Button check**: AND #con_btn_Start
- **If Start pressed**:
  - Action: `LDA #con_ppu_buf_12` → `STA ram_ppu_load_index`
  - Result: Palette buffer ($12) QUEUED in PPU command buffer
  - Effect: Increments subscript to 1, moves to save slot selection

---

## Why Title Nametable Never Appears in Genesis Port (Hypothesis)

Given baseline probe shows:
- **Frame 16**: CHR loads successfully
- **Frame 54**: `flush_done` signal fires
- **Throughout**: Nametable rows remain all zero

### Possible Causes:

1. **Timing Issue**: Title nametable buffer ($10) is queued in Phase 1, but Genesis bridge only processes/flushes buffers queued in Phase 2
   - Solution: Ensure bridge captures AND applies ALL queued buffers, not just Phase 2

2. **Buffer Order Issue**: Multiple buffers queued, but only the LAST one (palette, $12) is processed
   - Solution: Ensure bridge processes ALL buffer indices in the queue, not just the most recent

3. **Translation Gap**: Translated handler preserves logic but bridge doesn't recognize buffer index $10
   - Solution: Verify buffer index routing in `src/bridge/vdp_layer.asm`

4. **Missing Phase 1 to Phase 2 Bridge**: Genesis port may skip Phase 1 entirely and start at Phase 2
   - Solution: Verify both phases execute in Genesis runtime

---

## Files Containing Title Logic

1. **Phase 1 Handler**: `src/banks/nes_original/bank_FF.asm` line 997
2. **Phase 1 Subscript Dispatch**: `src/banks/nes_original/bank_02.asm` line 130-149
3. **Phase 2 Handler**: `src/banks/nes_original/bank_02.asm` line 158
4. **Phase 2 Subscript Dispatch**: `src/banks/nes_original/bank_02.asm` line 170-172
5. **Translated Phase 2 Handler**: `src/banks/generated_vdp/bank_02_gen68k_vdp.asm` line 195
6. **Buffer Constants**: `src/includes/bank_val.inc` line 173-233
7. **Genesis Bridge**: `src/bridge/vdp_layer.asm` (PPU flush logic)

---

## Next Steps for Debugging

1. ✅ **Map title buffer queuing architecture** (DONE)
2. ⏳ **Verify Phase 1 execution on Genesis** - Does Phase 1 subscript 2 run?
3. ⏳ **Trace buffer queue timing** - When is buffer $10 queued relative to $12?
4. ⏳ **Expand baseline probe** - Add Phase 1 subscript tracking
5. ⏳ **Examine Genesis bridge** - Verify safe handling of multiple buffer indices
6. ⏳ **Test Genesis fix** - Apply buffer $10 queuing if missing
