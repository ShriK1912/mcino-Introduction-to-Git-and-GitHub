#!/bin/bash
set -e

command -v bc >/dev/null 2>&1 || {
    printf 'Error: bc is required to calculate simple interest.\n' >&2
    exit 1
}

printf 'Enter the principal: '
IFS= read -r principal
printf 'Enter rate of interest per year: '
IFS= read -r rate
printf 'Enter time period in years: '
IFS= read -r time

interest=$(printf 'scale=2; (%s * %s * %s) / 100\n' "$principal" "$rate" "$time" | bc)
printf 'Simple interest: %s\n' "$interest"
