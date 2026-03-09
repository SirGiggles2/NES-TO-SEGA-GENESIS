#!/usr/bin/env python3
"""
fix_syntax.py - Fix ca65 syntax artifacts in translated 68000 assembly
"""

import re
import glob
from collections import defaultdict

KNOWN_CONSTANTS = {
    'con_prg_bank':         0x00,
    'con_mirroring_h':      0x01,
    'con_mirroring_v':      0x00,
    'con_prg_mode_0':       0x00,
    'con_prg_mode_1':       0x02,
    'con_prg_mode_2':       0x04,
    'con_prg_mode_3':       0x06,
    'con_chr_mode_0':       0x00,
    'con_chr_mode_1':       0x10,
    'con_new_line_1':       0x80,
    'con_new_line_2':       0x40,
    'con_message_end':      0xC0,
    'con_ppu_ctrl_nmi':     0x80,
    'con_ppu_ctrl_spr':     0x08,
    'con_ppu_ctrl_bg':      0x10,
    'con_obj_state_01':     0x01,
    'con_obj_state_02':     0x02,
    'con_obj_state_04':     0x04,
    'con_obj_state_08':     0x08,
    'con_obj_state_10':     0x10,
    'con_obj_state_20':     0x20,
    'con_obj_state_freeze': 0x40,
    'con_obj_state_80':     0x80,
    'con_btn_a':            0x80,
    'con_btn_b':            0x40,
    'con_btn_select':       0x20,
    'con_btn_start':        0x10,
    'con_btn_up':           0x08,
    'con_btn_down':         0x04,
    'con_btn_left':         0x02,
    'con_btn_right':        0x01,
    'con_map_location':     0x00,
    'con_collision_tile':   0x00,
    'con_04c0_01':          0x01,
    'con_04c0_80':          0x80,
    'con_sfx_4_rupee':      0x10,
    'con_sfx_1':            0x01,
    'con_sfx_2':            0x02,
    'con_sfx_3':            0x04,
    'con_sfx_4':            0x08,
}

RAM_LABELS = {
    'ram_oam':    0x0200,
    'ram_stack':  0x0100,
    'ram_zp':     0x0000,
    'ram_6530':   0x6530,
}

ROM_LABELS = {
    'tbl_9fa0_tiles_id': 0x9FA0,
    'tbl_985b':          0x985B,
    'tbl_8000_tiles':    0x8000,
}

REGISTER_NAMES = {'d0','d1','d2','d3','d4','d5','d6','d7',
                  'a0','a1','a2','a3','a4','a5','a6','a7','sp'}

ALL_LABELS = {**RAM_LABELS, **ROM_LABELS}

# Labels that are referenced across bank files and must NOT be prefixed
GLOBAL_LABELS = {
    'MainInit', 'ResetHandler_NES', 'VDP_INIT', 'VDP_VBLANK_HANDLER',
    'GENESIS_RESET', 'EXCEPTION_HANDLER', 'JOYPAD_INIT', 'READ_JOYPAD',
    'PPU_WRITE_2000', 'PPU_WRITE_2001', 'PPU_READ_2002', 'PPU_WRITE_2003',
    'PPU_WRITE_2005', 'PPU_WRITE_2006', 'PPU_WRITE_2007',
    'PPU_READ_2007', 'VDP_CLEAR_VRAM', 'VDP_LOAD_NES_PALETTE',
    'VDP_OAM_DMA_TRANSFER', 'NES_PAL_TO_BGR555', 'NES_PALETTE_DATA',
    # RAM variables used across banks
    'ram_oam', 'ram_stack', 'ram_zp',
}


def strip_bank_prefix(tok):
    """Strip bank prefix like b05_ from a token before label lookup."""
    m = re.match(r'^b[0-9A-Fa-f]{2,4}_(.+)$', tok)
    if m:
        return m.group(1)
    return tok


def eval_const_expr(expr):
    expr = expr.strip()
    if expr.startswith('(') and expr.endswith(')'):
        expr = expr[1:-1].strip()
    tokens = re.split(r'\s*([+\-\^])\s*', expr)
    result = None
    current_op = '+'
    for tok in tokens:
        tok = tok.strip()
        if tok in ('+', '-', '^'):
            current_op = tok
            continue
        val = None
        m = re.match(r'^\$([0-9A-Fa-f]+)$', tok)
        if m:
            val = int(m.group(1), 16)
        elif re.match(r'^\d+$', tok):
            val = int(tok)
        elif tok.lower() in KNOWN_CONSTANTS:
            val = KNOWN_CONSTANTS[tok.lower()]
        elif tok.lower() in ALL_LABELS:
            val = ALL_LABELS[tok.lower()]
        else:
            # Try stripping bank prefix (e.g. b05_tbl_9fa0_tiles_id → tbl_9fa0_tiles_id)
            stripped = strip_bank_prefix(tok).lower()
            if stripped in KNOWN_CONSTANTS:
                val = KNOWN_CONSTANTS[stripped]
            elif stripped in ALL_LABELS:
                val = ALL_LABELS[stripped]
        if val is None:
            return None
        if result is None:
            result = val
        elif current_op == '+':
            result = (result + val) & 0xFFFF
        elif current_op == '-':
            result = (result - val) & 0xFFFF
        elif current_op == '^':
            result = (result ^ val) & 0xFFFF
    return result


