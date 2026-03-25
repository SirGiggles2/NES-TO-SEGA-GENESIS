# Original NES Script Dispatch Map

This document maps the original Zelda engine's script dispatch architecture from the NES disassembly (`src/banks/nes_original/bank_FF.asm`).

## Overview

The engine uses a two-phase script handler model:

1. **main_script_handler_1**: Pre-screen-ready setup phase
   - Handler: `sub_E8F8_main_script_handler_1` in bank_FF
   - Dispatch table: beginning at offset `0x01E933` (bank FF, logical offset E923)
   - Called when `ram_0011_screen_ready_flag == 0x00`
   - 20 script entries (scripts 00-13 hex, 0-19 decimal)

2. **main_script_handler_2**: Screen-ready active gameplay phase
   - Handler: `sub_EB30_main_script_handler_2` in bank_FF
   - Dispatch table: beginning at offset `0x01EB4A` (bank FF, logical offset EB3A)
   - Called when `ram_0011_screen_ready_flag != 0x00`
   - 20 script entries (scripts 00-13 hex, 0-19 decimal)

## Main Script Dispatch Table (Phase 1 & 2)

| Script # | Decimal | Phase 1 Handler | Phase 2 Handler | Purpose |
|----------|---------|-----------------|-----------------|---------|
| 0x00     | 0       | `ofs_main_script_1_E94B_00_title_screen` @ E94B | `ofs_main_script_2_0x009030_00_title_screen` @ 0x009030 (bank 02) | Title screen display and startup |
| 0x01     | 1       | `ofs_main_script_1_E96F_01_slot_selection` @ E96F | `ofs_main_script_2_0x00A5A1_01_slot_selection` @ 0x00A5A1 (bank 02) | File select menu |
| 0x02     | 2       | `ofs_main_script_1_E977_02` @ E977 | `ofs_main_script_2_EB96_02` @ EB96 | Unknown/transition |
| 0x03     | 3       | `ofs_main_script_1_E9D8_03` @ E9D8 | `ofs_main_script_2_EBAA_03` @ EBAA | Unknown |
| 0x04     | 4       | `ofs_main_script_1_0x01478B_04` @ 0x014787/878B (bank 05) | `ofs_main_script_2_EBC0_04_screen_transition___end` @ EBC0 | Screen transition end |
| 0x05     | 5       | `ofs_main_script_1_EA6B_05` @ EA6B | `ofs_main_script_2_EC1B_05_gameplay` @ EC1B | Active gameplay |
| 0x06     | 6       | `ofs_main_script_1_0x01708A_06` @ 0x01708A (bank 05) | `ofs_main_script_2_EBC0_06_screen_transition___start` @ EBC0 | Screen transition start |
| 0x07     | 7       | `ofs_main_script_1_E9A1_07` @ E9A1 | `ofs_main_script_2_EB62_07_screen_transition___in_progress` @ EB62 | Screen transition in progress |
| 0x08     | 8       | `ofs_main_script_1_0x014610_08_prepare_save_menu` @ 0x014610 (bank 05) | `ofs_main_script_2_EB76_08_save_menu` @ EB76 | Save menu setup |
| 0x09     | 9       | `ofs_main_script_1_0x01511A_09` @ 0x01511A (bank 05) | `ofs_main_script_2_EC1B_09` @ EC1B | Gameplay (alternate) |
| 0x0A     | 10      | `ofs_main_script_1_0x01710C_0A` @ 0x01710C (bank 05) | `ofs_main_script_2_EC1B_0A` @ EC1B | Gameplay (alternate) |
| 0x0B     | 11      | `ofs_main_script_1_0x015090_0B` @ 0x015090 (bank 05) | `ofs_main_script_2_EC1B_0B` @ EC1B | Gameplay (alternate) |
| 0x0C     | 12      | `ofs_main_script_1_0x0150A7_0C` @ 0x0150A7 (bank 05) | `ofs_main_script_2_EC1B_0C` @ EC1B | Gameplay (alternate) |
| 0x0D     | 13      | `ofs_main_script_1_0x01462A_0D` @ 0x01462A (bank 05) | `ofs_main_script_2_0x00A6BD_0D` @ 0x00A6BD | Unknown |
| 0x0E     | 14      | `ofs_main_script_1_E9C3_0E_register` @ E9C3 | `ofs_main_script_2_0x009F00_0E_register` @ 0x009F00 | Name entry screen |
| 0x0F     | 15      | `ofs_main_script_1_E9C3_0F_elimination` @ E9C3 | `ofs_main_script_2_0x009FD5_0F_elimination` @ 0x009FD5 | Name elimination |
| 0x10     | 16      | `ofs_main_script_1_0x014638_10` @ 0x014638 (bank 05) | `ofs_main_script_2_EB7E_10` @ EB7E | Unknown |
| 0x11     | 17      | `ofs_main_script_1_0x014A3F_11_death` @ 0x014A3F (bank 05) | `ofs_main_script_2_EB86_11_death` @ EB86 | Link death sequence |
| 0x12     | 18      | `ofs_main_script_1_0x016843_12_triforce_collected` @ 0x016843 (bank 05) | `ofs_main_script_2_EB8E_12_triforce_collected` @ EB8E | Triforce collection |
| 0x13     | 19      | `ofs_main_script_1_E9CB_13_final_credits` @ E9CB | `ofs_main_script_2_0x00AA20_13_final_credits` @ 0x00AA20 | End credits |

