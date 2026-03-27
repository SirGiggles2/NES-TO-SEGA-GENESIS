# VDP_ALT: Genesis-Native VRAM Layout

## Overview
Sega Genesis VRAM is 64KB = 65536 bytes. This layout optimizes for:
- Continuous tile pattern storage (no emulation overhead)
- Fast nametable updates
- Sprite OAM access
- Scroll table alignment

## Current (v650) PPU Emulation Layout
```
$0000-$0FFF: NES Backdrop tile + 3 blank tiles (16 tiles × 32B)
$1000-$3FFF: NES CHR pattern copies (2 banks × 4096 = 8KB) [FRAGMENTED]
$4000-$7FFF: Sprite tile copies (1024 tiles × 32B = 32KB) [shifted palette]
$8000-$BFFF: (Gap/unused)
$B000: Window plane nametable (41×28 = 2.3KB)
$B800: H-scroll table (224 entries × 2B = 448B)
$BE00: Sprite attribute table (80 sprites × 8B = 640B)
$C000: Plane A nametable (64×64 = 4KB)
$E000: Plane B nametable (64×64 = 4KB)
```

**Problems:**
- Pattern storage is fragmented (backdrop, CHR, sprites separate)
- No clear allocation strategy carried through
- Emulation layer masks Genesis capabilities

---

## Proposed VDP_ALT Layout (Genesis-Native)

### Hardware-Aware Organization
```
┌──────────────────────────────────────────────────────────────┐
│ Genesis VRAM (64KB = $10000 bytes)                           │
├──────────────────────────────────────────────────────────────┤
│ $0000-$0FFF (4KB)   │ Pattern/Tile Bank 0 (512 tiles)       │
│ $1000-$1FFF (4KB)   │ Pattern/Tile Bank 1 (512 tiles)       │
│ $2000-$2FFF (4KB)   │ Pattern/Tile Bank 2 (512 tiles)       │
│ $3000-$3FFF (4KB)   │ Pattern/Tile Bank 3 (512 tiles)       │
│─────────────────────────────────────────────────────────────│
│ $4000-$47FF (2KB)   │ Sprite Tile Bank (128 sprites)        │
│─────────────────────────────────────────────────────────────│
│ $4800-$4FFF (2KB)   │ Reserved / Future expansion           │
│─────────────────────────────────────────────────────────────│
│ $5000-$6FFF (8KB)   │ Reserved for runtime buffers          │
│─────────────────────────────────────────────────────────────│
│ $7000-$77FF (2KB)   │ H-Scroll Table (224 entries)          │
│ $7800-$79FF (512B)  │ Window Position Table (unused)        │
│ $7A00-$7DFF (1KB)   │ Padding / Future                      │
│─────────────────────────────────────────────────────────────│
│ $7E00-$7EFF (256B)  │ Sprite Attribute Table (80 sprites)   │
│ $7F00-$7FFF (256B)  │ Padding / Unused                      │
│─────────────────────────────────────────────────────────────│
│ $8000-$9FFF (8KB)   │ Plane A Nametable (64×64 = 4KB)       │
│ $A000-$BFFF (8KB)   │ Plane B Nametable (64×64 = 4KB)       │
│─────────────────────────────────────────────────────────────│
│ $C000-$FFFF (16KB)  │ Reserved / Debug / Future             │
└──────────────────────────────────────────────────────────────┘
```

### Allocation Details

#### **Tiles (Pattern Tables): $0000-$3FFF (16KB)**
- **$0000-$0FFF**: Background tile patterns (512 tiles)
  - NES CHR Bank 0 → Tiles 0-255
  - NES CHR Bank 1 → Tiles 256-511
- **$1000-$1FFF**: Additional patterns (512 tiles)
  - Room/dynamic assets
- **$2000-$2FFF**: Sprite patterns (512 tiles)
  - Pre-shifted for palette mapping
- **$3000-$3FFF**: UI/Effects patterns (512 tiles)
  - Title logo, menus, transitions

**Rationale:**
- Genesis uses 32-byte tiles (8×8 pixels, 4bpp)
- 4096 tiles addressable (tiles 0-4095)
- Layout keeps related patterns contiguous for DMA
- Sprite patterns separate = easier palette management

#### **Sprite Tiles: $4000-$47FF (2KB = 128 tiles)**
- 128 sprite tile definitions
- Pre-palette-shifted if needed
- Contiguous for fast OAM rendering

#### **H-Scroll Table: $7000-$7699 (224 entries)**
- VDP register $8D = placements
- 224 = NTSC/PAL max scanlines
- Each entry = 2 bytes (H-scroll position)
- Enables per-scanline horizontal scroll (future feature)

#### **Sprite Attribute Table (OAM): $7E00-$7EFF (256B)**
- Max 80 sprites (Genesis H32 limit)
- Each sprite = 8 bytes:
  - Y position (word)
  - X position (word)
  - Tile/attributes (word)
  - Link/size (word)

