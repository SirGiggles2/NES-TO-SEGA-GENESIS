#!/usr/bin/env python3
"""
fix_checksum.py - Compute and write the correct checksum into a Genesis ROM header
Usage: python fix_checksum.py input.md output.md

The Genesis BIOS verifies a checksum stored at offset $018E (word).
It's the sum of all words from $000200 onward (after the header).
"""

import sys

def fix_checksum(input_path, output_path):
    with open(input_path, 'rb') as f:
        data = bytearray(f.read())

    # Pad to even length
    if len(data) % 2 != 0:
        data.append(0)

    # Pad to minimum 512 bytes if too small
    while len(data) < 512:
        data.append(0)

    # Compute checksum: sum of all words from offset $200 onward
    checksum = 0
    for i in range(0x200, len(data), 2):
        word = (data[i] << 8) | data[i+1]
        checksum = (checksum + word) & 0xFFFF

    # Write checksum at header offset $018E
    data[0x018E] = (checksum >> 8) & 0xFF
    data[0x018F] = checksum & 0xFF

    with open(output_path, 'wb') as f:
        f.write(data)

    print(f"  Checksum: ${checksum:04X}")
    print(f"  ROM size: {len(data)} bytes ({len(data)//1024} KB)")
    print(f"  Written:  {output_path}")

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: python fix_checksum.py input.md output.md")
        sys.exit(1)
    fix_checksum(sys.argv[1], sys.argv[2])
