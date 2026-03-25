# Title Screen Ownership Map

This document maps the complete ownership chain for the title screen from original NES source through translated Genesis code.

## Overview

The title screen is implemented across multiple NES banks with both script logic and PPU data that must flow through the translated Genesis bridge without breaking.

### Key Phases

1. **Phase 1 (Pre-screen-ready)**: Logo and demo/manual screen handling
2. **Phase 2 (Script-ready)**: User interaction and title hold state

## Original NES Title Logic

### Bank FF: Main Script Dispatcher

**File**: `src/banks/nes_original/bank_FF.asm`

**Phase 1 Title Script Handler**:
- Symbol: `ofs_main_script_1_E94B_00_title_screen`
- Offset: `0x01E94B` (bank FF, logical E94B)
- Role: Early-phase title setup before screen is ready
- Called when: `ram_0011_screen_ready_flag == 0x00`

**Phase 2 Title Script Dispatcher Table** (Primary active path):
- Location: `sub_EB30_main_script_handler_2` at `0x01EB40`
- Dispatch table start: `0x01EB4A` (EB3A in logical addressing)
- Table entry for script 0: `.word ofs_main_script_2_0x009030_00_title_screen`
- Called when: `ram_0011_screen_ready_flag != 0x00`

### Bank 02: Title Script and Handler

**File**: `src/banks/nes_original/bank_02.asm`

#### Title Script Entry Point
- Symbol: `ofs_main_script_2_0x009030_00_title_screen`
- Offset: `0x009030` (in bank 02 address space)
- Line (asm): 158
- Purpose: Main title script dispatcher

#### Title Script Entry Logic
```
LDA ram_subscript              ; Branch on subscript value
BNE bra_9030                   ; If subscript != 0, go to handler

; If subscript == 0:
LDA ram_0528                   ; Check initialization flag
BNE bra_9030

JSR sub_90CF                   ; Initialize demo/manual
LDA ram_0011_screen_ready_flag
BEQ bra_905C_RTS               ; Not ready yet, return
```

#### Title Script Handler Dispatch
- Symbol: `ofs_006_903B_00_title_screen_handler`
- Offset within script: Second entry in dispatch table at `0x009045`
- Line (asm): 176
- Purpose: Subscript(0) handler - waits for Start button input

#### Title Handler (Subscript 0) Logic
```
LDA ram_btn_press
AND #con_btn_Start             ; Check for Start button
BEQ bra_905C_RTS               ; Not pressed, return

; When Start is pressed:
STA ram_00F6_reset_check_A5
LDA #con_music_00
STA ram_music
JSR sub_bat_6EE9               ; Sound effect
LDA #$5A
STA ram_0528                   ; Set initialization flag
INC ram_subscript              ; Move to next subscript (now = 01)
JSR sub_0x01E635_disable_rendering_and_nmi
JSR sub_0x01E607_hide_all_sprites
LDA #con_ppu_buf_12
STA ram_ppu_load_index         ; Queue nametable buffer flush
```

#### Next Subscript Handlers
- Subscript 01: `ofs_006_A2A0_01_prepare_slot_select_screen_1`
- Subscript 02: `ofs_006_905D_02_prepare_slot_select_screen_2`

### Bank 02: Title CHR Upload Logic

**File**: `src/banks/nes_original/bank_02.asm`

#### CHR Upload Tables (located at start of bank)
- **Table base reference**: `tbl_8000_tiles` at `0x008010` (line 23)
  - 3 entries (word-indexed): points to CHR data locations
  - Entry 0: `tbl_807F___0000_06FF` @ 0x00807F
  - Entry 1: `tbl_877F___1000_16FF` @ 0x00877F  
  - Entry 2: `tbl_8E7F___1F20_1FFF` @ 0x008E7F

- **Upload counter table**: `tbl_8006_counter` at `0x008016` (line 27)
  - Specifies how many tiles per upload
  - 0x0700 (1792 bytes), 0x0700, 0x00E0 (224 bytes)

