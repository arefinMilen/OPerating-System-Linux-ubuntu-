while true; do
	echo "Advanced System Management Toolkit"
	echo "1. Process Management"
	echo "2. Security Management"
	echo "3. Backup and Restore"
	echo "4. Log Analysis and cleanup"
	echo "5. Resource Usage Alerts"
	echo "6. Exit" 
	echo -n "Enter your choice: "
	read choice

	case $choice in
		1) ./process_management.sh ;;
		2) ./security_management.sh ;;
		3) ./backup_restore.sh ;;
		4) ./log_cleanup.sh ;;
		5) ./resource_alerts.sh ;;
		6) echo "Exiting........."; break ;;
		*) echo "Invalid choice! Please try again." ;;
	esac
	echo
done
