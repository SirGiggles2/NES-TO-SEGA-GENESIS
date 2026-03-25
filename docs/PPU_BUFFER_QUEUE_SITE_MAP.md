# PPU Buffer Queue Site Map

Purpose: map every known writer/reader of ram_ppu_load_index for fast root-cause debugging.

## Canonical variable
- ram_ppu_load_index = $0014 in src/includes/bank_ram.inc

## Core read/apply path
- Reader/apply entry: src/banks/nes_original/bank_06.asm (0x01A090 / 06:A080)
- Table lookup source: tbl_A000_ppu_data in src/banks/nes_original/bank_06.asm (0x01A010 / 06:A000)
- Reset to 00 after apply: src/banks/nes_original/bank_06.asm (0x01A0A6 / 06:A096)

## Title-critical queue sites
- Queue index 12 in title setup: src/banks/nes_original/bank_02.asm (0x009068 / 02:9058)
- Store to ram_ppu_load_index: src/banks/nes_original/bank_02.asm (0x00906A / 02:905A)
- Queue index 10 (title screen): src/banks/nes_original/bank_02.asm (0x00955A / 02:954A)
- Store to ram_ppu_load_index: src/banks/nes_original/bank_02.asm (0x0095B2 / 02:95A2)

## Other known queue writers
- bank_01: 0x004802, 0x004B5E, 0x0061A3
- bank_02: 0x00906A, 0x0095B2, 0x009EAF, 0x00A4B8, 0x00A4CF, 0x00AAD9
- bank_05: 0x014069, 0x014379, 0x014625, 0x014D13, 0x016895, 0x017028, 0x01713E, 0x0172A1
- bank_FF: 0x01EA48, 0x01EAD9, 0x01ED8B

## Runtime read sites useful for probes
- bank_s2 read of current index: src/banks/nes_original/bank_s2.asm (0x006540 / 01:6CC0)
- bank_FF read in NMI flow: src/banks/nes_original/bank_FF.asm (0x01E4AB / 07:E49B)

## Debug checklist
1. Verify queue write occurs (expected index value) at source script stage.
2. Verify index survives to NMI/VBlank bridge handoff.
3. Verify apply routine reads same index before reset to 00.
4. Verify nametable shadow row deltas appear after queue/apply.
