#!/bin/bash
#s4206389
#Tina Le 

LOG_FILE="./Linux.log" #uses current directory; change to absolute path if required

echo "====Update started at $(date)====" >> "$LOG_FILE"
# Update package lists and upgrade packages, logging both standard output and errors
apt-get update >> "$LOG_FILE" 2>&1
apt-get upgrade -y >> "$LOG_FILE" 2>&1
echo "=== Update finished at $(date) ===" >> "$LOG_FILE"


