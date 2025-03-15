#!/bin/bash
# core_monitor.sh - Real-time Core (CPU) Monitoring.

timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

get_core_usage() {
    CORE_MODEL=$(lscpu | awk -F ': ' '/Model name/ {gsub(/^[ \t]+/, "", $2); print $2}')
    PREV_IDLE=$(awk '/^cpu / {print $5}' /proc/stat)
    PREV_TOTAL=$(awk '/^cpu / {sum=0; for (i=2; i<=8; i++) sum+=$i; print sum}' /proc/stat)
    sleep 1
    IDLE=$(awk '/^cpu / {print $5}' /proc/stat)
    TOTAL=$(awk '/^cpu / {sum=0; for (i=2; i<=8; i++) sum+=$i; print sum}' /proc/stat)
    DIFF_IDLE=$((IDLE - PREV_IDLE))
    DIFF_TOTAL=$((TOTAL - PREV_TOTAL))
    
    # Hitung usage dengan floating point (5 desimal)
    CORE_USAGE=$(awk -v total="$DIFF_TOTAL" -v idle="$DIFF_IDLE" 'BEGIN { usage = (100*(total-idle))/total; printf "%.5f", usage }')
    
    # Hapus trailing zero dan titik desimal jika perlu (0.75000 -> 0.75)
    CORE_USAGE=$(echo "$CORE_USAGE" | sed -e 's/0*$//' -e 's/\.$//')
    
    echo "$(timestamp) - Core Usage [${CORE_USAGE}%] - Terminal Model [${CORE_MODEL}]"
}

get_core_usage
