import subprocess
import json
import os
import shutil

VARIANT_DIR = "experiments/generated"
ARTIFACT_DIR = "artifacts/overnight"


def run_build(variant):

    build_dir = f"build_{variant}"

    if os.path.exists(build_dir):
        shutil.rmtree(build_dir)

    shutil.copytree(".", build_dir)

    shutil.copy(
        f"{VARIANT_DIR}/{variant}.asm",
        f"{build_dir}/src/bridge/vdp_layer.asm"
    )

    subprocess.run(["build.bat"], cwd=build_dir)

    subprocess.run(["lua", "diag/zelda_diag.lua"], cwd=build_dir)

    diag = f"{build_dir}/diag_report.txt"

    out = subprocess.check_output(
        ["python", "../tools/classify_diag.py", diag],
        cwd=build_dir
    )

    result = json.loads(out)

    score = subprocess.check_output(
        ["python", "../tools/score_build.py"],
        input=json.dumps(result).encode()
    )

    return int(score)


def main():

    variants = os.listdir(VARIANT_DIR)

    results = []

    for v in variants:

        name = v.replace(".asm", "")

        print("Testing", name)

        s = run_build(name)

        results.append((name, s))

    results.sort(key=lambda x: x[1], reverse=True)

    print("\nRESULTS\n")

    for r in results:
        print(r[0], r[1])


if __name__ == "__main__":
    main()