import argparse
import re
from pathlib import Path


MARK_BEGIN = "; AUTO-RESTORED TITLE DATA BEGIN"
MARK_END = "; AUTO-RESTORED TITLE DATA END"


CORE_LABELS = [
    "tbl_90EE_spr_data:",
    "tbl_915E:",
    "tbl_94AD_demo_manual_text:",
    "tbl_94EE_logo_palette:",
]

EXTENDED_ONLY_LABELS = [
    "tbl_9240:",
    "tbl_9256:",
    "tbl_9268_pos_X_44:",
    "tbl_9269_pos_X_AC:",
    "tbl_926A_spr_T:",
    "tbl_9282_spr_A:",
]

TEXT_PAYLOAD_LABELS = [
    "_off002_929A_00_all_of_treasures:",
    "_off002_92BC_01_heart___container:",
    "_off002_92D1_02_heart:",
    "_off002_92D8_03_fairy___clock:",
    "_off002_92EC_04_rupy___5_rupies:",
    "_off002_9301_07_sword___white:",
    "_off002_9315_08_sword:",
    "_off002_931C_09_magical___magical:",
    "_off002_9332_0A_sword_shield:",
    "_off002_9347_0B_boomerang___magical:",
    "_off002_935E_0C_boomerang:",
    "_off002_9369_0D_bomb___bow:",
    "_off002_937C_0E_arrow___silver:",
    "_off002_9391_0F_arrow:",
    "_off002_9398_10_blue___red:",
    "_off002_93AB_11_candle___candle:",
    "_off002_93C1_12_blue___red:",
    "_off002_93D4_13_ring___ring:",
    "_off002_93E8_14_power___recorder:",
    "_off002_93FE_15_bracelet:",
    "_off002_9408_16_raft___stepladder:",
    "_off002_941F_17_magical___book_of:",
    "_off002_9435_18_rod___magic:",
    "_off002_9448_19_key___magical:",
    "_off002_945C_1A_key:",
    "_off002_9461_1B_map___compass:",
    "_off002_9475_1C_triforce:",
    "_off002_947F_05_life_potion___2nd_potion:",
    "_off002_9499_06_letter___food:",
]


LABEL_RE = re.compile(r"^[A-Za-z0-9_\.]+:\s*(;.*)?$")


def parse_byte_expr(expr: str) -> int:
    total = 0
    for part in expr.split("+"):
        part = part.strip()
        if not part:
            continue
        if not part.startswith("$"):
            raise ValueError(f"unsupported .BYTE token: {expr!r}")
        total += int(part[1:], 16)
    return total & 0xFF


def cleanup_existing_auto_block(lines, start_index):
    idx = start_index + 1
    while idx < len(lines):
        stripped = lines[idx].strip()
        if LABEL_RE.match(stripped):
            break
        if stripped == MARK_BEGIN:
            end = idx + 1
            while end < len(lines) and lines[end].strip() != MARK_END:
                end += 1
            if end < len(lines):
                end += 1
            del lines[idx:end]
            continue
        idx += 1
    return lines


def collect_directive_lines(lines, label_index):
    out = []
    idx = label_index + 1
    while idx < len(lines):
        stripped = lines[idx].strip()
        if LABEL_RE.match(stripped):
            break
        if stripped.startswith("; [DIRECTIVE]") or stripped.startswith("; !! UNKNOWN: .DBYT"):
            out.append(stripped)
        idx += 1
    return out


def convert_directive_block(label, directive_lines):
    data_lines = [MARK_BEGIN]
    byte_values = []
    word_values = []
    for line in directive_lines:
        if line.startswith("; !! UNKNOWN: .DBYT"):
            m = re.search(r"\.DBYT\s+(\$[0-9A-Fa-f]{4})", line)
            if not m:
                raise ValueError(f"failed to parse DBYT in {label}: {line}")
            value = int(m.group(1)[1:], 16)
            byte_values.extend([(value >> 8) & 0xFF, value & 0xFF])
            continue

        m = re.search(r"\.BYTE\s+(.+?)\s+-- needs manual handling", line)
        if m:
            values = [parse_byte_expr(expr.strip()) for expr in m.group(1).split(",")]
            byte_values.extend(values)
            continue

        m = re.search(r"\.WORD\s+([A-Za-z0-9_\.]+)\s+-- needs manual handling", line)
        if m:
            raw = re.search(r"orig:.*?:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})\s+\.word", line)
            if raw:
                byte_values.extend([int(raw.group(1), 16), int(raw.group(2), 16)])
            else:
                word_values.append(m.group(1))
            continue

        raise ValueError(f"unsupported directive in {label}: {line}")

    for i in range(0, len(word_values), 4):
        chunk = ",".join(word_values[i:i + 4])
        data_lines.append(f"    DC.W {chunk}")
    for i in range(0, len(byte_values), 16):
        chunk = ",".join(f"${value:02X}" for value in byte_values[i:i + 16])
        data_lines.append(f"    DC.B {chunk}")
    total_bytes = len(byte_values) + (2 * len(word_values))
    if total_bytes & 1:
        # Keep following code labels word-aligned for 68000 fetches.
        data_lines.append("    EVEN")
    data_lines.append(MARK_END)
    return data_lines


def restore_labels(path: Path, labels):
    lines = path.read_text(encoding="utf-8").splitlines()
    label_to_index = {}
    for idx, line in enumerate(lines):
        stripped = line.strip()
        for label in labels:
            if stripped.startswith(label):
                label_to_index[label] = idx
    missing = [label for label in labels if label not in label_to_index]
    if missing:
        raise SystemExit(f"missing labels: {missing}")

    for label, idx in sorted(label_to_index.items(), key=lambda item: item[1], reverse=True):
        lines = cleanup_existing_auto_block(lines, idx)
        directives = collect_directive_lines(lines, idx)
        auto_block = convert_directive_block(label, directives)
        insert_at = idx + 1
        for item in reversed(auto_block):
            lines.insert(insert_at, item)

    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("path", nargs="?", default="src/banks/generated_vdp/bank_02_gen68k_vdp.asm")
    parser.add_argument("--profile", choices=["core", "extended", "text", "full"], default="core")
    args = parser.parse_args()

    labels = []
    if args.profile in ("core", "extended", "full"):
        labels.extend(CORE_LABELS)
    if args.profile in ("extended", "full"):
        labels.extend(EXTENDED_ONLY_LABELS)
    if args.profile in ("text", "full"):
        labels.extend(TEXT_PAYLOAD_LABELS)

    restore_labels(Path(args.path), labels)
    print(f"restored {args.profile} bank-02 title tables in {args.path}")


if __name__ == "__main__":
    main()

