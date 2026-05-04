#!/bin/bash

echo "======================================="
echo "      SERVER PERFORMANCE STATS         "
echo "======================================="
echo ""

#CPU load
echo "--- CPU Usage ---"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed 's/,/ /g' | awk '{print 100 - $8}' )
echo " CPU Usage: $cpu_usage %"
echo ""

#RAM load
echo "--- RAM Usage ---"
mem_total=$(free -m | awk 'NR==2 {print $2}')
mem_used=$(free -m | awk 'NR==2 {print $3}')
mem_free=$(free -m | awk 'NR==2 {print $4}')
mem_percent=$(awk "BEGIN {printf \"%.2f\", ($mem_used/$mem_total)*100}")

echo " Total:       $mem_total Mb"
echo " Used:        $mem_used Mb"
echo " Free:        $mem_free Mb"
echo " Usage:       $mem_percent %"
echo ""

#Disk load
echo "--- Disk Usage ---"
disk_total=$(df -h / | awk 'NR==2 {print $2}')
disk_used=$(df -h / | awk 'NR==2 {print $3}')
disk_free=$(df -h / | awk 'NR==2 {print $4}')
disk_percent=$(df -h / | awk 'NR==2 {print $5}')

echo " Total:       $disk_total"
echo " Used:        $disk_used"
echo " Free:        $disk_free"
echo " Usage:       $disk_percent"
echo ""

#TOP5 CPU usage
echo "--- Top 5 CPU Processes ---"
ps aux --sort=-%cpu | awk 'NR<=6 {printf "%-10s %-8s %-6s %s\n", $1, $2, $3, $11}'
echo ""

#TOP5 RAM usage
echo "--- Top 5 RAM Processes ---"
ps aux --sort=-%mem | awk 'NR<=6 {printf "%-10s %-8s %-6s %s\n", $1, $2, $4, $11}'
echo ""


echo "======================================="
echo "         System information"
echo "======================================="
echo ""


#OS version
os_name=$(grep "PRETTY_NAME" /etc/os-release | cut -d'"' -f2)
echo " OS:            $os_name"
echo ""


uptime_info=$(uptime -p)
echo " Uptime:        $uptime_info"
echo ""


load_avg=$(uptime | awk -F'load average:' '{print $2}' | xargs)
echo " Load Avarage:  $load_avg"
echo ""


users_count=$(who | wc -l)
echo " Logged-in Users:   $users_count"
echo ""

if [ -r /var/log/auth.log ]; then
    failed_logins=$(grep "Failed password" /var/log/auth.log 2>/dev/null | wc -l)
    echo " Failed login:      $failed_logins"
else
    echo " Failed login: data not found! (sudo required)"
fi
echo ""























