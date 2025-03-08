#!/bin/bash

# Set the Ethernet interface name
INTERFACE="enp0s31f6"

echo "$(date +"%Y-%m-%dT%H:%M:%S%z") Initializing script..."

# Infinite loop to perform the task every 30 minutes
while true; do
    if ! timeout 0.5 nc -z -w 1 -d 1 google.com 443; then
    #if ! nc -z -w 1 -d 1 google.com 443; then
        # Bring the interface down
        
	echo "$(date +"%Y-%m-%dT%H:%M:%S%z") Bringing interface $INTERFACE down..."
        nmcli networking off

        # Wait for 5 seconds
        sleep 5

        # Bring the interface up
        echo "$(date +"%Y-%m-%dT%H:%M:%S%z") Bringing interface $INTERFACE up..."
        nmcli networking on
	sleep 30
    #else
        #echo "Online"
    fi

    # Wait for 220 minutes before repeating
    sleep 1
done
