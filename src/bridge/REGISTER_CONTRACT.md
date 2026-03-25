# VDP Bridge Register Contracts

## Purpose
This file documents register lifetime contracts for `src/bridge/vdp_layer.asm`.
The #1 recurring bug class in this project is register clobbering — overwriting
a register (D3, D4, etc.) that a caller still depends on. These contracts are
enforced by `tools/check_register_safety.py`.

---

## PPU Write Chain

### PPU_WRITE_2007
**Caller**: Game code (via NES PPU $2007 write translation)  
**Inputs**: D0 = data byte to write  
**Internal**: D3 = VRAM_ADDR_CURR (loaded at entry)  
**Dispatches to**: PPU_WRITE_NAMETABLE_BYTE, PPU_WRITE_PATTERN_BYTE, palette write  
**Contract**: D3 must be preserved across subroutine calls — it carries the PPU address.

### PPU_WRITE_NAMETABLE_BYTE
**Inputs**: D0 = tile byte, D3 = VRAM address (from VRAM_ADDR_CURR)  
**Outputs**: Updates PPU_NT_SHADOW, may call PPU_RENDER_NAMETABLE_CELL  
**Clobbers**: D4, D5, D6, D7 (via PPU_NORMALIZE_NAMETABLE_ADDR and render)  
**MUST PRESERVE**: D3 — required by PPU_NORMALIZE_NAMETABLE_ADDR  
**Known bug**: v598 wrote `move.b (ram_script).l,D3` destroying VRAM address → total visual corruption. Fixed in v599 by using D5 instead.

### PPU_WRITE_PATTERN_BYTE
**Inputs**: D0 = pattern byte, D3 = VRAM address  
**Outputs**: Updates PPU_CHR_SHADOW  
**Clobbers**: D4  
**MUST PRESERVE**: D3

### PPU_NORMALIZE_NAMETABLE_ADDR
**Inputs**: D3 = raw PPU nametable address ($2000-$2FFF range)  
**Outputs**: D4 = normalized NT shadow offset (0-$7FF), D5 = mirror mode scratch  
**Clobbers**: D4, D5  
**MUST PRESERVE**: D3 (reads it, does not modify)

---

## Render Chain

### PPU_RENDER_NAMETABLE_CELL
**Inputs**: D4 = nametable shadow index (0-$7FF linear)  
**Outputs**: Writes one tile cell to VDP Plane A  
**Clobbers**: D0-D7, A0 (ALL data registers)  
**MUST PRESERVE**: Nothing — caller must save anything it needs  
**Contract**: Callers (PPU_FLUSH_VISIBLE_NAMETABLE, PPU_WRITE_NAMETABLE_BYTE) save D6/D7 on stack before calling.

### PPU_RENDER_ATTRIBUTE_BLOCK
**Inputs**: D4 = attribute offset in NT shadow  
**Outputs**: Re-renders 4x4 tile block with updated palette  
**Clobbers**: D0-D7, A0  
**MUST PRESERVE**: Nothing

### PPU_FLUSH_VISIBLE_NAMETABLE
**Inputs**: None (reads PPU_NT_SHADOW directly)  
**Outputs**: Renders all 30×32 tiles to VDP Plane A, clears overflow columns  
**Clobbers**: D0-D7, A0 (all during loop; D0-D1/D7 saved for overflow clear)  
**Side effects**: Clears PPU_FULL_REDRAW_PENDING, invalidates plane cache

---

## VBlank Chain

### VDP_VBLANK_HANDLER
**Saves**: D0-D7/A0-A6 via movem.l  
**Restores**: All registers before RTE  
**Contract**: This is the safe boundary — everything inside VBlank can freely use all registers because they're saved on entry.

### VDP_OAM_DMA_TRANSFER
**Called from**: VDP_VBLANK_HANDLER  
**Inputs**: None (reads OAM at $FF0200)  
**Clobbers**: D0-D7, A1  
**Contract**: Safe because caller (VBlank) saves everything

---

## CHR Flush Chain

### PPU_FLUSH_CHR_SHADOW_TO_VRAM
**Saves**: D0-D7/A0-A3 via movem.l  
**Restores**: Same  
**Contract**: Self-contained — safe to call from anywhere

### PPU_FLUSH_TITLE_CHR_TO_VRAM
**Inputs**: None  
**Clobbers**: D0 (frame counter check)  
**Contract**: May call PPU_FLUSH_CHR_SHADOW_TO_VRAM which saves its own registers

---

## Palette Chain

### PPU_SYNC_PALETTE_SHADOW_TO_CRAM
**Called from**: VDP_VBLANK_HANDLER  
**Clobbers**: D0-D7, A0-A1  
**Contract**: Safe because VBlank saves everything

---

## Utility

### VDP_SET_VRAM_WRITE_ADDR
**Inputs**: D0 = VRAM byte address  
**Clobbers**: D1  
**MUST PRESERVE**: D0 (does not modify)  
**Contract**: D1 is scratch — callers should not rely on D1 across this call

---

## Register Risk Summary

| Register | High-Risk In | Carries |
|----------|-------------|---------|
| D0 | All functions | Tile data / general accumulator |
| D3 | PPU_WRITE_* chain | VRAM address — **NEVER clobber before normalize** |
| D4 | PPU_RENDER_* chain | Nametable shadow offset |
| D5 | PPU_WRITE_NAMETABLE_BYTE | Scratch (safe to use before .write_normally) |
| D6/D7 | PPU_FLUSH loops | Loop counters (saved on stack) |

## Version History
- v599: Created after v598 D3 clobber regression. D5 used as scratch for script check.
- v490: Sprite architecture (5 interdependent fix points). GUARD comments added.
- v482: Scroll writeback fix (PPU $2005 no longer clobbers RAM_SCROLL_X/Y).
