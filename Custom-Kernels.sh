#!/bin/bash

### This shell script adds the Liquorix kernel and Xanmod kernel to your apt sources.
echo "Add the Liquorix and Xanmod kernels to your apt sources."
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
sudo apt update

echo "This kernel has NOT been installed. It is now *available* to install at your leisure."
echo "Run 'apt search xanmod' to search for them or use Synaptic if that's easier."
echo "Run 'sudo apt -V install [xanmod's package name here]' to install xanmod."
echo ""
echo "Unfortunately, the Liquorix kernel directly installs itself on the system through their shell script per their website's instructions."
echo "It adds itself to the apt sources, but then proceeds with the installation, which is outside the goals of this shell script.
echo "So Liquorix will not be added with this script."
echo "You can install the Liquorix kernel, reboot, and then purge it with 'sudo apt purge [liquorix package name here] && sudo apt -V --purge autoremove'."
echo "Reboot again to apply the changes. This is the long way to add Liquorix to your apt sources, but it will be available to install in the future."
echo ""
echo "If you wish to install it anyway, run the command taken from the Liquorix website (https://liquorix.net) below:"
echo ""
echo "curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash"
echo ""
echo "Sources: https://liquorix.net and https://xanmod.org"
echo ""
sleep 2

exit
