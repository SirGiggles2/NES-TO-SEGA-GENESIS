from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path


REPORT_RE = re.compile(r"diag_report_v(\d+)\.txt$", re.IGNORECASE)
SCORE_RE = re.compile(r"Score:\s+(\d+)\s+PASS\s+/\s+(\d+)\s+FAIL\s+/\s+(\d+)\s+WARN", re.IGNORECASE)
NMI_RE = re.compile(r"NMI completion count:\s+(\d+)", re.IGNORECASE)
PC_RE = re.compile(r"PC range observed:\s+\$([0-9A-F]+)\s+-\s+\$([0-9A-F]+)", re.IGNORECASE)


@dataclass
class Row:
    version: int
    passes: int
    fails: int
    warns: int
    nmi: int
    display: bool
    rendering: bool
    stuck: bool
    pc_low: str
    pc_high: str

    @property
    def score(self) -> int:
        return self.passes - (self.fails * 2)


def parse_report(path: Path) -> Row | None:
    match = REPORT_RE.search(path.name)
    if not match:
        return None
    text = path.read_text(encoding="utf-8", errors="replace")

    score_match = SCORE_RE.search(text)
    nmi_match = NMI_RE.search(text)
    pc_match = PC_RE.search(text)
    if not score_match or not nmi_match or not pc_match:
        return None

    passes, fails, warns = (int(score_match.group(i)) for i in range(1, 4))
    nmi = int(nmi_match.group(1))
    display = "PASS  VDP display enabled" in text
    rendering = "PASS  Rendering enabled" in text
    stuck = "FAIL  CPU STUCK" in text

    return Row(
        version=int(match.group(1)),
        passes=passes,
        fails=fails,
        warns=warns,
        nmi=nmi,
        display=display,
        rendering=rendering,
        stuck=stuck,
        pc_low=f"${pc_match.group(1)}",
        pc_high=f"${pc_match.group(2)}",
    )


def build_mermaid(rows: list[Row]) -> str:
    x_axis = ", ".join(f'"v{row.version}"' for row in rows)
    health = ", ".join(str(row.score) for row in rows)
    nmi = ", ".join(str(row.nmi) for row in rows)

    return "\n".join(
        [
            "```mermaid",
            'xychart-beta',
            '    title "Zelda Genesis Port Progress by Build"',
            f"    x-axis [{x_axis}]",
            '    y-axis "Health Score" 0 --> 12',
            f"    bar \"Score (PASS - 2*FAIL)\" [{health}]",
            f"    line \"NMI completions\" [{nmi}]",
            "```",
        ]
    )


def build_table(rows: list[Row]) -> str:
    lines = [
        "| Build | PASS | FAIL | WARN | Score | NMI | Display | Render | Stuck | PC range |",
        "| --- | ---: | ---: | ---: | ---: | ---: | :---: | :---: | :---: | --- |",
    ]
    for row in rows:
        lines.append(
            f"| v{row.version} | {row.passes} | {row.fails} | {row.warns} | {row.score} | {row.nmi} | "
            f"{'Y' if row.display else 'N'} | {'Y' if row.rendering else 'N'} | {'Y' if row.stuck else 'N'} | "
            f"{row.pc_low}-{row.pc_high} |"
        )
    return "\n".join(lines)


def build_summary(rows: list[Row]) -> str:
    best_score = max(rows, key=lambda row: (row.score, row.nmi, row.version))
    best_nmi = max(rows, key=lambda row: (row.nmi, row.score, row.version))
    display_rows = [row for row in rows if row.display]
    first_display = min(display_rows, key=lambda row: row.version) if display_rows else None

    lines = [
        "# Zelda Progress Chart",
        "",
        f"- Reports parsed: `{len(rows)}`",
        f"- Best overall score: `v{best_score.version}` (`score={best_score.score}`, `nmi={best_score.nmi}`)",
        f"- Highest NMI activity: `v{best_nmi.version}` (`nmi={best_nmi.nmi}`, `score={best_nmi.score}`)",
    ]
    if first_display:
        lines.append(f"- First build with `VDP display enabled`: `v{first_display.version}`")
    lines.extend(["", "## Chart", "", build_mermaid(rows), "", "## Per-Build Table", "", build_table(rows), ""])
    return "\n".join(lines)


def main() -> None:
    repo_root = Path(__file__).resolve().parents[1]
    reports_dir = repo_root / "diag" / "reports"
    out_path = reports_dir / "diag_progress.md"

    rows_by_version: dict[int, Row] = {}
    for path in reports_dir.glob("diag_report_v*.txt"):
        row = parse_report(path)
        if row is not None:
            rows_by_version[row.version] = row

    rows = sorted(rows_by_version.values(), key=lambda row: row.version)
    if not rows:
        raise SystemExit("No parseable diag reports found.")

    out_path.write_text(build_summary(rows), encoding="utf-8")
    print(out_path)


if __name__ == "__main__":
    main()
