#!/bin/bash
# setup ufw, flatpak, mlocate, apt file, and other stuff here
# There are a lot of programs that don't get configured or refreshed that need to be after they are installed.
# This shell script aims to setup all those things.

#### Install software here.

sudo apt-get -Vy install ufw rkhunter chkrootkit fail2ban endlessh apt-file

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

# setup fail2ban (probably gonna read the guide on DigitalOcean for this)

sudo cp -v /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo cp -v /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
echo ""
sleep 1

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
echo "FAIL2BAN:"
echo "Please edit the jail.local and fail2ban.local file in the /etc/fail2ban/ folder to your needs."
echo "Source: https://thecurioustechnoid.com/step-by-step-guide-to-configure-fail2ban"
echo "Copy and enter this command to edit the jail.local file: sudo nano /etc/fail2ban/jail.local"
echo "Copy and enter this command to edit the fail2ban.local file: sudo nano /etc/fail2ban/fail2ban.local"
echo "Finally, copy and enter the command: fail2ban-client -x start ; systemctl enable fail2ban.service ; systemctl start fail2ban.service ; systemctl status fail2ban.service"
echo "after you have edited the jail.local file (via the instructions provided by the above URL)."
echo ""
echo ""
sleep 1
echo "RKHUNTER:"
echo "Please edit the rkhunter config file(s)."
echo "Source: https://www.atlantic.net/dedicated-server-hosting/detect-linux-security-holes-and-rootkits-with-rkhunter-on-ubuntu"
echo "Copy and enter this command to edit the rkhunter config file: sudo nano /etc/rkhunter.conf"
echo "Copy and enter this command to setup automatic scanning: sudo nano /etc/default/rkhunter.conf"
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
echo "endlessh works hand-in-hand with fail2ban to provide even more frustration to a potential ssh attacker."
echo "Sources:"
echo "The source that was used for the endlessh config for this system was this YouTube video: https://www.youtube.com/watch?v=SKhKNUo6rJU"
echo "However, the official GitHub page provides a more robust sample config: https://github.com/skeeto/endlessh"
echo "Don't forget to move your ssh port to something else! Change that in the ssh config. Check and see if you need to"
echo "edit jail.local, fail2ban.local, or /etc/endlessh/config to match your NEW port you assigned for ssh."

echo ""
echo ""
echo ""
sleep 3
echo "The next section is purely optional. Difficulty level=Advanced."
echo ""
echo "APPARMOR AND FIREJAIL"
echo ""
echo "These programs have been installed for your convenience. They are very, very powerful security-centric tools you can use"
echo "to further harden the security of your system. For normal users, you might not ever need them. Be careful when using these tools!"
echo "They require a more intermediate to advanced knowledge level of Linux and Linux security to use them effectively. Otherwise,"
echo "you could have a bad day and become very frustrated by these tools. Knowledge and wisdom are key to unlocking the power of"
echo "AppArmor+Firejail."
echo ""
echo "A wise quote from the first Spider-Man movie: 'With Great Power comes Great Responsibility'."
echo ""
sleep 3




echo "A text document named 'APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt' will be added to your Documents folder for future reading on the subject."
echo "Delete it if you don't need it."
echo ""
sleep 2
echo "###################################################################################################" > ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "#####                                APPARMOR + FIREJAIL                                      #####" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "###################################################################################################" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "This document was generated on:" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
date >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt

echo "What is AppArmor?" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "AppArmor is an mandatory access control (MAC) like security system" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "for Linux. It is designed to work with standard Unix discretionary" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "access control (DAC) permissions while being easy to use and deploy," >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "by allowing an admin to confine only specific applications. ----Quote from the AppArmor Wiki" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt

echo "What is Firejail?" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "Firejail is an easy to use Setuid sandbox program that reduces the risk" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "of security breaches by restricting the running environment of untrusted applications" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "using Linux namespaces, seccomp-bpf and Linux capabilities. ----Quote from the Arch Wiki" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "Basically, it allows sandboxing for applications running on your system." >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "https://en.wikipedia.org/wiki/Sandbox_(computer_security)" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt

echo "Below is a list of further reading on AppArmor and Firejail." >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt

echo "Again, configuring AppArmor and Firejail is purely optional." >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "The intended audience for this text document are for KNOWLEDGABLE security/privacy-centric users" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "who may wish to improve upon the security that is *already there* for Debian." >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "Linux Beginners/Novices may ignore this document and carry on as normal." >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt

echo "SOURCES:" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt

echo "Official Firejail Documentation:" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "https://firejail.wordpress.com/documentation-2/basic-usage" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "AppArmor Further Reading:" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "FAQ: https://gitlab.com/apparmor/apparmor/-/wikis/FAQ" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "DEBIAN WIKI: https://wiki.debian.org/AppArmor/HowToUse" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo "ARCH LINUX WIKI: https://wiki.archlinux.org/title/AppArmor" >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt

echo "Google, YouTube, and Reddit are great sources to learn more about these tools." >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt
echo " " >> ~/Documents/APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt

echo ""
echo "The file 'APPARMOR-AND-FIREJAIL-ONLINE-SOURCES.txt' has been added to your Documents folder."
echo ""
echo "FINISHED."
echo ""
exit
