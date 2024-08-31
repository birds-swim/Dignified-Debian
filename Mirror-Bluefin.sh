#!/bin/bash

### Bluefin Linux looked like they had a good and sensible mix between system programs (rpm/deb) and Flatpaks
### This project aims to mirror this distro for my Spiral Linux installation.
### IMPORTANT: These packages are targeted towards the GNOME Desktop Environment.

sudo echo ""
echo "Install packages and Flatpaks"
echo ""
echo ""
sleep 2

# Update the system
sudo apt-get update && sudo apt-get -Vy upgrade
echo ""
echo ""

# Install apt packages
sudo apt-get -Vy install 
echo ""
echo ""

# Install Flatpaks (System Wide installation is used here)




exit
