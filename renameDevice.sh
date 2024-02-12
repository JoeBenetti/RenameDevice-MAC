#!/bin/bash

# Gets the logged in user's name
loggedInUser=$(stat -f%Su /dev/console)

# Get the serial number
serialNumber=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# Combine them
ComputerName="${serialNumber}-${loggedInUser}"

# Use scutil to set name 
sudo scutil --set ComputerName "$ComputerName"
sudo scutil --set HostName "$ComputerName"
sudo scutil --set LocalHostName "$ComputerName"

echo "Device has been renamed to $ComputerName"
