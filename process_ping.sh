#!/bin/bash
LOGFILE="$HOME/solas-automation/evaluation.log"

echo "-----------------------------" >> "$LOGFILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') – Monitoring cycle start" >> "$LOGFILE"

# 🌐 Network check
if ping -c 1 -W 2 8.8.8.8 >/dev/null 2>&1; then
    echo "Network: OK" >> "$LOGFILE"
else
    echo "Network: ❌ DOWN" >> "$LOGFILE"
fi

# 🔥 CPU temperature (Raspberry-specific)
if command -v vcgencmd >/dev/null 2>&1; then
    CPU_TEMP=$(vcgencmd measure_temp | grep -oP '\d+\.\d+')
    echo "CPU Temp: ${CPU_TEMP}°C" >> "$LOGFILE"
fi

# 💾 Disk space
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
echo "Disk free: $DISK_FREE" >> "$LOGFILE"

# 🧠 Memory usage
MEM_FREE=$(free -h | awk '/Mem:/ {print $4}')
echo "Memory free: $MEM_FREE" >> "$LOGFILE"

echo "$(date '+%Y-%m-%d %H:%M:%S') – Monitoring cycle end" >> "$LOGFILE"

