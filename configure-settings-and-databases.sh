#!/bin/bash
# setup ufw, flatpak, mlocate, apt file, and other stuff here
# There are a lot of programs that don't get configured or refreshed that need to be after they are installed.
# This shell script aims to setup all those things and/or inform the User of any manual configuration.

### NOTE: Please comment/uncomment what you want or don't want before running this script.

#### Install software here.

sudo apt-get -Vy install ufw rkhunter chkrootkit sshguard endlessh apt-file

# rkhunter
echo "Backing up original rkhunter.conf..."
sudo cp -v /etc/rkhunter.conf /etc/rkhunter.conf.bak

# chkrootkit
echo "Backing up original chkrootkit.conf..."
sudo cp -v /etc/chkrootkit.conf /etc/chkrootkit.conf.bak

# setup ufw (safe and basic settings)
sudo echo "Setting up ufw firewall..."
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
echo "Enabling ufw for CUPS (printing)"
sudo ufw allow cups
sudo ufw reload

# setup sshguard (lighter on resources and faster than sshguard)
# https://www.sshguard.net/
# https://wiki.archlinux.org/title/Sshguard
echo "WARNING: This script assumes the installation and use of ufw."
sudo cp -v /etc/ufw/before.rules /etc/ufw/before.rules.bak


# setup fail2ban (probably gonna read the guide on DigitalOcean for this)
#sudo cp -v /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
#sudo cp -v /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
#echo ""
#sleep 1

# setup flatpak
echo "This will setup Flatpak to give you the option to install a Flapak for just yourself or for everyone on the system."
echo ""
sleep 2
sudo flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo

# update mlocate database
echo ""
echo "Updating mlocate database..."
sudo updatedb
sleep 1
echo ""

# setup endlessh
echo "Backing up ssh_config..."
sudo cp -v /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
echo "Matching endlessh config with ssh default settings (Port 22)"
echo "Please change /etc/ssh/ssh_config and /etc/endlessh/config to a DIFFERENT PORT (Port 2222"
echo "or something else) when script is finished!"
sleep 2
sudo echo "Port 22 # this is becasue endlessh runs by default on port 2222" > /etc/endlessh/config
sudo systemctl enable endlessh
sudo systemctl start endlessh
sudo netstat -tulpn | grep enlessh

# update apt-file database
echo "Updating apt-file cache..."
sudo apt-file update

# ADDITIONAL HOMEWORK. This part must be done manually. You must edit the config files yourself. Instructions are included in the provided URLs.
sleep 4
sudo echo ""
echo ""
echo ""
echo "======================================================================================================"
echo ""
echo ""
echo "######################################################################################################"
echo "####                               ADDITIONAL HOMEWORK                                            ####"
echo "######################################################################################################"
echo ""
echo "Please open a new terminal window, then return to this output."
echo "This last part must be done manually. It just involves editing important config files needed for the programs to work properly."
echo ""
echo ""
sleep 4
#echo "FAIL2BAN:"
#echo "Please edit the jail.local and fail2ban.local file in the /etc/fail2ban/ folder to your needs."
#echo "Source: https://thecurioustechnoid.com/step-by-step-guide-to-configure-fail2ban"
#echo "Copy this command to edit the jail.local file: sudo nano /etc/fail2ban/jail.local"
#echo "Copy this command to edit the fail2ban.local file: sudo nano /etc/fail2ban/fail2ban.local"
#echo "Finally, copy and enter the command: fail2ban-client -x start ; systemctl enable fail2ban.service ; systemctl start fail2ban.service ; systemctl status fail2ban.service"
#echo "after you have edited the jail.local file (via the instructions provided by the above URL)."
#echo ""
#echo ""
#sleep 1
echo "SSHGUARD:"
echo "Please edit the /etc/ufw/before.rules file "
echo "Source: https://wiki.archlinux.org/title/Sshguard"
echo "Copy this command to edit ufw's before.rules file: sudo nano /etc/ufw/before.rules"
echo "Then copy this command to restart ufw: sudo ufw restart"
echo ""
echo ""
echo ""
echo ""
sleep 1
echo "RKHUNTER:"
echo "Please edit the rkhunter config file(s)."
echo "Source: https://www.atlantic.net/dedicated-server-hosting/detect-linux-security-holes-and-rootkits-with-rkhunter-on-ubuntu"
echo "Copy this command to edit the rkhunter config file: sudo nano /etc/rkhunter.conf"
echo "Copy this command to setup automatic scanning: sudo nano /etc/default/rkhunter.conf"
echo "After editing BOTH files (according to the instrucitons provided in the URL above), run the command: rkhunter --update"
echo "Finally, run the command: sudo rkhunter --propupd (after you're finished ediitng the config files)."
echo ""
echo ""
sleep 1
echo "CHKROOTKIT:"
echo "Please edit the chkrootkit config file."
echo "Source: https://www.geeksforgeeks.org/how-to-install-chkrootkit-tool-in-kali-linux"
echo "Change the first line in the config file from RUN_DAILY=false to RUN_DAILY=true"
echo "by running: sudo nano /etc/chkrootkit.conf"
echo ""
echo ""
sleep 1
echo "ENDLESSH:"
echo "endlessh works hand-in-hand with fail2ban/sshguard to provide even more frustration to a potential ssh attacker."
echo "Sources: https://github.com/skeeto/endlessh"
echo "The source that was used for the endlessh config for this system was this YouTube video: https://www.youtube.com/watch?v=SKhKNUo6rJU"
echo "However, the official GitHub page provides a more robust sample config: https://github.com/skeeto/endlessh"
echo "Don't forget to move your ssh port to something else! Change that in the ssh config. Check and see if you need to"
echo "edit jail.local, fail2ban.local, the sshguard config, or /etc/endlessh/config to match your NEW port you assigned for ssh."


echo ""
echo "FINISHED."
echo ""
exit
