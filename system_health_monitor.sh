#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90

# Function to get CPU usage
get_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo $cpu_usage
}

# Function to get memory usage
get_mem_usage() {
    mem_usage=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}')
    echo $mem_usage
}

# Function to get disk usage
get_disk_usage() {
    disk_usage=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
    echo $disk_usage
}

# Function to get number of running processes
get_running_processes() {
    processes=$(ps aux | wc -l)
    echo $processes
}

# Main monitoring
cpu=$(get_cpu_usage)
mem=$(get_mem_usage)
disk=$(get_disk_usage)
procs=$(get_running_processes)

echo "System Health Report:"
echo "CPU Usage: $cpu%"
echo "Memory Usage: $mem%"
echo "Disk Usage: $disk%"
echo "Running Processes: $procs"

alerts=""

if (( $(echo "$cpu > $CPU_THRESHOLD" | bc -l) )); then
    alerts="$alerts CPU usage is high: $cpu%\n"
fi

if (( mem > MEM_THRESHOLD )); then
    alerts="$alerts Memory usage is high: $mem%\n"
fi

if (( disk > DISK_THRESHOLD )); then
    alerts="$alerts Disk usage is high: $disk%\n"
fi

if [ -n "$alerts" ]; then
    echo -e "\nAlerts:\n$alerts"
else
    echo "All metrics are within thresholds."
fi
