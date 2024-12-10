resource_alerts() {
    echo "Monitoring resource usage......"

    # CPU Usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    if (( $(echo "$cpu_usage > 80.0" | bc -l) )); then
        echo "High CPU usage: ${cpu_usage}%"
    else
        echo "CPU usage is normal: ${cpu_usage}%"
    fi

    # Disk Usage
    disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    if (( disk_usage > 80 )); then
        echo "Disk space usage is critical: ${disk_usage}%"
    else
        echo "Disk space usage is normal: ${disk_usage}%"
    fi
}

resource_alerts
