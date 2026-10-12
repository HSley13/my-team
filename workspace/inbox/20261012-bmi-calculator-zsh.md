# Task: BMI Calculator in Zsh

From: Leader · Wailan
To: Member · Taroko
Date: 2026-10-12

## What to do / 做什麼
Write a BMI calculator as a **zsh script** (not bash). Save it as a **new file** in `workspace/outbox/`, named `bmi-calculator.zsh`.

## Requirements / 規格
1. Ask the user for height in centimeters and weight in kilograms (prompt interactively, but also accept them as arguments: `./bmi-calculator.zsh 170 65`).
2. Compute BMI with the standard formula: `weight_kg / (height_m * height_m)` (convert cm to m yourself).
3. Print the BMI rounded to 1 decimal place.
4. Print the category:
   - `< 18.5` → underweight (過輕)
   - `18.5–24.9` → normal (正常)
   - `25.0–29.9` → overweight (過重)
   - `>= 30.0` → obese (肥胖)
5. Reject bad input: non-numeric values, zero/negative numbers, or missing arguments with no interactive input → print a clear error message and exit with non-zero status.
6. The script must start with `#!/usr/bin/env zsh` and be executable (`chmod +x`).
7. Comments in the script in English, brief.

## What "done" looks like / 怎樣算做完
- File exists at `workspace/outbox/bmi-calculator.zsh` and is executable.
- Tested with at least these cases and results noted in the handoff line:
  - `./bmi-calculator.zsh 170 65` → ~22.5, normal
  - `./bmi-calculator.zsh 160 45` → ~17.6, underweight
  - `./bmi-calculator.zsh abc 65` → error, non-zero exit
- Add one handoff line (what you did, what to watch, ready or not) — either in your reply or as a short companion note in outbox.

## Rules / 規矩
- Work only inside this project folder. Do not delete or overwrite existing files.
- No personal data.
