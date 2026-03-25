#!/usr/bin/env python3
"""
show_scores.py - Display and manage the build score ledger.

Usage:
    python show_scores.py                       # Show all scores
    python show_scores.py --add 599 85 "note"   # Add/update entry
    python show_scores.py --best 5              # Show top 5 builds
    python show_scores.py --recent 10           # Show last 10 builds
"""

import argparse
import csv
import os
import sys
from datetime import datetime

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)
LEDGER_PATH = os.path.join(PROJECT_ROOT, "artifacts", "score_ledger.csv")

FIELDS = ["version", "date", "static_score", "notes"]


def read_ledger():
    """Read ledger, return list of dicts."""
    if not os.path.isfile(LEDGER_PATH):
        return []
    with open(LEDGER_PATH, 'r', newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        rows = []
        for row in reader:
            row['version'] = int(row['version'])
            row['static_score'] = int(row['static_score']) if row['static_score'] else 0
            rows.append(row)
    return rows


def write_ledger(rows):
    """Write ledger back to CSV."""
    with open(LEDGER_PATH, 'w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=FIELDS)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def add_entry(version, static_score, notes=""):
    """Add or update an entry in the ledger."""
    rows = read_ledger()
    today = datetime.now().strftime("%Y-%m-%d")

    # Check if version exists
    for row in rows:
        if row['version'] == version:
            row['static_score'] = static_score
            row['date'] = today
            if notes:
                row['notes'] = notes
            write_ledger(rows)
            return False  # updated

    rows.append({
        'version': version,
        'date': today,
        'static_score': static_score,
        'notes': notes,
    })
    rows.sort(key=lambda r: r['version'])
    write_ledger(rows)
    return True  # new entry


def display_table(rows, title="Build Score Ledger"):
    """Print rows as a formatted table."""
    if not rows:
        print("No entries in ledger.")
        return

    print(f"\n{'=' * 70}")
    print(f"  {title}")
    print(f"{'=' * 70}")
    print(f"  {'Ver':>5}  {'Date':>10}  {'Score':>6}  {'Notes'}")
    print(f"  {'-'*5}  {'-'*10}  {'-'*6}  {'-'*40}")

    prev_score = None
    for row in rows:
        score = row['static_score']
        # Regression marker
        marker = ""
        if prev_score is not None and score < prev_score:
            marker = " << REGRESSION"
        elif prev_score is not None and score > prev_score:
            marker = " +"

        notes = row.get('notes', '')
        if len(notes) > 40:
            notes = notes[:37] + "..."

        print(f"  v{row['version']:>4}  {row['date']:>10}  {score:>6}  "
              f"{notes}{marker}")
        prev_score = score

    print(f"{'=' * 70}\n")


def main():
    parser = argparse.ArgumentParser(description="Build score ledger viewer")
    parser.add_argument('--add', nargs=3, metavar=('VER', 'SCORE', 'NOTES'),
                       help='Add/update entry: version score "notes"')
    parser.add_argument('--best', type=int, metavar='N',
                       help='Show top N builds by score')
    parser.add_argument('--recent', type=int, metavar='N',
                       help='Show most recent N builds')
    args = parser.parse_args()

    if args.add:
        ver, score, notes = int(args.add[0]), int(args.add[1]), args.add[2]
        is_new = add_entry(ver, score, notes)
        action = "Added" if is_new else "Updated"
        print(f"{action} v{ver}: score={score}")
        return

    rows = read_ledger()

    if args.best:
        rows.sort(key=lambda r: r['static_score'], reverse=True)
        rows = rows[:args.best]
        display_table(rows, f"Top {args.best} Builds by Score")
    elif args.recent:
        rows.sort(key=lambda r: r['version'])
        rows = rows[-args.recent:]
        display_table(rows, f"Last {args.recent} Builds")
    else:
        rows.sort(key=lambda r: r['version'])
        display_table(rows)


if __name__ == "__main__":
    main()
