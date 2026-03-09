import re
import json
import sys

def read_value(pattern, text):
    m = re.search(pattern, text)
    if m:
        return m.group(1)
    return None


def classify_diag(path):

    with open(path, "r") as f:
        text = f.read()

    result = {}

    result["pass"] = int(read_value(r"PASS:\s*(\d+)", text) or 0)
    result["fail"] = int(read_value(r"FAIL:\s*(\d+)", text) or 0)
    result["warn"] = int(read_value(r"WARN:\s*(\d+)", text) or 0)

    result["stuck_pc"] = read_value(r"stuck PC.*\$(\w+)", text)
    result["exception"] = bool(re.search(r"exception handler", text, re.I))

    result["vram_nonzero"] = bool(re.search(r"VRAM.*non.?zero", text, re.I))
    result["cram_nonzero"] = bool(re.search(r"CRAM.*non.?zero", text, re.I))

    result["nmi_completed"] = bool(re.search(r"NMI.*complete", text, re.I))

    result["script_changed"] = bool(re.search(r"ram_script.*changed", text, re.I))
    result["ppu_load_changed"] = bool(re.search(r"ppu_load_index.*changed", text, re.I))

    return result


if __name__ == "__main__":

    path = sys.argv[1]

    r = classify_diag(path)

    print(json.dumps(r, indent=2))