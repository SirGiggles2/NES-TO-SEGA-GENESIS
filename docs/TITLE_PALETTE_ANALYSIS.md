# NES Zelda Title Screen Palette Analysis

## Executive Summary

The title screen initializes **8 complete palette entries** (palettes 0-7) and uses **all palette indices (0-3)** within the nametable attribute table to apply different color schemes to various 2x2 tile blocks across the screen.

---

## 1. Title Screen Palette Data

### Location
- **File**: `src/banks/nes_original/bank_02.asm`
- **Label**: `tbl_954F_demo_manual_palette`
- **ROM Address**: `0x00954F` (PRG bank 2, CPU address $954F)
- **Data Length**: 33 bytes (1 header + 32 palette bytes)

### Data Structure

```
Offset  Value   Description
0x00    $3F     PPU palette register high byte
0x01    $00     PPU palette register low byte
0x02    $20     Data count (32 bytes = 8 palettes × 4 colors)
0x03    $0F     Background color (universal, black)
0x04    $30     Palette 0, color 1
0x05    $30     Palette 0, color 2
0x06    $30     Palette 0, color 3
...     ...     (continues for palettes 1-7)
0x22    $FF     End token
```

### Complete Palette Definitions

| Palette | Color 0 | Color 1 | Color 2 | Color 3 | Usage                          |
|---------|---------|---------|---------|---------|--------------------------------|
| **0**   | $0F     | $30     | $30     | $30     | Title background (Light gray)  |
| **1**   | $0F     | $21     | $30     | $30     | Blue scheme                    |
| **2**   | $0F     | $16     | $30     | $30     | Green scheme                   |
| **3**   | $0F     | $29     | $1A     | $09     | Yellow/Cyan/Dark scheme        |
| **4**   | $0F     | $29     | $37     | $17     | Yellow/Magenta/Brown scheme    |
| **5**   | $0F     | $02     | $22     | $30     | Red/Light Red scheme           |
| **6**   | $0F     | $16     | $27     | $30     | Green/Light Green scheme       |
| **7**   | $0F     | $0B     | $1B     | $2B     | Gray/Purple scheme             |

**Note**: $0F is the universal background color (black). Each palette uses this as the transparent/background color.

---

## 2. Title Screen PPU Buffer Configuration

### PPU Buffer Index
- **Constant**: `con_ppu_buf_title_screen = $10`
- **Meaning**: This index directs the PPU loading system to the title screen PPU data structure

### PPU Data Table Reference
- **Table**: `tbl_A000_ppu_data` (bank 06, offset 0x01A000)
- **Entry Location**: Offset + 0x10 (word address 0x01A020)
- **Points To**: `_off000_A869_10_title_screen` (0x01A869 in bank 06)

```asm
tbl_A000_ppu_data:
    ...
    .word _off000_A869_10_title_screen  ; PPU buffer index 0x10
    ...
```

---

## 3. Title Screen Nametable and Attributes

### PPU Data Structure Layout
Located at `src/banks/nes_original/bank_06.asm`, label `_off000_A869_10_title_screen`

The structure consists of:
1. **Nametable data** - 28 rows of tile indices (32 bytes per row)
2. **Attribute tables** - Two attribute blocks defining palette indices

### Nametable Regions
Each row is loaded as:
- PPU Address (16-bit)
- Count ($20 = 32 bytes)
- 32 tile ID bytes

**Nametable regions loaded**:
```
Row 0-7:   $2000, $2020, $2040, $2060, $2080, $20A0, $20C0, $20E0
Row 8-15:  $2100, $2120, $2140, $2160, $2180, $21A0, $21C0, $21E0
Row 16-23: $2200, $2220, $2240, $2260, $2280, $22A0, $22C0, $22E0
Row 24-29: $2300, $2320, $2340, $2360, $2380, $23A0
```

### Attribute Tables

#### Attribute Block 1 ($23C0)
**PPU Address**: $23C0 (attribute table, rows 0-15, columns 0-15)

**Data** (32 bytes):
```
$05, $05, $05, $05, $05, $05, $05, $05, 
$08, $6A, $5A, $5A, $5A, $5A, $9A, $22, 
$00, $66, $55, $55, $55, $55, $99, $00, 
$00, $6E, $5F, $55, $5D, $DF, $BB, $00
```

#### Attribute Block 2 ($23E0)
**PPU Address**: $23E0 (attribute table, rows 16-29, columns 0-15)

