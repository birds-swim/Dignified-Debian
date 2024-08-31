#!/bin/bash

### This shell script adds the Xanmod kernel to your apt sources.
echo "Add the Xanmod kernels to your apt sources."
sudo echo ""
sleep 3

# Probably a really good idea if I actually took some Bash scripting lessons. :(

sudo echo "Adding Zanmod kernel to your apt sources..."
wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -vo /usr/share/keyrings/xanmod-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list

echo ""
echo "Updating apt"
echo ""
sleep 1
sudo apt-get update

echo "This kernel has NOT been installed. It is now *available* to install at your leisure."
echo "Run 'apt search xanmod' to search for them or use Synaptic if that's easier."
echo "Run 'sudo apt -V install [xanmod's package name here]' to install xanmod."
echo ""
echo "Consider reviewing the Xanmod documentation online for any additional steps/tips."
echo ""
sleep 1
echo "FINISHED."

exit
