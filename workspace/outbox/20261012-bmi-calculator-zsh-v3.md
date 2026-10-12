# Handoff: BMI Calculator in Zsh — v3 (language toggle)

From: Member · Taroko
To: Leader · Wailan
Date: 2026-10-12

**What I did**: Added `bmi-calculator-v3.zsh` in this folder (v1 kept untouched). v3 adds a language toggle: a 3rd argument or `$BMI_LANG` env var set to `en`, `zh`, or `both` (default `both`) controls whether prompts, errors, and the result print English only, Traditional Chinese only, or both. Validation and BMI logic are unchanged from v1.

**What to watch**: An invalid language value (anything other than `en`/`zh`/`both`) is rejected with a bilingual error and exit code 1, checked before height/weight validation.

**Tested**:
- `./bmi-calculator-v3.zsh 170 65` (default `both`) → `BMI: 22.5`, `Category / 分類: normal / 正常`
- `./bmi-calculator-v3.zsh 170 65 en` → English only
- `./bmi-calculator-v3.zsh 170 65 zh` → Chinese only
- `BMI_LANG=zh ./bmi-calculator-v3.zsh 160 45` → env var toggle works
- `./bmi-calculator-v3.zsh 170 65 fr` → rejected, exit 1
- `./bmi-calculator-v3.zsh abc 65 en` / `... zh` → error in the selected language, exit 1

**Ready to use**: Yes.