def make_bank_prefix(filepath):
    """Convert filename like bank_04_gen68k_vdp.asm → prefix 'b04_'"""
    m = re.search(r'bank_([^_]+)', filepath)
    if m:
        tag = m.group(1).replace('_','').upper()
        return 'b%s_' % tag[:4]
    return 'bXX_'


def is_local_label(name):
    """
    Only prefix labels that are genuinely local to a bank (branch targets,
    local data tables). Leave all semantically global symbols unprefixed.
    """
    n = name.lower()
    # Already prefixed - don't double-prefix
    if re.match(r'^b[0-9a-f]{2,4}_', n):
        return False
    # These specific labels are defined in multiple banks and must be prefixed
    # Check BEFORE the global exemptions so sub_B010 etc. get caught
    # to avoid redefinition errors. Add to this list as new collisions appear.
    KNOWN_COLLIDERS = {
        'tbl_985b', 'tbl_8000_tiles', 'loc_8c8d', 'sub_b010',
    }
    if n in KNOWN_COLLIDERS:
        return True
    # Semantically global - never prefix these
    for glob in ('ram_', 'sub_', 'con_', 'fn_', 'init_', 'vdp_', 'ppu_',
                 'genesis_', 'nes_', 'joypad_', 'read_', 'exception_',
                 'main', 'reset'):
        if n.startswith(glob):
            return False
    # Local branch/data label patterns from the translator.
    # Only pure local branch labels get prefixed - everything else is cross-bank global.
    for local in ('bra_', 'lbl_', 'loop_', 'skip_', 'done_', 'next_', 'end_', 'ret_', 'jmp_'):
        if n.startswith(local):
            return True
    # Pure 4-hex-char labels like A562 - local branch targets
    if re.match(r'^[0-9a-f]{4}$', n):
        return True
    # Default: don't prefix unknowns
    return False


def prefix_labels_in_file(lines, prefix):
    """
    Add bank-specific prefix ONLY to local branch/data labels that could
    collide across bank files. All global symbols are left untouched.
    """
    local_labels = set()
    for line in lines:
        m = re.match(r'^([A-Za-z_.][A-Za-z0-9_.]*):(?:\s*;.*)?$', line.rstrip())
        if m:
            lbl = m.group(1)
            if not lbl.startswith('.') and is_local_label(lbl):
                local_labels.add(lbl)

    if not local_labels:
        return lines, 0

    sorted_labels = sorted(local_labels, key=len, reverse=True)
    escaped = [re.escape(lbl) for lbl in sorted_labels]
    pattern = r'\b(' + '|'.join(escaped) + r')\b'

    renamed = 0
    fixed = []
    for line in lines:
        new_line = re.sub(pattern, lambda m: prefix + m.group(1), line)
        if new_line != line:
            renamed += 1
        fixed.append(new_line)
    return fixed, renamed


