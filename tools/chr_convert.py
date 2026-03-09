#!/usr/bin/env python3
"""
chr_convert.py - Convert NES 2bpp CHR tiles to Genesis 4bpp format

NES CHR layout (8KB = PT0 + PT1):
  PT0 ($0000-$0FFF):
    $0000-$06FF: 02___807F_877E.chr  (112 tiles, overworld BG low)
    $0700-$0FFF: 01___8DB4_96B3.chr  (144 tiles, overworld BG high)
  PT1 ($1000-$1FFF):
    $1000-$16FF: 02___877F_8E7E.chr  (112 tiles, overworld sprite low)
    $1700-$1F1F: 01___96B4_9ED3.chr  (130 tiles, overworld sprite high)
    $1F20-$1FFF: 02___8E7F_8F5E.chr  ( 14 tiles, remainder)

Genesis output (16KB = zelda_tiles_4bpp.bin):
  Tiles   0-255  (VRAM $0000-$1FFF): PT0 in 4bpp
  Tiles 256-511  (VRAM $2000-$3FFF): PT1 in 4bpp
"""

import os, sys

CHR_DIR = os.path.join(os.path.dirname(__file__), "incbin", "chr")
OUTPUT  = os.path.join(os.path.dirname(__file__), "zelda_tiles_4bpp.bin")

# NES CHR layout: (nes_vram_start_byte, nes_vram_end_byte_inclusive, filename)
NES_CHR_LAYOUT = [
    # PT0 ($0000-$0FFF, 4096 bytes = 256 tiles)
    (0x0000, 0x06FF, "02___807F_877E.chr"),
    (0x0700, 0x0FFF, "01___8DB4_96B3.chr"),
    # PT1 ($1000-$1FFF, 4096 bytes = 256 tiles)
    (0x1000, 0x16FF, "02___877F_8E7E.chr"),
    (0x1700, 0x1F1F, "01___96B4_9ED3.chr"),
    (0x1F20, 0x1FFF, "02___8E7F_8F5E.chr"),
]

def nes_2bpp_to_genesis_4bpp(nes_bytes):
    """
    Convert a block of NES 2bpp tile data to Genesis 4bpp.
    Input:  16 bytes per tile  (plane0: 8 bytes, plane1: 8 bytes)
    Output: 32 bytes per tile  (4 bits/pixel, packed, MSB first)
    """
    out = bytearray()
    n_tiles = len(nes_bytes) // 16
    for t in range(n_tiles):
        base = t * 16
        for row in range(8):
            plane0 = nes_bytes[base + row]      # bit-0 of each pixel colour
            plane1 = nes_bytes[base + row + 8]  # bit-1 of each pixel colour
            # Pack 8 pixels into 4 bytes.  Pixel 0 = high nibble of byte 0.
            b = [0, 0, 0, 0]
            for pix in range(8):
                bit0  = (plane0 >> (7 - pix)) & 1
                bit1  = (plane1 >> (7 - pix)) & 1
                color = (bit1 << 1) | bit0        # 0-3
                bi    = pix >> 1                  # byte index (0-3)
                if pix & 1 == 0:
                    b[bi] = color << 4
                else:
                    b[bi] |= color
            out.extend(b)
    return bytes(out)

def main():
    print("=== chr_convert.py: NES 2bpp -> Genesis 4bpp ===")

    # Assemble 8KB NES CHR space
    nes_chr = bytearray(0x2000)
    ok = True
    for vstart, vend, fname in NES_CHR_LAYOUT:
        fpath = os.path.join(CHR_DIR, fname)
        if not os.path.exists(fpath):
            print(f"  ERROR: {fname} not found at {fpath}")
            ok = False
            continue
        data = open(fpath, "rb").read()
        expected = vend - vstart + 1
        if len(data) != expected:
            print(f"  WARNING: {fname}: got {len(data)} bytes, expected {expected}")
        count = len(data) // 16
        dst_end = min(vstart + len(data), 0x2000)
        nes_chr[vstart:dst_end] = data[:dst_end - vstart]
        print(f"  {fname}: {count} tiles -> NES VRAM ${vstart:04X}-${vend:04X}")

    if not ok:
        print("Aborting due to missing files.")
        sys.exit(1)

    # Convert to Genesis 4bpp (8KB -> 16KB)
    gen_tiles = nes_2bpp_to_genesis_4bpp(bytes(nes_chr))

    with open(OUTPUT, "wb") as f:
        f.write(gen_tiles)

    print(f"\nOutput : {OUTPUT}")
    print(f"Size   : {len(gen_tiles)} bytes ({len(gen_tiles)//1024} KB)")
    print(f"Tiles  : {len(gen_tiles)//32} Genesis tiles")
    print(f"Layout : $0000-$1FFF = PT0 background tiles (0-255)")
    print(f"         $2000-$3FFF = PT1 sprite tiles (256-511)")
    print("Done.")

if __name__ == "__main__":
    main()