- **PPU address table**: `tbl_800C_ppu_ppu_addr` at `0x00801C` (line 31)
  - Where to write tiles in PPU VRAM
  - 0x0000 (tile plane 0, tiles 0-699)
  - 0x1000 (tile plane 1, tiles 0-699)
  - 0x1F20 (shared plane, tiles at 1F20-1FFF)

#### Title CHR Incbin References
- `incbin/chr/02___807F_877E.chr` - 0x07F0 bytes (contains tiles 0000-06FF)
- `incbin/chr/02___877F_8E7E.chr` - 0x0700 bytes (contains tiles 1000-16FF)
- `incbin/chr/02___8E7F_8F5E.chr` - 0x00E0 bytes (contains shared tiles 1F20-1FFF)

#### CHR Upload Routine
- Symbol: `loc_0x008022_fill_ppu_with_tiles_1`
- Location: `0x008022` (line 28)
- Mechanism: Iterates through table entries, writes CHR data to PPU via `sub_804F_write_to_ppu`

### Bank 06: Title Nametable Buffer

**File**: `src/banks/nes_original/bank_06.asm`

#### Title Buffer Symbol
- Symbol: `_off000_A869_10_title_screen`
- Reference constant: `con_ppu_buf_title_screen`
- Offset: `0x01A869` (bank 06)
- Line (asm): 7283

#### Buffer Format
The buffer is a classic NES PPU command sequence:
```
.dbyt $2000          ; PPU address (nametable start, high/low order)
.byte $20            ; Fill with 32 bytes (one scanline width)
.byte $24, $24, ..., $24  ; 32 bytes of tile indices
.dbyt $2020          ; Next PPU address (row 1)
.byte $20            ; Fill 32 bytes
...
```

#### Buffer Content Semantics
- `$24` = blank tile (space character)
- `$D4-$DF` = border/frame tiles
- `$71-$C3` = letter tiles spelling "LEGEND OF ZELDA"
- Row structure fills rows 2-10 of the nametable (title logo area)

#### Nametable Rows Written
| Row | Offset | PPU Address | Content |
|-----|--------|-------------|---------|
| 2   | +$00   | $2000       | Title border top |
| 3   | +$23   | $2020       | Title border |
| 4   | +$46   | $2040       | Title border with L/Z |
| 5   | +$69   | $2060       | Title border with E/Z |
| 6   | +$8C   | $2080       | Title border with G/D |
| 7   | +$AF   | $20A0       | "LEGEND OF ZELDA" upper |
| 8   | +$D2   | $20C0       | Title continuation |
| 9   | +$F5   | $20E0       | Title continuation |
| 10  | +$118  | $2100       | Title continuation |
| 11  | +$13B  | $2120       | Title continuation |
| 12  | +$15E  | $2140       | Title continuation |
| 13  | +$181  | $2160       | Title continuation |
| 14  | +$1A4  | $2180       | Title continuation |
| 15  | +$1C7  | $21A0       | Title border bottom |

### Bank 02: Helper Routines

**BankFF sub_90CF**: Demo/manual initialization dispatcher
- Switches between demo mode (logo countdown) and manual mode (manual + logo)
- Calls into bank 07/08 subroutines for logo animation
- Handles title hold state once user presses Start

## Translated Genesis Title Logic

### Generated Banks

**File**: `src/banks/generated_vdp/bank_02_gen68k_vdp.asm`

#### Translated Title Entry Point
- Symbol: `ofs_main_script_2_0x009030_00_title_screen`
- Addresses preserved from original
- All symbol names preserved word-for-word

#### Translated Title Handler
- Symbol: `ofs_006_903B_00_title_screen_handler`
- Line structure matches original dispatch
- Button input check translated to Genesis controller read

#### Key Preserve Points for Genesis Port
- Script and subscript logic must remain identical
- Button press detection must wait for Start (Genesis: Start button = same role)
- PPU load index setting (`ram_ppu_load_index = con_ppu_buf_12`) triggers nametable flush

**File**: `src/banks/generated_vdp/bank_06_gen68k_vdp.asm`

#### Translated Title Buffer
- Symbol: `ppu_buf_title_screen_real` (may be renamed from bank 06 original)
- Preserved as data (not code), so incbin/buffer format survives translation
- All tile indices and PPU addresses survive intact