def fix_line(line):

    # Fix A: MOVE.B (D0).l,D3 → wrong ROL/ROR A expansion
    if '(D0).l' in line:
        if re.match(r'^\s*MOVE\.B\s+\(D0\)\.l,D3\s*;.*(ROXL|ROXR|ROL|ROR)', line, re.IGNORECASE):
            return ''
        line = re.sub(r'^(\s*)(ROXL|ROXR)\.B\s+#1,D3', r'\1\2.B  #1,D0', line, flags=re.IGNORECASE)
        if re.match(r'^\s*MOVE\.B\s+D3,\(D0\)\.l', line, re.IGNORECASE):
            return ''

    # Fix B: constant expressions in immediates
    def fix_imm_expr(m):
        prefix_str = m.group(1)
        expr   = m.group(2)
        suffix = m.group(3)
        if not re.search(r'[a-zA-Z_]', expr):
            return m.group(0)
        expr_clean = re.split(r'\s*;', expr)[0].strip()
        resolved = eval_const_expr(expr_clean)
        if resolved is not None:
            return '%s#$%02X%s' % (prefix_str, resolved & 0xFF, suffix)
        return m.group(0)
    line = re.sub(
        r'^(\s*(?:MOVE|CMPI|ANDI|ORI|EORI|ADDI|SUBI)\.B\s+)#([^,\n]+?)(,D\d.*)',
        fix_imm_expr, line, flags=re.IGNORECASE
    )

    # Fix C: #> $XXXX and #< $XXXX
    def fix_byte_op_literal(m):
        op  = m.group(1)
        val = int(m.group(2), 16)
        return '#$%02X' % ((val >> 8) & 0xFF if op == '>' else val & 0xFF)
    line = re.sub(r'#([><])\s*\$([0-9A-Fa-f]{3,4})', fix_byte_op_literal, line)

    # Fix D: #< label, #> label
    def fix_label_byte_op(m):
        op    = m.group(1)
        label = m.group(2).lower()
        if label in ALL_LABELS:
            val = ALL_LABELS[label]
            return '#$%02X' % ((val >> 8) & 0xFF if op == '>' else val & 0xFF)
        return '#$00' if op == '<' else '#$02'
    line = re.sub(r'#([><])\s*([a-z_][a-z0-9_]*)(?!\s*[+\-\^\(])',
                  fix_label_byte_op, line, flags=re.IGNORECASE)

    # Fix E: #< (expr) or #> (expr)
    def fix_complex_byte_op(m):
        op   = m.group(1)
        expr = m.group(2)
        val  = eval_const_expr(expr)
        if val is not None:
            result = (val >> 8) & 0xFF if op == '>' else val & 0xFF
            return '#$%02X' % result
        return '#$F0  ; !! UNRESOLVED %s(%s)' % ('hi' if op == '>' else 'lo', expr.strip())
    line = re.sub(r'#([><])\s*(\([^)]+\))', fix_complex_byte_op, line, flags=re.IGNORECASE)

    # Fix F: comment-in-operand: MOVE.B #$xx ; comment,D0
    line = re.sub(
        r'^(\s*)MOVE\.B\s+(#\$[0-9A-Fa-f]+)\s*;[^,\n]*,(D\d).*',
        lambda m: '%sMOVE.B  %s,%s\n' % (m.group(1), m.group(2), m.group(3)),
        line
    )

    # Fix G: ADDX
    line = re.sub(r'\bADDX\.B\s+(#\$[0-9A-Fa-f]+)', r'ADD.B  \1', line)
    line = re.sub(r'\bADDX\.W\s+(#\$[0-9A-Fa-f]+)', r'ADD.W  \1', line)
    def fix_addx_mem(m):
        i, src, dst, rest = m.group(1), m.group(2).strip(), m.group(3), m.group(4)
        return '%sMOVE.B  %s,D3\n%sADD.B   D3,%s%s\n' % (i, src, i, dst, rest)
    line = re.sub(r'^(\s*)ADDX\.B\s+([^#,\n][^,\n]*),(D\d)(.*)', fix_addx_mem, line)

    # Fix H: SUBX
    line = re.sub(r'\bSUBX\.B\s+(#\$[0-9A-Fa-f]+)', r'SUB.B  \1', line)
    line = re.sub(r'\bSUBX\.W\s+(#\$[0-9A-Fa-f]+)', r'SUB.W  \1', line)
    def fix_subx_mem(m):
        i, src, dst, rest = m.group(1), m.group(2).strip(), m.group(3), m.group(4)
        return '%sMOVE.B  %s,D3\n%sSUB.B   D3,%s%s\n' % (i, src, i, dst, rest)
    line = re.sub(r'^(\s*)SUBX\.B\s+([^#,\n][^,\n]*),(D\d)(.*)', fix_subx_mem, line)

    # Fix I: shifts on memory labels
    def fix_shift_mem(m):
        i, instr, count, label, rest = (m.group(1), m.group(2).upper(),
                                         m.group(3), m.group(4), m.group(5))
        if label.lower() in REGISTER_NAMES:
            return m.group(0)
        return ('%sMOVE.B  (%s).l,D3\n'
                '%s%s.B  %s,D3\n'
                '%sMOVE.B  D3,(%s).l%s\n') % (i, label, i, instr, count, i, label, rest)
    line = re.sub(
        r'^(\s*)(ROXL|ROXR|LSR|ASL|LSL|ROL|ROR)\.B\s+(#\d+),([a-zA-Z_][a-zA-Z0-9_]*)(.*)',
        fix_shift_mem, line, flags=re.IGNORECASE
    )
    line = re.sub(
        r'^(\s*)(ROXL|ROXR)\s+(#\d+),\(([a-zA-Z_][a-zA-Z0-9_]*)\)\.l(.*)',
        lambda m: ('%sMOVE.B  (%s).l,D3\n%s%s.B  %s,D3\n%sMOVE.B  D3,(%s).l%s\n') % (
            m.group(1), m.group(4), m.group(1), m.group(2),
            m.group(3), m.group(1), m.group(4), m.group(5)),
        line, flags=re.IGNORECASE
    )

    # Fix J: .DBYT → DC.W
    line = re.sub(r';\s*\[DIRECTIVE\]\s*\.DBYT\s+(\$[0-9A-Fa-f]+)', r'    DC.W \1', line)
    line = re.sub(r'^\s*\.DBYT\s+(\$[0-9A-Fa-f]+)', r'    DC.W \1', line)

    # Fix K: .INCBIN → INCBIN
    line = re.sub(r';\s*\[DIRECTIVE\]\s*\.INCBIN\s+"([^"]+)"', r'    INCBIN "\1"', line)
    line = re.sub(r'^\s*\.INCBIN\s+"([^"]+)"', r'    INCBIN "\1"', line)

    # Fix L: CON_xxx = $yy → EQU
    mm = re.match(r'^(\s*)(CON_[A-Z0-9_]+)\s*=\s*(\$[0-9A-Fa-f]+)(.*)', line, re.IGNORECASE)
    if mm:
        i, name, val, rest = mm.groups()
        line = '%s%s  EQU %s%s\n' % (i, name.upper(), val, rest)

    # Fix M: EOR.B <mem>,Dn → via temp
    mm = re.match(r'(\s*)EOR\.B\s+([^,\n]+),(D\d)(.*)', line)
    if mm:
        src = mm.group(2).strip()
        if not src.startswith('D') and not src.startswith('#'):
            i, dst, rest = mm.group(1), mm.group(3), mm.group(4)
            line = '%sMOVE.B  %s,D3\n%sEOR.B   D3,%s%s\n' % (i, src, i, dst, rest)

    # Fix N: INSTR.B #$xx ; !! UNRESOLVED comment,D0 → rescue destination from inside comment
    line = re.sub(
        r'^(\s*)(CMPI\.B|MOVE\.B|ANDI\.B|ORI\.B|EORI\.B|ADDI\.B|SUBI\.B)\s+(#\$[0-9A-Fa-f]+)\s*;[^,\n]*,(D\d).*',
        lambda m: '%s%s  %s,%s\n' % (m.group(1), m.group(2), m.group(3), m.group(4)),
        line, flags=re.IGNORECASE
    )

    # Fix O: MOVE.B (Dn),Dm → MOVEA.L Dn,A0 / MOVE.B (A0),Dm
    # 68000 register-indirect requires an address register, not a data register
    def fix_dn_indirect(m):
        indent, src_dn, dst = m.group(1), m.group(2), m.group(3)
        return '%sMOVEA.L %s,A0\n%sMOVE.B  (A0),%s\n' % (indent, src_dn, indent, dst)
    line = re.sub(
        r'^(\s*)MOVE\.B\s+\((D\d)\),(D\d)(.*)',
        fix_dn_indirect, line, flags=re.IGNORECASE
    )

    # Fix P: SUBQ.B/ADDQ.B #n,(base,Dn.L) → route through address register A0
    # 68000 does not support SUBQ/ADDQ to Dn-indexed memory
    def fix_q_dn_indexed(m):
        indent, instr, imm, base, dn = m.group(1), m.group(2).upper(), m.group(3), m.group(4), m.group(5)
        op = 'SUB' if 'SUB' in instr else 'ADD'
        return ('%sMOVEA.L %s,A0\n'
                '%sADDA.L  %s,A0\n'
                '%sMOVE.B  (A0),D3\n'
                '%s%s.B   %s,D3\n'
                '%sMOVE.B  D3,(A0)\n') % (indent, dn, indent, base, indent, indent, op, imm, indent)
    line = re.sub(
        r'^(\s*)(SUBQ|ADDQ)\.B\s+(#\d+),\((\$[0-9A-Fa-f]+),(D\d)\.L\)(.*)',
        fix_q_dn_indexed, line, flags=re.IGNORECASE
    )

    # Fix Q: MOVE.B ($FF0000,An,Dn.W),Dm — displacement too large for 68000 indexed mode
    def fix_large_disp_indexed_read(m):
        indent, disp, an, dn, size, dst = (m.group(1), m.group(2), m.group(3),
                                            m.group(4), m.group(5), m.group(6))
        return ('%sMOVEA.L %s,A0\n'
                '%sADDA.L  #%s,A0\n'
                '%sMOVE.B  (A0,%s.%s),%s\n') % (indent, an, indent, disp, indent, dn, size, dst)
    line = re.sub(
        r'^(\s*)MOVE\.B\s+\((\$[0-9A-Fa-f]{4,}),([Aa]\d),([Dd]\d)\.([WL])\),(D\d)(.*)',
        fix_large_disp_indexed_read, line, flags=re.IGNORECASE
    )

    def fix_large_disp_indexed_write(m):
        indent, src, disp, an, dn, size = (m.group(1), m.group(2), m.group(3),
                                            m.group(4), m.group(5), m.group(6))
        return ('%sMOVEA.L %s,A0\n'
                '%sADDA.L  #%s,A0\n'
                '%sMOVE.B  %s,(A0,%s.%s)\n') % (indent, an, indent, disp, indent, src, dn, size)
    line = re.sub(
        r'^(\s*)MOVE\.B\s+(D\d),\((\$[0-9A-Fa-f]{4,}),([Aa]\d),([Dd]\d)\.([WL])\)(.*)',
        fix_large_disp_indexed_write, line, flags=re.IGNORECASE
    )

    # Fix R: ANY instruction with label(Dn.L) or $addr(Dn.L) as source → route through A0
    # Covers MOVE.B, CMP.B, ADD.B, SUB.B, AND.B, OR.B etc.
    def fix_label_dn_src(m):
        indent, instr, label, dn, dst = m.group(1), m.group(2), m.group(3), m.group(4), m.group(5)
        return ('%sMOVEA.L #%s,A0\n'
                '%s%s  (A0,%s.L),%s\n') % (indent, label, indent, instr, dn, dst)
    line = re.sub(
        r'^(\s*)(\w+\.\w)\s+([a-zA-Z_\$][a-zA-Z0-9_]*)\((D\d)\.L\),(D\d)(.*)',
        fix_label_dn_src, line, flags=re.IGNORECASE
    )

    def fix_label_dn_dst(m):
        indent, instr, src, label, dn = m.group(1), m.group(2), m.group(3), m.group(4), m.group(5)
        return ('%sMOVEA.L #%s,A0\n'
                '%s%s  %s,(A0,%s.L)\n') % (indent, label, indent, instr, src, dn)
    line = re.sub(
        r'^(\s*)(\w+\.\w)\s+(D\d),([a-zA-Z_\$][a-zA-Z0-9_]*)\((D\d)\.L\)(.*)',
        fix_label_dn_dst, line, flags=re.IGNORECASE
    )

    # Fix S: MOVEA.W ($FF0000+ram_label).l,An → compute address properly
    # NES zero-page indirect: read 16-bit pointer from RAM, use as address
    # ram_label EQU values already include $FF0000 base, so we use #ram_label
    # directly as the pointer address. Do NOT add $FF0000 to An here — the
    # following MOVE.B ($FF0000,An,Dn.W) instruction (handled by Fix Q) will
    # provide the NES→68K address conversion.
    #
    # ENDIANNESS: NES stores pointers little-endian (low byte at $zp, high at
    # $zp+1). 68K MOVEA.W reads big-endian. Must byte-swap after reading.
    # Uses D5 as temp (designated temp register, not used by PPU functions).
    def fix_ff0000_movea(m):
        indent, label, an = m.group(1), m.group(2), m.group(3)
        return ('%sMOVEA.L #%s,A0\n'
                '%sMOVE.W  (A0),D5\n'
                '%sROL.W   #8,D5\n'
                '%sMOVEA.W D5,%s\n') % (indent, label, indent, indent, indent, an)
    line = re.sub(
        r'^(\s*)MOVEA\.W\s+\(\$FF0000\+([a-zA-Z_][a-zA-Z0-9_]*)\)\.l,([Aa]\d)(.*)',
        fix_ff0000_movea, line, flags=re.IGNORECASE
    )

    # Fix T: MOVE.B D0,(D3) — write to Dn-indirect → route through A0
    def fix_dn_indirect_write(m):
        indent, src, dn = m.group(1), m.group(2), m.group(3)
        return '%sMOVEA.L %s,A0\n%sMOVE.B  %s,(A0)\n' % (indent, dn, indent, src)
    line = re.sub(
        r'^(\s*)MOVE\.B\s+(D\d),\((D\d)\)(.*)',
        fix_dn_indirect_write, line, flags=re.IGNORECASE
    )

    # Fix U: MOVE.B src,($FF0000+$addr).l(Dn) — absolute+Dn indexed with large base
    # e.g. STA $0000,Y → MOVEA.L #$FF0000,A0 / ADDA.L Dn,A0 / MOVE.B src,($addr,A0)
    def fix_ff0000_abs_dn_write(m):
        indent, src, base, addr, dn = m.group(1), m.group(2), m.group(3), m.group(4), m.group(5)
        full_addr = int(base.lstrip('$'), 16) + int(addr.lstrip('$'), 16)
        return ('%sMOVEA.L #$%06X,A0\n'
                '%sADDA.L  %s,A0\n'
                '%sMOVE.B  %s,(A0)\n') % (indent, full_addr, indent, dn, indent, src)
    line = re.sub(
        r'^(\s*)MOVE\.B\s+(D\d),\((\$[0-9A-Fa-f]+)\+(\$[0-9A-Fa-f]+)\)\.l\((D\d)\.L\)(.*)',
        fix_ff0000_abs_dn_write, line, flags=re.IGNORECASE
    )

    def fix_ff0000_abs_dn_read(m):
        indent, base, addr, dn, dst = m.group(1), m.group(2), m.group(3), m.group(4), m.group(5)
        full_addr = int(base.lstrip('$'), 16) + int(addr.lstrip('$'), 16)
        return ('%sMOVEA.L #$%06X,A0\n'
                '%sADDA.L  %s,A0\n'
                '%sMOVE.B  (A0),%s\n') % (indent, full_addr, indent, dn, indent, dst)
    line = re.sub(
        r'^(\s*)MOVE\.B\s+\((\$[0-9A-Fa-f]+)\+(\$[0-9A-Fa-f]+)\)\.l\((D\d)\.L\),(D\d)(.*)',
        fix_ff0000_abs_dn_read, line, flags=re.IGNORECASE
    )


    # Fix W: PPU register accesses → BSR to VDP layer functions
    # The translator left these as MOVE.B Dn,PPU_REG_$2000 etc. which write to ROM.
    # We must rewrite them as BSR calls with D0 as the argument register.
    #
    # Write patterns:  MOVE.B Dn, PPU_REG_$20xx  → (move to D0 if needed) BSR PPU_WRITE_20xx
    # Read patterns:   MOVE.B PPU_REG_$2002, Dn  → BSR PPU_READ_2002 / MOVE.B D0,Dn
    #
    # All PPU functions use D0 as argument/return register per our vdp_layer.asm ABI.
    if 'PPU_REG_$' in line and 'NEEDS VDP TRANSLATION' in line:
        import re as _re
        stripped = line.strip()
        # Extract leading whitespace
        indent = line[:len(line) - len(line.lstrip())]

        # --- Write: MOVE.B Dn, PPU_REG_$20xx ---
        m = _re.match(r'\s*MOVE\.B\s+(D\d)\s*,\s*PPU_REG_\$(\w+)\s*;.*', line, _re.IGNORECASE)
        if m:
            src_reg = m.group(1).upper()
            ppu_reg = m.group(2).upper()
            ppu_map = {
                '2000': 'PPU_WRITE_2000',
                '2001': 'PPU_WRITE_2001',
                '2003': 'PPU_WRITE_2003',
                '2005': 'PPU_WRITE_2005',
                '2006': 'PPU_WRITE_2006',
                '2007': 'PPU_WRITE_2007',
            }
            fn = ppu_map.get(ppu_reg)
            if fn:
                comment = '; Fix W: PPU_REG_$%s write' % ppu_reg
                if src_reg == 'D0':
                    line = '%sBSR     %s  %s\n' % (indent, fn, comment)
                else:
                    line = '%sMOVE.B  %s,D0\n%sBSR     %s  %s\n' % (indent, src_reg, indent, fn, comment)

        # --- Write with D2 source: MOVE.B D2, PPU_REG_$20xx (STY case) ---
        m2 = _re.match(r'\s*MOVE\.B\s+(D\w+)\s*,\s*PPU_REG_\$(\w+)\s*;.*', line, _re.IGNORECASE)
        if m2 and 'BSR' not in line:
            src_reg = m2.group(1).upper()
            ppu_reg = m2.group(2).upper()
            ppu_map = {
                '2000': 'PPU_WRITE_2000', '2001': 'PPU_WRITE_2001',
                '2003': 'PPU_WRITE_2003', '2005': 'PPU_WRITE_2005',
                '2006': 'PPU_WRITE_2006', '2007': 'PPU_WRITE_2007',
            }
            fn = ppu_map.get(ppu_reg)
            if fn:
                comment = '; Fix W: PPU_REG_$%s write (from %s)' % (ppu_reg, src_reg)
                if src_reg == 'D0':
                    line = '%sBSR     %s  %s\n' % (indent, fn, comment)
                else:
                    line = '%sMOVE.B  %s,D0\n%sBSR     %s  %s\n' % (indent, src_reg, indent, fn, comment)

        # --- Read: MOVE.B PPU_REG_$2002, Dn ---
        m3 = _re.match(r'\s*MOVE\.B\s+PPU_REG_\$(\w+)\s*;[^,]*,(D\w+).*', line, _re.IGNORECASE)
        if m3:
            ppu_reg = m3.group(1).upper()
            dst_reg = m3.group(2).upper()
            read_map = {
                '2002': 'PPU_READ_2002',
                '2007': 'PPU_READ_2007',
            }
            fn = read_map.get(ppu_reg)
            if fn:
                comment = '; Fix W: PPU_REG_$%s read' % ppu_reg
                if dst_reg == 'D0':
                    line = '%sBSR     %s  %s\n' % (indent, fn, comment)
                else:
                    line = '%sBSR     %s  %s\n%sMOVE.B  D0,%s\n' % (indent, fn, comment, indent, dst_reg)

    # Fix V: NES hardware I/O addresses → Genesis equivalents
    # These are literal addresses that crash on Genesis (they map to ROM or wrong bus)
    # $4011 = NES APU DMC volume     → redirect to Genesis scratch RAM
    # $4015 = NES APU channel enable → redirect to Genesis scratch RAM
    # $4016 = NES joypad strobe      → redirect to Genesis joypad port
    # $4017 = NES APU frame counter  → redirect to scratch RAM
    # Match: MOVE.B src,$40xx or MOVE.B $40xx,dst (but not inside comments)
    if not line.strip().startswith(';'):
        import re as _re
        # Fix V: NES hardware addresses -> Genesis equivalents
        # Handle immediate context (#$40xx) separately from memory context ($40xx)
        nes_imm_map = [
            (r'#\$4011(?![0-9A-Fa-f])', '#$00FF8010'),
            (r'#\$4015(?![0-9A-Fa-f])', '#$00FF8011'),
            (r'#\$4016(?![0-9A-Fa-f])', '#$00A10003'),
            (r'#\$4017(?![0-9A-Fa-f])', '#$00FF8012'),
        ]
        nes_mem_map = [
            (r'\(\$4011\)(?!\.)', '($00FF8010).l'),
            (r'\(\$4015\)(?!\.)', '($00FF8011).l'),
            (r'\(\$4016\)(?!\.)', '($00A10003).l'),
            (r'\(\$4017\)(?!\.)', '($00FF8012).l'),
            (r'(?<!#)(?<!\()\$4011(?![0-9A-Fa-f])', '($00FF8010).l'),
            (r'(?<!#)(?<!\()\$4015(?![0-9A-Fa-f])', '($00FF8011).l'),
            (r'(?<!#)(?<!\()\$4016(?![0-9A-Fa-f])', '($00A10003).l'),
            (r'(?<!#)(?<!\()\$4017(?![0-9A-Fa-f])', '($00FF8012).l'),
        ]
        for pat, repl in nes_imm_map:
            line = _re.sub(pat, repl, line)
        for pat, repl in nes_mem_map:
            line = _re.sub(pat, repl, line)

    # ─── Fix X: Auto-fix empty translations ────────────────────────────
    # The translator left `; (empty translation for XXX)` stubs for NES
    # instructions it couldn't handle — mostly indexed addressing modes
    # like STA abs,X / LDA zp,X / INC abs,X / DEC zp,X / ROR zp,X etc.
    #
    # We parse the original NES opcode bytes from the comment and generate
    # correct 68K code. This fixes ~1000 stubs across all banks.
    #
    # 6502 register mapping: A→D0, X→D1, Y→D2, temp→D3
    # RAM base: $FF0000 (already in EQU labels)
    #
    # NES opcode → (operation, index_68k, data_68k, operand_bytes)
    #   index_68k: which 68K register holds the NES index (D1=X, D2=Y)
    #   data_68k:  which 68K register holds the NES data (D0=A, D1=X, D2=Y)

    NES_OPCODES = {
        # ── Loads ──
        0xBD: ('LDA', 'D1', 'D0', 2),  # LDA abs,X
        0xB9: ('LDA', 'D2', 'D0', 2),  # LDA abs,Y
        0xB5: ('LDA', 'D1', 'D0', 1),  # LDA zp,X
        0xBE: ('LDX', 'D2', 'D1', 2),  # LDX abs,Y
        0xBC: ('LDY', 'D1', 'D2', 2),  # LDY abs,X
        0xB6: ('LDX', 'D2', 'D1', 1),  # LDX zp,Y
        0xB4: ('LDY', 'D1', 'D2', 1),  # LDY zp,X
        # ── Stores ──
        0x9D: ('STA', 'D1', 'D0', 2),  # STA abs,X
        0x99: ('STA', 'D2', 'D0', 2),  # STA abs,Y
        0x95: ('STA', 'D1', 'D0', 1),  # STA zp,X
        0x96: ('STX', 'D2', 'D1', 1),  # STX zp,Y
        0x94: ('STY', 'D1', 'D2', 1),  # STY zp,X
        # ── Read-modify-write ──
        0xFE: ('INC', 'D1', None, 2),  # INC abs,X
        0xDE: ('DEC', 'D1', None, 2),  # DEC abs,X
        0xF6: ('INC', 'D1', None, 1),  # INC zp,X
        0xD6: ('DEC', 'D1', None, 1),  # DEC zp,X
        # ── Shifts/Rotates ──
        0x76: ('ROR', 'D1', None, 1),  # ROR zp,X
        0x36: ('ROL', 'D1', None, 1),  # ROL zp,X
        0x56: ('LSR', 'D1', None, 1),  # LSR zp,X
        0x16: ('ASL', 'D1', None, 1),  # ASL zp,X
        0x7E: ('ROR', 'D1', None, 2),  # ROR abs,X
        0x3E: ('ROL', 'D1', None, 2),  # ROL abs,X
        0x5E: ('LSR', 'D1', None, 2),  # LSR abs,X
        0x1E: ('ASL', 'D1', None, 2),  # ASL abs,X
    }

    m_empty = re.match(
        r'^(\s*); \(empty translation for (\w+)\)\s*;.*?:\s*'
        r'([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})(?:\s+([0-9A-Fa-f]{2}))?\s',
        line)
    if m_empty:
        indent = m_empty.group(1) or '    '
        nes_mnemonic = m_empty.group(2)
        opcode = int(m_empty.group(3), 16)
        byte1 = int(m_empty.group(4), 16)
        byte2_str = m_empty.group(5)
        byte2 = int(byte2_str, 16) if byte2_str else 0

        info = NES_OPCODES.get(opcode)
        if info:
            op, idx_reg, data_reg, operand_sz = info

            # Compute NES target address
            if operand_sz == 2:
                nes_addr = (byte2 << 8) | byte1  # little-endian
            else:
                nes_addr = byte1  # zero-page

            gen_addr = 0xFF0000 | nes_addr  # Genesis RAM address
            orig_comment = line.rstrip()

            if op in ('LDA', 'LDX', 'LDY'):
                # Load: MOVEA.L #$FFxxxx,A0 / MOVE.B (A0,Didx.L),Ddst
                line = (
                    '%sMOVEA.L #$%06X,A0  ; Fix X: %s\n'
                    '%sMOVE.B  (A0,%s.L),%s  %s\n'
                ) % (indent, gen_addr, orig_comment.strip(),
                     indent, idx_reg, data_reg, '; ^')

            elif op in ('STA', 'STX', 'STY'):
                # Store: MOVEA.L #$FFxxxx,A0 / MOVE.B Dsrc,(A0,Didx.L)
                line = (
                    '%sMOVEA.L #$%06X,A0  ; Fix X: %s\n'
                    '%sMOVE.B  %s,(A0,%s.L)  %s\n'
                ) % (indent, gen_addr, orig_comment.strip(),
                     indent, data_reg, idx_reg, '; ^')

            elif op == 'INC':
                # Increment: MOVEA.L / ADDQ.B #1,(A0,Didx.L)
                line = (
                    '%sMOVEA.L #$%06X,A0  ; Fix X: %s\n'
                    '%sADDQ.B  #1,(A0,%s.L)  %s\n'
                ) % (indent, gen_addr, orig_comment.strip(),
                     indent, idx_reg, '; ^')

            elif op == 'DEC':
                # Decrement: MOVEA.L / SUBQ.B #1,(A0,Didx.L)
                line = (
                    '%sMOVEA.L #$%06X,A0  ; Fix X: %s\n'
                    '%sSUBQ.B  #1,(A0,%s.L)  %s\n'
                ) % (indent, gen_addr, orig_comment.strip(),
                     indent, idx_reg, '; ^')

            elif op in ('ROR', 'ROL', 'LSR', 'ASL'):
                # Shift/Rotate: load to D3, shift, store back
                # 6502 ROR/ROL go through carry → use ROXR/ROXL
                # 6502 LSR/ASL are logical → use LSR/ASL
                shift_map = {
                    'ROR': 'ROXR.B  #1',
                    'ROL': 'ROXL.B  #1',
                    'LSR': 'LSR.B   #1',
                    'ASL': 'ASL.B   #1',
                }
                shift_instr = shift_map[op]
                line = (
                    '%sMOVEA.L #$%06X,A0  ; Fix X: %s\n'
                    '%sMOVE.B  (A0,%s.L),D3  ; ^ load\n'
                    '%s%s,D3  ; ^ %s\n'
                    '%sMOVE.B  D3,(A0,%s.L)  ; ^ store\n'
                ) % (indent, gen_addr, orig_comment.strip(),
                     indent, idx_reg,
                     indent, shift_instr, op.lower(),
                     indent, idx_reg)

    return line


