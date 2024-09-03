######################################
###          Bash Aliases          ###
######################################

### Common Bash Aliases


### Nala and Apt
alias nupd="sudo nala update"
alias nupg="sudo nala upgrade"
alias nfull="sudo nala dist-upgrade"
alias nsrch="nala search"
alias asrch="apt-cache search"
alias upd8="sudo apt-get update && sudo apt-get -V upgrade"
alias afup="sudo apt-file update"

# Update Entire System
alias fullupdate="sudo nala upgrade && flatpak -y update && sudo apt-file update && sudo updatedb && sudo rkhunter --update"

### Sudo
alias kingme="sudo su -l"
alias godmode="sudo su -l"

### Security Scans and System Maintenance
alias resetufw="sudo ufw reset && sudo ufw default deny incoming && sudo ufw default allow outgoing && sudo allow cups && sudo ufw reload"
alias fullscan="sudo rkhunter --update && sudo rkhunter --check 

### Btrfs Maintenance


### Firejail Aliases (Inteded for CLI apps, but includes shortcuts to common Firejail tasks)
alias fjtop="firejail --top"

### OpenVPN (example: ProtonVPN)
## https://protonvpn.com/support/linux-openvpn
#alias startvpn="sudo openvpn [openvpn server config here]"
#alias stopvpn="sudo killall openvpn" #Unglamorous, I know. But it will work.

### WIREGUARD (example: ProtonVPN)
## https://protonvpn.com/support/wireguard-linux
#alias wgup="sudo wg-quick up [server config here]"
#alias wgdn="sudo wg-quick down [server config here]"
#alias wgchk="sudo wg" #(Shows current configuration and status)
