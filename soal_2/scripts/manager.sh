#!/bin/bash
# manager.sh - Manage scheduling of monitoring jobs via crontab and view active jobs.
# Commands:
#   add-cpu       : Schedule core_monitor.sh via crontab (job logging masih tersimpan)
#   add-ram       : Schedule frag_monitor.sh via crontab
#   remove-cpu    : Remove the scheduled core_monitor.sh job
#   remove-ram    : Remove the scheduled frag_monitor.sh job
#   view-scheduled: Display active crontab jobs and real-time monitoring data

# Define log directory and files (log historis tetap dicatat)
LOG_DIR="./logs"
CORE_LOG="$LOG_DIR/core.log"
FRAG_LOG="$LOG_DIR/fragment.log"

# Full paths to monitoring scripts (assumed to be in ./scripts/)
CORE_MONITOR_SCRIPT="$(pwd)/scripts/core_monitor.sh"
FRAG_MONITOR_SCRIPT="$(pwd)/scripts/frag_monitor.sh"

mkdir -p "$LOG_DIR"

timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

add_core_monitor() {
    (crontab -l 2>/dev/null; echo "*/1 * * * * $CORE_MONITOR_SCRIPT >> $CORE_LOG 2>&1") | crontab -
    echo "$(timestamp) - Core Monitor added to crontab." >> "$CORE_LOG"
    echo "Core Monitor scheduled."
}

add_frag_monitor() {
    (crontab -l 2>/dev/null; echo "*/1 * * * * $FRAG_MONITOR_SCRIPT >> $FRAG_LOG 2>&1") | crontab -
    echo "$(timestamp) - Fragment Monitor added to crontab." >> "$FRAG_LOG"
    echo "Fragment Monitor scheduled."
}

remove_core_monitor() {
    crontab -l | grep -v "$CORE_MONITOR_SCRIPT" | crontab -
    echo "$(timestamp) - Core Monitor removed from crontab." >> "$CORE_LOG"
    echo "Core Monitor removed from scheduling."
}

remove_frag_monitor() {
    crontab -l | grep -v "$FRAG_MONITOR_SCRIPT" | crontab -
    echo "$(timestamp) - Fragment Monitor removed from crontab." >> "$FRAG_LOG"
    echo "Fragment Monitor removed from scheduling."
}

view_scheduled() {
    echo -e "\e[1;34mScheduled Monitoring Jobs:\e[0m"
    crontab -l
    echo ""
    
    # Tampilkan hasil monitoring secara real-time
    echo -e "\e[1;34mCurrent Core Performance (Real-Time):\e[0m"
    bash "$CORE_MONITOR_SCRIPT"
    
    echo ""
    echo -e "\e[1;34mCurrent Fragment Performance (Real-Time):\e[0m"
    bash "$FRAG_MONITOR_SCRIPT"
}


case "$1" in
    add-cpu)
        add_core_monitor
        ;;
    add-ram)
        add_frag_monitor
        ;;
    remove-cpu)
        remove_core_monitor
        ;;
    remove-ram)
        remove_frag_monitor
        ;;
    view-scheduled)
        view_scheduled
        ;;
    *)
        echo "Usage: $0 {add-cpu|add-ram|remove-cpu|remove-ram|view-scheduled}"
        exit 1
        ;;
esac