def prescan_file(filepath):
    """
    Scan a file for known-bad patterns that fix_syntax hasn't handled yet
    and report them so we can see everything at once before vasm runs.
    """
    SUSPECT_PATTERNS = [
        (r'\(D\d\)\.l',              'Dn-indirect (needs An)'),
        (r'\(D\d\)',                  'Dn-indirect (needs An)'),
        (r'[a-zA-Z_]\w*\(D\d\.',     'label(Dn) addressing'),
        (r'\(\$[0-9A-Fa-f]{5,}',     'large displacement >4 hex digits'),
        (r'\bADDX\b',                 'ADDX instruction'),
        (r'\bSUBX\b',                 'SUBX instruction'),
        (r'#[><]\s*[^\$\d\s]',       '#>/#< with non-literal (unresolved)'),
        (r'\(\$[0-9A-Fa-f]{5,}[^)]*\)\.l\(D',  'large base + Dn indexed'),
        (r'MOVE\.B\s+#\$\w+\s*;[^,\n]*,D\d', 'comment-swallowed destination'),
    ]
    hits = []
    with open(filepath, 'r', encoding='utf-8') as f:
        for lineno, line in enumerate(f, 1):
            for pat, desc in SUSPECT_PATTERNS:
                if re.search(pat, line, re.IGNORECASE):
                    hits.append((lineno, desc, line.rstrip()))
    return hits


