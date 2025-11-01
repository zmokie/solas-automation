#!/bin/bash
LOGFILE="$HOME/solas-automation/evaluation.log"

# Log current date and time
echo "$(date '+%Y-%m-%d %H:%M:%S') - Process Ping Start" >> $LOGFILE

# Check network connectivity
ping -c 1 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Network OK" >> $LOGFILE
else
    echo "Network Issue" >> $LOGFILE
fi

# Check CPU temperature (example, modify based on need)
CPU_TEMP=$(vcgencmd measure_temp | awk -F'=' '{print $2}' | tr -d "'C")
echo "CPU Temp: $CPU_TEMP°C" >> $LOGFILE

# Check disk space
DISK_SPACE=$(df -h / | grep / | awk '{print $4}')
echo "Disk Space Remaining: $DISK_SPACE" >> $LOGFILE

# End log for this cycle
echo "$(date '+%Y-%m-%d %H:%M:%S') - Process Ping End" >> $LOGFILE
