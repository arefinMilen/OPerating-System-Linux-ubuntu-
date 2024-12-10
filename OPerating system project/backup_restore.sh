backup_restore() {
	echo "Backup and Resotre"
	echo "1. Perform full backup"
	echo "2. Restore from backup"
	echo -n "Enter your choice:"
	read choice

	case $choice in 
		1)
			echo "Enter the directory to backup:"
			read dir
			tar -czvf backup_$(date +%F).tar.gz $dir
			echo "Backup of $dir created."
			;;
		2)
			echo "Enter the backup file to restore from: "
			read backup_file
			echo "Enter the restore_location:"
			read restore_location
			tar -xzvf $backup_file -C $restore_location
			ehco "Backup restored to $restore_location."
			;;
		*)
			echo "Invalid choice!"
			;;
	esac
}

backup_restore
