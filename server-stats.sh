#!/bin/bash

echo "======================================="
echo "      SERVER PERFORMANCE STATS         "
echo "======================================="
echo ""

#CPU yuklamasi
echo "--- CPU yuklamasi ---"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed 's/,/ /g' | awk '{print 100 - $8}' )
echo " CPU band: $cpu_usage %"
echo ""

#RAM yuklamasi
echo "--- RAM ishlashi ---"
mem_total=$(free -m | awk 'NR==2 {print $2}')
mem_used=$(free -m | awk 'NR==2 {print $3}')
mem_free=$(free -m | awk 'NR==2 {print $4}')
mem_percent=$(awk "BEGIN {printf \"%.2f\", ($mem_used/$mem_total)*100}")

echo " Umumiy:       $mem_total Mb"
echo " Ishlatilgan:  $mem_used Mb"
echo " Bo'sh:        $mem_free Mb"
echo " Foiz:         $mem_percent %"
echo ""

#Disk yuklamasi
echo "--- Disk ishlashi ---"
disk_total=$(df -h / | awk 'NR==2 {print $2}')
disk_used=$(df -h / | awk 'NR==2 {print $3}')
disk_free=$(df -h / | awk 'NR==2 {print $4}')
disk_percent=$(df -h / | awk 'NR==2 {print $5}')

echo " Umumiy:       $disk_total"
echo " Ishlatilgan:  $disk_used"
echo " Bo'sh:        $disk_free"
echo " Foiz:         $disk_percent"
echo ""

#TOP5 CPU usage
echo "--- Top 5 CPU jarayonlari ---"
ps aux --sort=-%cpu | awk 'NR<=6 {printf "%-10s %-8s %-6s %s\n", $1, $2, $3, $11}'
echo ""

#TOP5 RAM usage
echo "--- Top 5 RAM jarayonlari ---"
ps aux --sort=-%mem | awk 'NR<=6 {printf "%-10s %-8s %-6s %s\n", $1, $2, $4, $11}'
echo ""


echo "======================================="
echo "         System information"
echo "======================================="
echo ""


#OS versiya
os_name=$(grep "PRETTY_NAME" /etc/os-release | cut -d'"' -f2)
echo " OS:            $os_name"
echo ""


uptime_info=$(uptime -p)
echo " Ishlash vaqti:  $uptime_info"
echo ""


load_avg=$(uptime | awk -F'load average:' '{print $2}' | xargs)
echo " O'rtacha yuklama: $load_avg"
echo ""


users_count=$(who | wc -l)
echo " Kirgan userlar:   $users_count"
echo ""


failed_logins=$(grep "Failed password" /var/log/auth.log | wc -l)
echo " Failed login:     $failed_logins"
echo ""























