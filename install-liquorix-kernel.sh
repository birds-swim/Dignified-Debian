#!/bin/bash

### This shell script is intended to install the Liquorix kernel on SPIRAL LINUX. You can install Liquorix on any 
### Debian system, but the script is targeted at a fresh install of Spiral Linux. Spiral Linux ships with zRAM,
### and I wanted to make sure that the Liquorix kernel and zRAM play nicely with each other.

# Probably a good idea to update the system first.
sudo echo ""
echo "Updating the system..."
echo ""
sleep 1
sudo apt-get update && sudo apt-get -Vy upgrade
echo ""
echo ""

# Install Liquorix
sudo echo "Installing the Liquorix kernel from the Liquorix webiste (https://liquorix.net)..."
cd /home/$USER/Downloads
curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash
cd ..
echo ""
echo ""
sleep 1

# Make Liquorix and zRAM best friends by changing the appropriate kernel parameters.