def fix_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # Step 1: prefix all local labels with bank-specific tag to avoid cross-file conflicts
    bank_prefix = make_bank_prefix(filepath)
    lines, prefix_count = prefix_labels_in_file(lines, bank_prefix)

    # Step 2: fix instruction syntax line by line
    fixed_lines = []
    fix_count = 0
    for line in lines:
        new_line = fix_line(line)
        if new_line != line:
            fix_count += 1
        fixed_lines.append(new_line)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.writelines(fixed_lines)

    return fix_count, prefix_count


if __name__ == '__main__':
    files = sorted(glob.glob("bank_*_gen68k_vdp.asm"))
    if not files:
        # fallback
        files = sorted(glob.glob("bank_*_vdp.asm"))
    if not files:
        print("No bank_*_vdp.asm files found!")
        exit(1)

    print("=" * 65)
    print("  SYNTAX FIX REPORT")
    print("=" * 65)
    total_fix = 0
    total_pre = 0
    for f in files:
        fix, pre = fix_file(f)
        total_fix += fix
        total_pre += pre
        print("  %-50s fixed=%4d  labels prefixed=%d" % (f, fix, pre))
    print("\n  Total lines fixed:         %d" % total_fix)
    print("  Total labels prefixed:     %d" % total_pre)

    # Pre-scan for remaining suspect patterns
    print("\n" + "=" * 65)
    print("  PRE-SCAN: REMAINING SUSPECT PATTERNS")
    print("=" * 65)
    total_suspects = 0
    for f in files:
        hits = prescan_file(f)
        if hits:
            print("\n  FILE: %s (%d hits)" % (f, len(hits)))
            for lineno, desc, line in hits[:20]:  # cap at 20 per file
                print("    line %4d [%s]" % (lineno, desc))
                print("             %s" % line[:100])
            total_suspects += len(hits)
    if total_suspects == 0:
        print("  No suspect patterns found — should assemble cleanly!")
    else:
        print("\n  Total suspect lines: %d" % total_suspects)

    print("\n  All done! Run build.bat now.")
