#!/bin/bash

PREV_TOTAL=0
PREV_IDLE=0

if [[ -f /tmp/cpu_prev ]]; then
  read PREV_TOTAL PREV_IDLE </tmp/cpu_prev
fi

CPU=($(head -n1 /proc/stat))
IDLE=${CPU[4]}
TOTAL=0

for VALUE in "${CPU[@]:1}"; do
  TOTAL=$((TOTAL + VALUE))
done

DIFF_TOTAL=$((TOTAL - PREV_TOTAL))
DIFF_IDLE=$((IDLE - PREV_IDLE))
DIFF_USAGE=$(((100 * (DIFF_TOTAL - DIFF_IDLE)) / DIFF_TOTAL))

echo "${DIFF_USAGE}%"

echo "$TOTAL $IDLE" >/tmp/cpu_prev
