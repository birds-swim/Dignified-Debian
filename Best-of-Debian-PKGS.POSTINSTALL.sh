#!/bin/bash

# 2024.08.18

#####################################################
###    SPIRAL LINUX POST-INSTALL CHORES SCRIPT    ###
#####################################################

# This shell script is to be used after a fresh install of Spiral Linux Builder Edition.
# Run this script to automatically add additional software resources (DistroBox + Homebrew),
# update certain databases (apt-file and mlocate), add packages outside of Debian's repos,
# and other tasks.

################# BEGIN SHELL SCRIPT
cd ~
echo ""
echo "Please enter your sudo password:"
sudo echo ""
sleep 2
### DEBIAN STABLE. LATEST SOFTWARE.
echo "Adding distrobox, homebrew, and pacstall to your system. Flatpak should already be installed on Spiral Linux."
# DISTROBOX
sudo apt-get -V --yes install distrobox
# HOMEBREW
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# PACSTALL (The "AUR" for Debian/Ubuntu system)
sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install)"
echo "NIX IS FOR THE GRAYBEARDS. I'M NOT A GRAYBEARD."
### INSTALL NALA
sudo echo "INSTALLING NALA"
curl https://gitlab.com/volian/volian-archive/-/raw/main/install-nala.sh | bash
echo "Nala will now fetch the fastest Debian mirrors closest to you. Pick at least 8. They will be added to your apt sources under '.nala-sources'"
sudo nala fetch
### VIRTUAL MACHINES AND WINDOWS BINARIES SUPPORT
flatpak install bottles boxes
### SETUP FLATPAK FOR BOTH system AND user
sudo echo ""
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
### INSTALL NEXTDNS (https://github.com/nextdns/nextdns/wiki/Debian-Based-Distribution)
sh -c "$(curl -sL https://nextdns.io/install)"


###################################################################################
###  This next section is related to system-specific tasks like updating        ###
###  certain program databases (mlocate), starting specific systemd services    ###
###  (such as fstrim for SSD/NVMe's), enabling firewall, and other things.      ###
###################################################################################



### FIX GNOME SETTINGS TO SHOW APPLICATIONS
# sudo apt -V install malcontent libmalcontent-ui-1-1

### ACTIVATE LIQUIDPROMPT
liquidprompt_activate && source ~/.bashrc
### ENABLE ufw FIREWALL
echo "ACTIVATING UFW FIREWALL"
sudo ufw enable
sudo ufw status
### Allow KDE Connect (Comment out if you don't use KDE Connect/GSConnect)
# https://userbase.kde.org/KDEConnect#Troubleshooting
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp
sudo ufw reload
# Alternatively, you could run:
## IP v4 (You'll have to edit "x" to the appropriate range of numbers)
# ip -4 addr
# sudo ufw allow proto udp from xxx.xxx.xxx.0/24 to any port 1714:1764
# sudo ufw allow proto tcp from xxx.xxx.xxx.0/24 to any port 1714:1764
## IP v6:
# sudo ufw allow proto udp from fe80::/64 to any port 1714:1764
# sudo ufw allow proto tcp from fe80::/64 to any port 1714:1764
# sudo ufw reload
# SECURITY: If you wanted to specify only allowing KDE Connect to connect on your home/local network.
# https://askubuntu.com/questions/815855/how-to-pair-android-and-ubuntu-via-kde-connect-behind-firewall-ufw
### REFRESH/CREATE SYSTEM DATABASES
echo "Running updatedb for mlocate:"
sudo updatedb
echo "Running 'sudo apt-file update'"
sudo apt-file update

### CHANGE SYSTEM SETTINGS AND ENVIRONMENT VARIABLES
mkdir ~/.bin
#You will need to add this to your .bashrc
export PATH="$HOME/bin:$PATH"

### Turn on fstrim. Uncomment if your computer is using an old HDD
echo "Enabling the fstrim systemd service"
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

exit
