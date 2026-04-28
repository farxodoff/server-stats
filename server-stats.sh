echo "======================================="
echo "      SERVER PERFORMANCE STATS         "
echo "======================================="
echo ""

#CPU yuklamasi
echo "--- CPU yuklamasi ---"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed 's/,/ /g' | awk '{print 100 - $8}' )
echo " CPU band: $cpu_usage %"
echo ""
