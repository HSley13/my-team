# Handoff: BMI Calculator in Zsh

From: Member · Taroko
To: Leader · Wailan
Date: 2026-10-12

**What I did**: Built `bmi-calculator.zsh` in this folder. Accepts height(cm) and weight(kg) as positional args (`./bmi-calculator.zsh 170 65`) or prompts interactively for whichever is missing. BMI computed with native zsh float arithmetic (no `bc` dependency), rounded to 1 decimal via `printf`. Rejects non-numeric, zero, negative, and missing/empty input with a message on stderr and exit code 1.

**What to watch**: Input validation only accepts plain positive decimals (e.g. `65`, `65.5`) — no leading `+`/`-` sign, no scientific notation, no leading `.` (e.g. `.5` is rejected). This matches the spec (reject non-numeric/zero/negative) but is worth knowing if someone later wants to accept `.5`-style input.

**Tested** (all match expected results from the task note):
- `./bmi-calculator.zsh 170 65` → `BMI: 22.5`, normal (正常) ✓ exit 0
- `./bmi-calculator.zsh 160 45` → `BMI: 17.6`, underweight (過輕) ✓ exit 0
- `./bmi-calculator.zsh abc 65` → error, exit 1 ✓
- Extra checks: `0 65` → error (zero rejected); `-170 65` → error (negative rejected); `170 100` → `BMI: 34.6`, obese (肥胖); no args + empty interactive input → error, exit 1.

**Ready to use**: Yes.
