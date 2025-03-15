#!/bin/bash
# frag_monitor.sh - RAM Monitoring & Logging

LOG_FILE="./logs/fragment.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

TOTAL_MEM=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
AVAIL_MEM=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
USED_MEM=$((TOTAL_MEM - AVAIL_MEM))

# Hitung usage dengan 2 angka desimal
FRAG_USAGE=$(awk -v used="$USED_MEM" -v total="$TOTAL_MEM" 'BEGIN { usage = (100*used)/total; printf "%.2f", usage }')

echo "$TIMESTAMP - Fragment Usage [$FRAG_USAGE%] - Fragment Count [$USED_MEM KB] - Details [Total: $TOTAL_MEM KB, Available: $AVAIL_MEM KB]" >> "$LOG_FILE"
