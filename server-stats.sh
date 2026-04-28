#!/bin/bash

echo "======================================="
echo "      SERVER PERFORMANCE STATS         "
echo "======================================="
echo ""

#CPU yuklamasi
echo "--- CPU yuklamasi ---"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed 's/,/ /g' | awk '{print 100 - $8}' )
echo " CPU band: $cpu_usage %"

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
