#!/usr/bin/env zsh
# BMI calculator — accepts height(cm) and weight(kg) as arguments,
# or prompts interactively for whichever one is missing.
# v3: adds a language toggle for English / Traditional Chinese output.
# Usage: ./bmi-calculator-v3.zsh [height_cm] [weight_kg] [en|zh|both]
# Lang can also come from $BMI_LANG; the 3rd argument wins if both are set.
# Default: both.

height_cm="$1"
weight_kg="$2"
lang="${3:-${BMI_LANG:-both}}"

case "$lang" in
    en|zh|both) ;;
    *)
        echo "Error: language must be en, zh, or both. / 錯誤：語言必須為 en、zh 或 both。" >&2
        exit 1
        ;;
esac

# Prompt only for values not already given as arguments
if [[ -z "$height_cm" ]]; then
    read "height_cm?Height in cm / 身高（公分）: "
fi
if [[ -z "$weight_kg" ]]; then
    read "weight_kg?Weight in kg / 體重（公斤）: "
fi

if [[ -z "$height_cm" || -z "$weight_kg" ]]; then
    case "$lang" in
        en)   echo "Error: height and weight are required." >&2 ;;
        zh)   echo "錯誤：身高和體重為必填。" >&2 ;;
        both) echo "Error: height and weight are required. / 錯誤：身高和體重為必填。" >&2 ;;
    esac
    exit 1
fi

# Accept only positive integers/decimals (no sign)
is_positive_number() {
    [[ "$1" =~ ^[0-9]+(\.[0-9]+)?$ ]] && (( $1 > 0 ))
}

if ! is_positive_number "$height_cm" || ! is_positive_number "$weight_kg"; then
    case "$lang" in
        en)   echo "Error: height and weight must be positive numbers." >&2 ;;
        zh)   echo "錯誤：身高和體重必須為正數。" >&2 ;;
        both) echo "Error: height and weight must be positive numbers. / 錯誤：身高和體重必須為正數。" >&2 ;;
    esac
    exit 1
fi

# Convert cm to m, then BMI = kg / m^2 (native zsh float arithmetic)
(( height_m = height_cm / 100.0 ))
(( bmi = weight_kg / (height_m * height_m) ))
bmi_rounded=$(printf "%.1f" "$bmi")

if (( bmi < 18.5 )); then
    category_en="underweight"; category_zh="過輕"
elif (( bmi < 25.0 )); then
    category_en="normal"; category_zh="正常"
elif (( bmi < 30.0 )); then
    category_en="overweight"; category_zh="過重"
else
    category_en="obese"; category_zh="肥胖"
fi

case "$lang" in
    en)
        echo "BMI: $bmi_rounded"
        echo "Category: $category_en"
        ;;
    zh)
        echo "BMI 指數：$bmi_rounded"
        echo "分類：$category_zh"
        ;;
    both)
        echo "BMI: $bmi_rounded"
        echo "Category / 分類: $category_en / $category_zh"
        ;;
esac
