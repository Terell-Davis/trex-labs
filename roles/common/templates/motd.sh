#!/bin/bash
#
# /etc/update-motd.d/10-custom-info
# This script displays custom system information

# Gather System Information
WHO=$(who | awk '{print $1}' | sort | uniq | tr '\n' ' ')
CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
DISK=$(df -h / | awk 'NR==2 {print $5}')
RAM=$(free -m | awk 'NR==2 {printf "%.1f%%", $3/$2*100}')
UPTIME=$(uptime -p)


# Display Welcome Message
echo ""
echo "Welcome to $(hostname)!"
echo "=================================="
echo "System Uptime: $UPTIME"
echo "Logged in users: $WHO"
echo "CPU Usage: $CPU%"
echo "Disk Usage (/): $DISK"
echo "RAM Usage: $RAM"
echo "=================================="
