log_cleanup() {
	echo "Cleaning up logs older than 7 days...."
	sudo find /var/log -type f -mtime +7 -exec rm -f {} \;
	echo "Old logs have been cleaned."
}

log_cleanup

