#!/bin/bash
# manager.sh - Crontab & Log Viewer

CORE_MONITOR_SCRIPT="./scripts/core_monitor.sh"
FRAG_MONITOR_SCRIPT="./scripts/frag_monitor.sh"
CORE_LOG="./logs/core.log"
FRAG_LOG="./logs/fragment.log"

# Set crontab setiap 2 menit
INTERVAL="*/2 * * * *"

add_core_monitor() {
    (crontab -l 2>/dev/null | grep -v "$CORE_MONITOR_SCRIPT"; echo "$INTERVAL $CORE_MONITOR_SCRIPT") | crontab -
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Core Monitor added to crontab (Puasa Daud schedule)." >> "$CORE_LOG"
}

add_frag_monitor() {
    (crontab -l 2>/dev/null | grep -v "$FRAG_MONITOR_SCRIPT"; echo "$INTERVAL $FRAG_MONITOR_SCRIPT") | crontab -
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Fragment Monitor added to crontab." >> "$FRAG_LOG"
}

remove_core_monitor() {
    (crontab -l 2>/dev/null | grep -v "$CORE_MONITOR_SCRIPT") | crontab -
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Core Monitor removed from crontab." >> "$CORE_LOG"
}

remove_frag_monitor() {
    (crontab -l 2>/dev/null | grep -v "$FRAG_MONITOR_SCRIPT") | crontab -
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Fragment Monitor removed from crontab." >> "$FRAG_LOG"
}

view_scheduled_jobs() {
    echo -e "\e[1;34mScheduled Monitoring Jobs:\e[0m"
    crontab -l 2>/dev/null || echo "No scheduled jobs found."

}

case "$1" in
    add_core) add_core_monitor ;;
    add_frag) add_frag_monitor ;;
    remove_core) remove_core_monitor ;;
    remove_frag) remove_frag_monitor ;;
    view_jobs) view_scheduled_jobs ;;
    *) echo "Usage: $0 {add_core|add_frag|remove_core|remove_frag|view_jobs}" ;;
esac
