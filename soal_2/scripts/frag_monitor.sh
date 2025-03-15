#!/bin/bash
# frag_monitor.sh - Real-time Fragment (RAM) Monitoring.

timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

get_fragment_usage() {
    TOTAL_MEM=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
    AVAIL_MEM=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
    USED_MEM=$((TOTAL_MEM - AVAIL_MEM))
    
    # Hitung usage dengan tepat 2 angka desimal
    FRAG_USAGE=$(awk -v used="$USED_MEM" -v total="$TOTAL_MEM" 'BEGIN { usage = (100*used)/total; printf "%.2f", usage }')
    
    echo "$(timestamp) - Fragment Usage [${FRAG_USAGE}%] - Fragment Count [${USED_MEM} KB] - Details [Total: ${TOTAL_MEM} KB, Available: ${AVAIL_MEM} KB]"
}

get_fragment_usage
