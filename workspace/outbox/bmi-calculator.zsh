#!/usr/bin/env zsh
# BMI calculator — accepts height(cm) and weight(kg) as arguments,
# or prompts interactively for whichever one is missing.

height_cm="$1"
weight_kg="$2"

# Prompt only for values not already given as arguments
if [[ -z "$height_cm" ]]; then
    read "height_cm?Height in cm: "
fi
if [[ -z "$weight_kg" ]]; then
    read "weight_kg?Weight in kg: "
fi

if [[ -z "$height_cm" || -z "$weight_kg" ]]; then
    echo "Error: height and weight are required." >&2
    exit 1
fi

# Accept only positive integers/decimals (no sign)
is_positive_number() {
    [[ "$1" =~ ^[0-9]+(\.[0-9]+)?$ ]] && (( $1 > 0 ))
}

if ! is_positive_number "$height_cm" || ! is_positive_number "$weight_kg"; then
    echo "Error: height and weight must be positive numbers." >&2
    exit 1
fi

# Convert cm to m, then BMI = kg / m^2 (native zsh float arithmetic)
(( height_m = height_cm / 100.0 ))
(( bmi = weight_kg / (height_m * height_m) ))
bmi_rounded=$(printf "%.1f" "$bmi")

if (( bmi < 18.5 )); then
    category="underweight (過輕)"
elif (( bmi < 25.0 )); then
    category="normal (正常)"
elif (( bmi < 30.0 )); then
    category="overweight (過重)"
else
    category="obese (肥胖)"
fi

echo "BMI: $bmi_rounded"
echo "Category: $category"