**Data** (32 bytes):
```
$00, $0A, $0A, $0A, $0A, $0A, $0A, $00, 
$00, $00, $C0, $30, $00, $00, $00, $00, 
$00, $00, $CC, $33, $00, $00, $00, $00, 
$00, $20, $FC, $F3, $00, $00, $F0, $F0
```

---

## 4. Palette Index Encoding in Attributes

### Attribute Byte Format
Each attribute byte controls palette assignments for four 2×2 tile blocks:

```
Byte: X X Y Y B B T T
      └─┬─┘ └─┬─┘ └─┬─┘ └─┬─┘
        │     │     │     └─ Top-left block palette
        │     │     └─────── Top-right block palette
        │     └───────────── Bottom-left block palette
        └───────────────────── Bottom-right block palette

Value range: 0-3 (selects which of the 8 palettes applies)
```

### Example Decoding

| Attribute | T-L | T-R | B-L | B-R | Interpretation |
|-----------|-----|-----|-----|-----|---|
| $05       | 01  | 00  | 00  | 00  | TL uses Pal1, others use Pal0 |
| $6A       | 10  | 01  | 10  | 01  | Alternating Pal2 and Pal1 |
| $5A       | 10  | 01  | 01  | 01  | One Pal2, rest Pal1 |
| $C0       | 11  | 00  | 00  | 00  | TL uses Pal3, others Pal0 |
| $FC       | 11  | 11  | 11  | 00  | Most use Pal3, BR uses Pal0 |
| $F3       | 11  | 11  | 00  | 11  | Pal3 everywhere except BR which uses Pal0 |

### Palette Indices Used
All palette entries are referenced:
- **Palette 0** ($00): Appears most frequently (background blocks)
- **Palette 1** ($01): Logo/text areas
- **Palette 2** ($10): Border/decorative elements
- **Palette 3** ($11): Highlights/emphasis

Each 2×2 tile block can independently reference any of the 8 defined palettes, enabling rich color variation across the title screen.

---

## 5. Title Screen Initialization Path

### Script Entry
- **File**: `src/banks/nes_original/bank_FF.asm`
- **Label**: `ofs_main_script_1_E94B_00_title_screen`
- **ROM Address**: 0x01E94B (bank 7)

### Demo/Manual Palette Setup
- **File**: `src/banks/nes_original/bank_02.asm`
- **Entry Point**: `ofs_9573_01` (0x009573)
- Copies `tbl_954F_demo_manual_palette` to `ram_0302_ppu_buffer` (PPU buffer)
- Loads palette via `ram_ppu_load_index = con_ppu_buf_title_screen` ($10)

### PPU Write Routine
- **Function**: `sub_0x01A090_write_buffer_to_ppu`
- **File**: `src/banks/nes_original/bank_06.asm`
- **ROM Address**: 0x01A090
- Looks up PPU data pointer from `tbl_A000_ppu_data` using `ram_ppu_load_index`
- Writes nametable and attribute data to PPU via $2006 (PPU address) and $2007 (PPU data)

---

## 6. ROM Address References

| Component | ROM Address | Bank | CPU Address |
|-----------|-------------|------|-------------|
| Palette Data | 0x00954F | 02 | $954F |
| PPU Table | 0x01A000 | 06 | $A000 |
| PPU Data | 0x01A869 | 06 | $A869 |
| Write Routine | 0x01A090 | 06 | $A080 |
| Title Script | 0x01E94B | 07 | $E94B |

---

## 7. Key Discoveries

1. **8 Palettes Loaded**: All 8 palette entries are initialized with distinct color values
2. **Full Attribute Usage**: Attributes reference all palette indices (0-3) throughout the screen
3. **Dynamic Palette Switching**: The attribute table allows different 2×2 tile blocks to use different palettes, enabling visual complexity
4. **Indexed Palette System**: PPU buffer index $10 uniquely identifies the title screen graphics/palette configuration
5. **Centralized PPU Table**: `tbl_A000_ppu_data` provides a dispatcher for loading any screen's PPU data by index

---

## 8. Bridge Layer Notes

The Genesis port uses `con_ppu_buf_title_screen = $10` as a key identifier. Title screen palette handling includes special color balancing logic in `src/bridge/vdp_layer.asm` (line 789: `TITLE_SCREEN_COLOR_BALANCE`) to maintain NES-to-Genesis color fidelity.