#### **Nametables: $8000-$BFFF (16KB)**
- **$8000-$9FFF**: Plane A (64×64 tiles = 4KB nametable + 4KB mapping)
- **$A000-$BFFF**: Plane B (64×64 tiles = 4KB nametable + 4KB mapping)
- Each entry = 2 bytes (priority, palette, flip, tile index)

---

## CRAM (Palette) Layout

Genesis CRAM = 128 colors (4 palettes × 16 colors)

```
CRAM Layout:
$00-$0F: Palette 0 (backdrop + background 0)
$10-$1F: Palette 1 (background 1)
$20-$2F: Palette 2 (sprites)
$30-$3F: Palette 3 (sprites/unused)
```

**NES → Genesis Palette Mapping:**
- NES has hard-coded palette ($3F00-$3F1F, 16 colors)
- Genesis CRAM access via VDP data port with address latch
- Simple: Convert NES BGR to Genesis BGR555 on write

---

## Migration Strategy (vdp_layer.asm → vdp_native.asm)

### Handler Rewrites
Each PPU handler routes to simpler VDP operations:

| NES Handler | New Route | VRAM Target |
|-------------|-----------|-------------|
| `PPU_WRITE_2000` | NMI enable → VDP reg $81 | N/A |
| `PPU_WRITE_2001` | Display on/off → VDP reg $81 bit 6 | N/A |
| `PPU_WRITE_2003/04` | Sprite index → OAM write prelude | Sprite RAM |
| `PPU_WRITE_2005` | X/Y scroll → H-scroll + VSRAM | $7000 |
| `PPU_WRITE_2007` | VRAM write → Route by address | $0000-$BFFF |

### Phase 1: Direct Dispatch
```asm
PPU_WRITE_2007_VRAM_DISPATCH:
    move.w (VRAM_ADDR_CURR).l, D3
    
    cmp.w #$2000, D3
    bhs .nametable_write
    
    ; Pattern/tile write
    bsr PPU_WRITE_PATTERN_BYTE_NATIVE  → writes to $0000-$1FFF
    rts
    
.nametable_write:
    cmp.w #$3F00, D3
    bhs .palette_write
    
    ; Nametable write
    bsr PPU_WRITE_NAMETABLE_BYTE_NATIVE  → writes to $8000-$BFFF
    rts
    
.palette_write:
    ; Palette write
    bsr PPU_WRITE_PALETTE_BYTE_NATIVE  → CRAM writes
    rts
```

---

## VRAM Constants (vdp_native.asm)

```asm
; Tile/Pattern storage
TILE_BANK_0_VRAM    EQU $0000   ; NES CHR 0
TILE_BANK_1_VRAM    EQU $1000   ; NES CHR 1
TILE_BANK_2_VRAM    EQU $2000   ; Sprites
TILE_BANK_3_VRAM    EQU $3000   ; UI/effects

; Sprite resources
SPRITE_TILE_VRAM    EQU $4000
SPRITE_OAM_VRAM     EQU $7E00

; Tables
HSCROLL_TABLE_VRAM  EQU $7000
VSRAM_ADDR          EQU $C00008 ; Direct VSRAM access

; Nametables
PLANE_A_VRAM        EQU $8000
PLANE_B_VRAM        EQU $A000

; Sizes (in bytes)
TILE_SIZE           EQU 32      ; 8×8 @ 4bpp
TILES_PER_BANK      EQU 512
BANK_SIZE           EQU TILES_PER_BANK * TILE_SIZE  ; 16KB
```

---

## Next Steps

1. **Create `src/bridge/vdp_native.asm`** with these constants
2. **Implement tile upload routine** that accepts CHR data from banks
3. **Rewrite `PPU_WRITE_2007`** dispatcher
4. **Test title screen** with native VRAM layout
5. **Iterate on sprite/plane rendering**

---

## Comparison: Emulation vs. Native

| Aspect | Current (v650) | VDP_ALT Native |
|--------|---|---|
| **Tile storage** | Fragmented (4 locations) | Contiguous banks ($0000-$3FFF) |
| **Handler complexity** | Shadow RAM + emulation | Direct VRAM writes |
| **Scroll handling** | PPU_WRITE_2005 → complex | Direct H/V scroll writes |
| **OAM (sprites)** | Buffer + sync | Direct table updates |
| **Palette** | BGR555 conversion | BGR555 conversion (same, simpler) |
| **Code size** | 1551 lines | Target ~600-800 lines |
| **Runtime overhead** | 2-3 cycles per write | 1-2 cycles per write |

---

## References
- Sega Genesis VDP Hardware: Register layout, timing, DMA
- NES PPU: Addressing modes ($2000-$2007 register semantic)
- Current bridge: `src/bridge/vdp_layer.asm` (lines 130-300)
