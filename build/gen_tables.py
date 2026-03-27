import re
NES_RGB = [
    (124, 124, 124), (0, 0, 252), (0, 0, 188), (68, 40, 188), (148, 0, 132), (168, 0, 32), (168, 16, 0), (136, 20, 0),
    (80, 48, 0), (0, 120, 0), (0, 104, 0), (0, 88, 0), (0, 64, 88), (0, 0, 0), (0, 0, 0), (0, 0, 0),
    (188, 188, 188), (0, 120, 248), (0, 88, 248), (104, 68, 252), (216, 0, 204), (228, 0, 88), (248, 56, 0), (228, 92, 16),
    (172, 124, 0), (0, 184, 0), (0, 168, 0), (0, 168, 68), (0, 136, 136), (0, 0, 0), (0, 0, 0), (0, 0, 0),
    (248, 248, 248), (60, 188, 252), (104, 136, 252), (152, 120, 248), (248, 120, 248), (248, 88, 152), (248, 120, 88), (252, 160, 68),
    (248, 184, 0), (184, 248, 24), (88, 216, 84), (88, 248, 152), (0, 232, 216), (120, 120, 120), (0, 0, 0), (0, 0, 0),
    (252, 252, 252), (164, 228, 252), (184, 184, 248), (216, 184, 248), (248, 184, 248), (248, 164, 192), (240, 208, 176), (252, 224, 168),
    (248, 216, 120), (216, 248, 120), (184, 248, 184), (184, 248, 216), (0, 252, 252), (216, 216, 216), (0, 0, 0), (0, 0, 0),
]
GLOBAL_OVERRIDES = { 0x07: 0x00AE, 0x0C: 0x0CCE, 0x0F: 0x0444, 0x12: 0x0EEE, 0x16: 0x0CCE, 0x17: 0x08CE, 0x1C: 0x0EEE, 0x27: 0x0AEE, 0x29: 0x08EE, 0x2C: 0x0EEE }
TITLE_SCREEN_OVERRIDES = { 0x08: 0x08CE, 0x1A: 0x08E0, 0x22: 0x0ECC, 0x28: 0x00EE, 0x30: 0x0EEE, 0x36: 0x0CCE, 0x37: 0x0EEE, 0x3B: 0x0EEE }

def decode(word: int): return (word & 0x000E) >> 1, (word & 0x00E0) >> 5, (word & 0x0E00) >> 9
def encode(r: int, g: int, b: int): return (b << 9) | (g << 5) | (r << 1)
def quantize_channel(channel: int): return max(0, min(7, round(((channel / 255.0) ** 0.85) * 7)))
def lift_channel(level: int):
    if level == 0: return 0
    if level <= 1: return 3
    if level == 2: return 4
    if level == 3: return 5
    if level == 4: return 6
    return 7
def lift_word(word: int):
    r, g, b = decode(word)
    return encode(lift_channel(r), lift_channel(g), lift_channel(b))

expected = [lift_word(encode(quantize_channel(rgb[0]), quantize_channel(rgb[1]), quantize_channel(rgb[2]))) for rgb in NES_RGB]
for k, v in GLOBAL_OVERRIDES.items(): expected[k] = v
expected_title = expected.copy()
for k, v in TITLE_SCREEN_OVERRIDES.items(): expected_title[k] = v

def format_table(name, lst):
    res = f'{name}:\n'
    for i in range(0, 64, 8):
        res += f';   ${i:02X}      ${i+1:02X}      ${i+2:02X}      ${i+3:02X}      ${i+4:02X}      ${i+5:02X}      ${i+6:02X}      ${i+7:02X}\n'
        row = ', '.join(f'${w:04X}' for w in lst[i:i+8])
        res += f'    DC.W {row}\n'
    return res

import sys
with open('tables.asm', 'w') as f:
    f.write(format_table('CORRECT_NES_PALETTE', expected))
    f.write('\n')
    f.write(format_table('TITLE_SCREEN_NES_PALETTE', expected_title))
