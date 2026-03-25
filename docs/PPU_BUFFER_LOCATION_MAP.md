# PPU Buffer Location Map

Purpose: canonical map of NES indexed PPU buffers used via ram_ppu_load_index.

## Source anchors
- Dispatch table: src/banks/nes_original/bank_06.asm at tbl_A000_ppu_data (ROM 0x01A010, CPU 06:A000).
- Buffer apply routine: src/banks/nes_original/bank_06.asm sub_0x01A090_write_buffer_to_ppu (ROM 0x01A090, CPU 06:A080).
- Runtime index var: src/includes/bank_ram.inc ram_ppu_load_index = $0014.

## Dispatch mechanics
- Caller writes an even buffer index to ram_ppu_load_index.
- sub_0x01A090_write_buffer_to_ppu uses X = ram_ppu_load_index.
- It reads pointer lo/hi from tbl_A000_ppu_data + X.
- It calls sub_A0F6_write_to_ppu on that pointer.
- It clears ram_ppu_load_index back to 00 after apply.

Note: index values are byte offsets into the pointer table, not entry ordinals.

## Buffer index map (from tbl_A000_ppu_data)
- 00 -> ram_0302_ppu_buffer
- 02 -> _off000_A3FE_02_guide
- 04 -> _off000_A2B4_04_continue
- 06 -> _off000_bat_6814_06
- 08 -> _off000_A28E_08
- 0A -> _off000_A296_0A
- 0C -> _off000_bat_681C_0C_level_text
- 0E -> _off000_A2D3_0E_hud
- 10 -> _off000_A869_10_title_screen
- 12 -> _off000_bat_67F0_12
- 14 -> _off000_A100_14
- 16 -> _off000_A183_16
- 18 -> ram_6B7E_palette_buffer
- 1A -> ram_0302_ppu_buffer (unused)
- 1C -> ram_0302_ppu_buffer (unused)
- 1E -> _off000_A21D_1E
- 20 -> _off000_A245_20
- 22 -> _off000_A24D_22
- 24 -> _off000_A255_24
- 26 -> _off000_A269_26
- 28 -> ram_0302_ppu_buffer (unused)
- 2A -> _off000_A226_2A
- 2C -> _off000_A3C8_2C
- 2E -> _off000_bat_681C_2E (unused)
- 30 -> _off000_A316_30
- 32 -> _off000_A323_32
- 34 -> _off000_A337_34
- 36 -> _off000_A202_36
- 38 -> _off000_A348_38
- 3A -> _off000_A350_3A
- 3C -> _off000_A360_3C
- 3E -> _off000_A25D_3E_cave_palette
- 40 -> _off000_A378_40
- 42 -> _off000_A39C_42
- 44 -> ram_6BCD
- 46 -> _off000_A3D0_46_game_over
- 48 -> _off000_A3B0_48
- 4A -> _off000_A3B9_4A
- 4C -> _off000_A3BE_4C
- 4E -> _off000_A3C3_4E
- 50 -> _off000_A22F_50
- 52 -> _off000_bat_6847_52
- 54 -> _off000_bat_684F_54
- 56 -> _off000_bat_6859_56
- 58 -> _off000_bat_6865_58
- 5A -> _off000_A235_5A
- 5C -> _off000_bat_6873_5C_triforce_text
- 5E -> _off000_A3E8_5E
- 60 -> _off000_A3F4_60
- 62 -> _off000_A3F9_62
- 64 -> ram_0302_ppu_buffer (unused)
- 66 -> ram_0302_ppu_buffer (unused)
- 68 -> ram_0302_ppu_buffer (unused)
- 6A -> _off000_A20A_6A
- 6C -> _off000_A29E_6C
- 6E -> ram_0302_ppu_buffer (unused)
- 70 -> ram_0302_ppu_buffer (unused)
- 72 -> ram_0302_ppu_buffer (unused)
- 74 -> ram_0302_ppu_buffer (unused)
- 76 -> _off000_A2A6_76
- 78 -> _off000_A272_78
- 7A -> _off000_A27E_7A
- 7C -> _off000_A286_7C
- 7E -> ram_0302_ppu_buffer (unused)

## Title path facts
- Title nametable buffer index is 10.
- Buffer data label is _off000_A869_10_title_screen.
- Title script queues index 10 in src/banks/nes_original/bank_02.asm (0x00955A / 02:954A).
- Phase 2 title handler queues index 12 (palette) in src/banks/nes_original/bank_02.asm (0x009068 / 02:9058).

## Implementation notes for bridge
- Minimum dispatcher support needed for title correctness:
  - index 10 (title nametable)
  - index 12 (title palette buffer)
- Optional next index to support frontend text overlays: 0C and 5C.
