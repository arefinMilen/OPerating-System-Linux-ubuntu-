list_processes() {
	echo "Listing top 10 precesses by memory usage:"
	ps aux --sort=-%mem | head -n 10
}

kill_process() {
	echo "Enter PID to kill:"
	read pid
	if [[ ! "$pid" =~ ^[0-9]+$ ]]; then
		echo "Invalid PID. Please enter a valid numeric PID."
		return
	fi
	kill -9 $pid
	echo "Process $pid has been killed."
}

change_priority() {
	echo "Enter PID to change priority:"
	read pid
	if [[ ! "$pid" =~ ^[0-9]+$ ]]; then
		echo "Invalid PID. Please enter a valid numeric PID."
		return
	fi
	echo "Enter nerw priority (nice value between  -20 and 19):"
	read priority
	if [[ ! "$priority" =~ ^-?[0-9]+$ ]] || [ "$priority" -lt -20 ] || [ "$priority" -gt 19 ]; then
		echo "Invalid priority value. It must be between -20 and 19"
		return
	fi
	renice $priority -p $pid
	echo  "Priority for process $pid has been changed to $priority."
}

#Main process management menu:

process_management() {
	echo "Process Management"
	echo "1. List all Process"
	echo "2. Kill a Process"
	echo "3. Change Process priority"
	echo -n "Enter your choice:"
	read choice

	case $choice in
		1)
			list_processes
			;;
		2)
			kill_process
			;;
		3)
			change_priority
			;;
		*)
			echo "Invalid choice! Please enter 1, 2, or 3."
			;;
	esac
}

process_management
