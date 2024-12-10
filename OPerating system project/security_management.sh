security_management() {
    echo "Security Management"
    echo "1. Monitor failed login attempts"
    echo "2. Set up basic firewall"
    echo "Enter your choice:"
    read choice

    case $choice in
        1)
            echo "Displaying recent failed login attempts:"
            grep "Failed password" /var/log/auth.log | tail -10 # Show the last 10 failed login attempts
            echo "Monitoring new failed login attempts (Press Ctrl+C to stop):"
            tail -f /var/log/auth.log | grep "Failed password"
            ;;
        2)
            echo "Setting up basic firewall rules..."
            sudo ufw allow 22/tcp
            sudo ufw deny 23
            sudo ufw enable
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
}

# Call the function
security_management

