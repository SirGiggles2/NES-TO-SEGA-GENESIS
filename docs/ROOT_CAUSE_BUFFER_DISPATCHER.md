# Root Cause Analysis: Title Nametable Buffer Not Applied to VRAM

## Summary of Findings

The baseline probe shows title nametable always zero throughout title hold, but we've discovered the NES code DOES queue the title nametable buffer. After deep investigation, we've identified the likely root cause:

**THE BRIDGE DOES NOT PROCESS PPU BUFFER COMMANDS BASED ON `ram_ppu_load_index`**

---

## Evidence Chain

### 1. NES Code DOES Queue Title Nametable Buffer ($10)

**Phase 1, Subscript 2, Non-Demo Path** (bank_02.asm offset 0x009555):
```asm
LDA #con_ppu_buf_title_screen  ; Load buffer index $10 (title nametable)
STA ram_ppu_load_index          ; Queue it
```

**Translation Preserved** (bank_02_gen68k_vdp.asm line 1335):
```asm
MOVE.B #con_ppu_buf_title_screen,D0  ; Original logic preserved
JMP loc_95A2                          ; Jump to register write
```

### 2. NES Code DOES Queue Palette Buffer ($12)

**Phase 2, Subscript 0** (bank_02.asm offset 0x00904B):
```asm
LDA #con_ppu_buf_12             ; Load buffer index $12 (palette)
STA ram_ppu_load_index
```

### 3. Genesis Bridge Does NOT Process Buffer Index

**What the Bridge Does:**
- Checks if `ram_ppu_load_index == con_ppu_buf_title_screen` to clear music flags (bank_00_gen68k.asm)
- Tests `ram_0301_buffer_index` for VBlank flow control (vdp_layer.asm line 327)
- Flushes CHR, palette, and nametable via dedicated functions
- But **NOWHERE** does it read `ram_ppu_load_index` to determine WHICH buffer to apply

**What the Bridge Should Do:**
1. Read `ram_ppu_load_index` value
2. Determine which buffer that index refers to (title nametable, palette, guide screen, etc.)
3. Get the corresponding buffer data location
4. Apply that buffer to VRAM

### 4. Buffer Index Mapping Missing

**File**: `src/includes/bank_val.inc`

```
con_ppu_buf_00 = $00
con_ppu_buf_guide = $02
con_ppu_buf_continue = $04
con_ppu_buf_06 = $06
...
con_ppu_buf_title_screen = $10    ← NAMETABLE (QUEUED IN PHASE 1, NOT APPLIED)
con_ppu_buf_12 = $12              ← PALETTE (ALSO NOT BEING APPLIED VIA INDEX)
```

But there is **NO CODE** in the bridge that maps these index values to actual buffer data addresses in RAM (like bank_06.asm buffer locations).

---

## How NES PPU Buffer System Works

In the original NES/6502 code:

1. **Buffer Queue**: Games write data to `ram_0302_ppu_buffer` command sequence
2. **Buffer Index**: `ram_ppu_load_index` holds which buffer to load during PPU writes
3. **Dispatcher**: When reading PPU registers or during VBlank, the indexed buffer is applied to PPU/VRAM

### NES Buffer Locations (Example - Title)

| Buffer Index | Name | Content Location | Data Type |
|-------------|------|------------------|-----------|
| $10 | Title Nametable | bank_06.asm offset 0x01A869 | Nametable tiles "Legend of Zelda" |
| $12 | (Palette?) | TBD | Palette data or other |

### Genesis Bridge Missing Piece

The bridge has:
- ✅ Shadow RAM for nametable, CHR, palette
- ✅ Rendering functions (PPU_FLUSH_VISIBLE_NAMETABLE, etc.)
- ✅ Title-specific CHR flush logic

But lacks:
- ❌ Buffer index dispatcher
- ❌ Logic to map index → buffer address
- ❌ Logic to apply indexed buffer to VRAM

---

## Baseline Probe Evidence

**Frame 16**: CHR loads because `PPU_FLUSH_TITLE_CHR_TO_VRAM` runs unconditionally
**Frame 54**: `flush_done` flips because of one-shot title CHR logic
**Throughout**: Nametable rows zero because:
1. Nametable buffer IS queued in Phase 1 subscript 2
2. But Genesis bridge never APPLIES it because it doesn't process `ram_ppu_load_index`

---

## Root Cause Summary

**The Genesis VDP bridge doesn't have a dispatcher that:**

1. Monitors `ram_ppu_load_index` changes
2. Maps buffer index values to their corres ponding data in RAM
3. Applies the correct buffer to VRAM at the right time

**Instead, the bridge hardcodes:**
- CHR flush via `PPU_FLUSH_CHR_SHADOW_TO_VRAM` (always titled CHR)
- Nametable flush via `PPU_FLUSH_VISIBLE_NAMETABLE` (always current nametable shadow)
- Palette flush via `PPU_SYNC_PALETTE_SHADOW_TO_CRAM` (always current palette)

This works for normal gameplay but **fails for title** because the title nametable data comes from buffer_$10, not from the current nametable shadow (which remains zero).

---

## Next Steps

1. **Map all buffer indices** to their data locations in RAM
   - Buffer $10 → Title nametable at 0x01A869 (from bank_06)
   - Buffer $12 → Palette data (need to locate)
   - Or buffer index $10 might actually mean "load title nametable from bank_06 location"

2. **Implement buffer dispatcher** in Genesis bridge
   - During NMI or VBlank, check `ram_ppu_load_index`
   - If changed, locate corresponding data
   - Apply to VRAM/CRAM

3. **Verify data staging location**
   - The NES code stages buffer data in `ram_0302_ppu_buffer`
   - But that's just a 256-byte command buffer
   - Actual buffer DATA (nametable, palette) is elsewhere
   - Must trace where `con_ppu_buf_title_screen` data is expected to come from

4. **Create specialized title handler**
   - May need custom code path for title that specifically applies:
     - Phase 1 nametable from bank_06.asm (0x01A869)
     - Phase 2 palette (TBD location)

---

## Files to Examine Next

1. **Bridge code**: `src/bridge/vdp_layer.asm` - needs buffer dispatcher
2. **NES buffer addressing**: `src/banks/nes_original/bank_FF.asm` - how buffers are addressed/located
3. **Custom title flush**: May need new function like `PPU_APPLY_INDEXED_BUFFER_TO_VRAM`
4. **Buffer data sources**: Map all `con_ppu_buf_*` indices to their actual data locations

