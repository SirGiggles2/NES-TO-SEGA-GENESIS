import json
import sys


def score(result):

    score = 0

    if result["pass"] > 0:
        score += result["pass"] * 10

    if result["fail"] > 0:
        score -= result["fail"] * 20

    if result["exception"]:
        score -= 100

    if result["vram_nonzero"]:
        score += 40

    if result["cram_nonzero"]:
        score += 30

    if result["nmi_completed"]:
        score += 30

    if result["script_changed"]:
        score += 20

    if result["ppu_load_changed"]:
        score += 20

    return score


if __name__ == "__main__":

    data = json.load(sys.stdin)

    print(score(data))