## Bridge-Side Title Management

### File: `src/bridge/vdp_layer.asm`

#### Title CHR Flush Orchestration
- Symbol: `PPU_FLUSH_TITLE_CHR_TO_VRAM`
- Purpose: One-time flush of title CHR data during startup
- Gating: Only active during title hold (`script=title`, `phase=0`)
- Behavior: Copies title CHR from shadow to Genesis VRAM once, then marks done

#### Title CHR Flush Condition
```
if (game_mode==TITLE && auto_demo==0 && phase==0) {
    flush_title_chr_to_vram();
    PPU_TITLE_CHR_FLUSH_DONE = 1;
} else {
    PPU_TITLE_CHR_FLUSH_DONE = 0;
}
```

#### Handwritten Shadow Load (startup)
In `src/main.asm`:
- Preload title CHR into PPU shadow during initialization
- Located in startup/boot path before first NMI

## State Machine Flow

```
Title Script Entry (script=0, subscript=0)
    |
    v
[screen_ready_flag == 0] ?
    | YES (pre-ready phase)
    v
demo/manual_init() -> logo animation and countdown
    |
    v
Wait for screen_ready_flag to be set (by NMI PPU buffer flush)
    |
    v
[subscript dispatch] -> Title Handler (subscript=0)
    |
    v
Wait for Start button press
    | (on press)
    v
Increment subscript
PPU_load_index = con_ppu_buf_12
Trigger nametable buffer flush (happens in NMI)
    |
    v
On next NMI:
- Bridge flushes nametable buffer to VDP VRAM
- Disables rendering/NMI temporarily
- Flushes CHR shadow if not done yet
    |
    v
[subscript=1] -> File select prepare (script changes to 1)
```

## Critical Data Flow Path

1. **Title fonts/letters in Bank 02 CHR tables**
   - `incbin/chr/02___807F_877E.chr` (2000-2699 chr indices)
   - Loaded via `loc_0x008022_fill_ppu_with_tiles_1`

2. **Title nametable structure in Bank 06 buffer**
   - `con_ppu_buf_title_screen` buffer command sequence
   - Queued via `ram_ppu_load_index = con_ppu_buf_12`

3. **Title script coordination in Bank FF handlers**
   - Start button triggers script handoff
   - `ram_subscript` increments to 1
   - File select script (script=1) takes over

4. **Genesis bridge must preserve**
   - CHR shadow copy path (pre-boot title preload)
   - Title flush timing (one-shot during title hold)
   - Nametable buffer composition (PPU command format survives)
   - Button input detection (Start = file select transition)

## Ownership Summary

| Component | Layer | File | Ownership |
|-----------|-------|------|-----------|
| Title script entry | Original | `src/banks/nes_original/bank_FF.asm` line ~960 | Reference |
| Title handler entry | Original | `src/banks/nes_original/bank_02.asm` line ~176 | Reference |
| Title CHR data | Original | `incbin/chr/02_*.chr` | Reference (CHR tiles) |
| Title nametable | Original | `src/banks/nes_original/bank_06.asm` line ~7283 | Reference (buffer) |
| Translated script/handler | Generated | `src/banks/generated_vdp/bank_02_gen68k_vdp.asm` | Auto-generated (preserved) |
| Translated buffer | Generated | `src/banks/generated_vdp/bank_06_gen68k_vdp.asm` | Auto-generated (data survives) |
| Title CHR flush logic | Handwritten | `src/bridge/vdp_layer.asm` | Persistent (bridge owns timing) |
| Title startup preload | Handwritten | `src/main.asm` | Persistent (boot sequence) |

## Next Investigation Lane

1. Verify Genesis CHR flush flag (`PPU_TITLE_CHR_FLUSH_DONE`) reaches bridge at correct frame
2. Confirm translated title handler button input works on Genesis hardware
3. Validate nametable buffer PPU commands after translation
4. Check exact frame where `screen_ready_flag` is set vs title CHR visibility
5. Profile title CHR shadow load vs. first visible frame on real Genesis