## Phase 1 Handler Details

**Location**: `sub_E8F8_main_script_handler_1` in bank_FF (offset 0x01E908)

**Gating condition**: `ram_0011_screen_ready_flag == 0x00`

**Behavior**: Early initialization scripts that run before the screen is considered ready for display. These typically handle title, file select, and preparation phases.

## Phase 2 Handler Details

**Location**: `sub_EB30_main_script_handler_2` in bank_FF (offset 0x01EB40)

**Dispatch mechanism**:
```
LDA ram_script          ; Load script number
JSR sub_FFAC_prg_bankswitch  ; Switch to bank 02
JSR sub_E5E2_jump_to_pointers_after_JSR  ; Indirect jump to script handler
```

**Dispatch table**: Immediately follows handler at 0x01EB4A (table starting offset EB3A)

**Gating condition**: `ram_0011_screen_ready_flag != 0x00`

**Behavior**: Active gameplay and interactive scripts that run once the screen is ready and nametable has been populated.

## Key Architecture Notes

### Screen-Ready Transition

The transition from Phase 1 to Phase 2 is gated by `ram_0011_screen_ready_flag`:

- **Phase 1** (flag == 0): Before nametable buffer flush completes
- **Phase 2** (flag != 0): After nametable buffer flush completes

Script 0 (title screen) is the first script, reachable in both phases.

### Script Consolidation

Scripts 05, 09, 0A, 0B, 0C all share the same Phase 2 handler: `ofs_main_script_2_EC1B_05_gameplay`

This suggests that gameplay and its variants map to a single unified handler that branches internally on subscript or state.

### Title Script Location

**Title entry point (Phase 2, most relevant for Genesis work)**:
- Symbol: `ofs_main_script_2_0x009030_00_title_screen`
- Bank: 02
- Offset: 0x009030 (in bank 02 address space)

**Title entry point (Phase 1)**:
- Symbol: `ofs_main_script_1_E94B_00_title_screen`
- Bank: FF
- Offset: E94B (in bank FF address space)

### File Select Location

**Phase 2 file select entry**:
- Symbol: `ofs_main_script_2_0x00A5A1_01_slot_selection`
- Bank: 02
- Offset: 0x00A5A1 (in bank 02 address space)

**Phase 1 file select entry**:
- Symbol: `ofs_main_script_1_E96F_01_slot_selection`
- Bank: FF
- Offset: E96F (in bank FF address space)

## Dispatch Mechanism Implementation

### Phase 1 Dispatch
```
; At sub_E8F8_main_script_handler_1:
LDA ram_script              ; Load script number (0-19 decimal)
; (implicit: multiply by 2 for word-indexed jump table)
; (implicit: jump to pointer via JSR mechanism)
```

### Phase 2 Dispatch
```
; At sub_EB30_main_script_handler_2:
LDA #con_prg_bank + $02     ; Switch to bank 02
JSR sub_FFAC_prg_bankswitch

LDA ram_script              ; Load script number (0-19 decimal)
JSR sub_E5E2_jump_to_pointers_after_JSR
; Addresses of handlers follow:
.word ofs_main_script_2_0x009030_00_title_screen
.word ofs_main_script_2_0x00A5A1_01_slot_selection
...
```

## Translated Genesis Mapping

These Phase 2 handlers are translated and preserved in:

- [src/banks/generated_vdp/bank_02_gen68k_vdp.asm](src/banks/generated_vdp/bank_02_gen68k_vdp.asm)
- [src/banks/generated_vdp/bank_FF_gen68k_vdp.asm](src/banks/generated_vdp/bank_FF_gen68k_vdp.asm)

The translated script dispatch maintains identical symbol names and call sequences to ensure behavioral preservation.

## Ownership Summary

| Layer | Owner | File | Notes |
|-------|-------|------|-------|
| Original NES disassembly | Reference | `Disassembly/` archives | Defines original semantics |
| Port snapshot | Repo | `src/banks/nes_original/bank_FF.asm` | Source of truth for translation |
| Translated 68000 | Generated | `src/banks/generated/bank_FF.asm` | Generated by translator.py |
| VDP-patched 68000 | Generated | `src/banks/generated_vdp/bank_FF_gen68k_vdp.asm` | Generated by patch_vdp.py |
| Genesis runtime dispatch | Handwritten | `src/main.asm` | VBlank-driven script execution |

## Next Investigation Steps

1. Verify that Phase 2 title script (`0x009030` in bank 02) performs expected CHR upload
2. Trace the title CHR data source and buffer population path
3. Confirm bridge-side flush timing aligns with original NES title readiness
4. Identify exact subscripts used during title display (lookup in original `bank_02.asm`)
