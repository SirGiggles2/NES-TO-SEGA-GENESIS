# Debugging Workflow

Goal: turn every build into a measurable result.

---

# Standard Loop

1. start from stable baseline
2. create experiment branch
3. change one behavior
4. build ROM
5. run BizHawk
6. run diag script
7. save artifacts
8. classify result

---

# Artifacts to Save

Every build should produce:

- build log
- ROM
- diag report
- screenshots
- classification

---

# Classification Types


early_crash
vblank_dead
late_guard_loop
script_entered
visible_draw_started
regression
same_as_baseline
better_than_baseline


---

# Variables To Watch

Always capture:


ram_script
ram_subscript
ram_ppu_load_index
ram_005C
ram_for_2000
ram_for_2001
VRAM nonzero words
CRAM nonzero colors


---

# Loop Debugging Strategy

When stuck:

1. identify PC
2. identify condition
3. identify RAM reads
4. identify writer routine
5. prove whether it ran