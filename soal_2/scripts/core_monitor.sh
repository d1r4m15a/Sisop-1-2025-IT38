#!/bin/bash
# core_monitor.sh - CPU Monitoring & Logging

LOG_FILE="../logs/core.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

CORE_MODEL=$(lscpu | awk -F ': ' '/Model name/ {gsub(/^[ \t]+/, "", $2); print $2}')
PREV_IDLE=$(awk '/^cpu / {print $5}' /proc/stat)
PREV_TOTAL=$(awk '/^cpu / {sum=0; for (i=2; i<=8; i++) sum+=$i; print sum}' /proc/stat)
sleep 1
IDLE=$(awk '/^cpu / {print $5}' /proc/stat)
TOTAL=$(awk '/^cpu / {sum=0; for (i=2; i<=8; i++) sum+=$i; print sum}' /proc/stat)
DIFF_IDLE=$((IDLE - PREV_IDLE))
DIFF_TOTAL=$((TOTAL - PREV_TOTAL))

# Hitung usage dengan 5 angka desimal
CORE_USAGE=$(awk -v total="$DIFF_TOTAL" -v idle="$DIFF_IDLE" 'BEGIN { usage = (100*(total-idle))/total; printf "%.5f", usage }')
CORE_USAGE=$(echo "$CORE_USAGE" | sed -e 's/0*$//' -e 's/\.$//')

echo "$TIMESTAMP - Core Usage [$CORE_USAGE%] - Terminal Model [$CORE_MODEL]" >> "$LOG_FILE"
