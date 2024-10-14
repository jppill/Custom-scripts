# Aller dans le fichier du scripts avec cd ou kate, puis «bash reinstallation_APT_jpRAPIDE.sh»
#96cyan/91red/92green/93yellow/95magenta
#Liste couleurs sur bash: https://misc.flogisoft.com/bash/tip_colors_and_formatting

# immulator : https://repl.it/repls/DarkgreyMustyEmulation#main.sh

#!/bin/bash

# add to bashrc
clear
neofetch --cpu_temp C | lolcat -ats 900 #cpu temperature + lolcat=arc-en-ciel + ats=affichage progessif type dactylo
fortune

# add to .bash_aliases

echo -e "\e[93m" #96cyan/91red/92green/93yellow/95magenta
		echo "================================================="
		echo "  Installation rapide applications (APT) (Jp) "
		echo "================================================="
echo -e "\e[0m"
echo ""
echo "[START]"
read delta
echo -e "\e[93m" #96cyan/91red/92green/93yellow/95magenta
		echo "================================================="
		echo "                   ALL IN ONE "
		echo "================================================="
echo -e "\e[0m"

sudo apt -y install gimp digikam kcolorchooser speedcrunch kfind libc6-dev-i386 partitionmanager gdebi-core yakuake synaptic gufw wine playonlinux kbackup flac gimp variety catfish lolcat git tlp tlp-rdw hardinfo python3 python3-pip bleachbit cherrytree libasound2-plugin-equal libasound2-plugin-smixer libasound2-plugins speedtest-cli scratch stellarium supertux supertuxkart supertuxkart-data dolphin shotwell chemical-structures-data coolmail abe abe-data cool-retro-term frozen-bubble qreator kalzium stacer marble vlc okular cowsay fortunes fortune-mod snapd clamav-daemon clamtk chkrootkit rkhunter firejail firetools flatpak;
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install fluentreader telegram feeddeck;
sudo nordvpn s tpl 1 ;
sudo nordvpn s autoconnect 1 ;
sudo nordvpn s notify 1 ;
sudo nordvpn ipb6 1 ;

#SNAP dont work on MxLinux because of sysVINIT by default (work only with systemd)
#sudo snap install core & sudo snap install hello-world ; echo "test installation SNAP:" ; hello-world

echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "            Install Google Chrome      "
		echo "   =========================================="
echo -e "\e[0m"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ;
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "                 Install BRAVE      "
		echo "   =========================================="
echo -e "\e[0m"

sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "                Install Nordvpn    "
		echo "   =========================================="
echo -e "\e[0m"

wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb ;
sudo dpkg -i ./nordvpn-release_1.0.0_all.deb ;
sudo apt update ;
sudo apt install nordvpn

echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "            Auto-remove APT (nettoyage)     "
		echo "   =========================================="
echo -e "\e[0m"

sudo apt autoremove ;

echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "           Start TLP (battery saver)       "
		echo "      Start STACER (Surveillance syst.)       "
		echo "   =========================================="
echo -e "\e[0m"

sudo tlp start ;
sudo stacer start ;

echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "            Install CISCO ANYconnect     "
		echo "   =========================================="
echo -e "\e[0m"
echo " - https://vpnclient.###########.ca/ressources/anyconnect-linux64-4.9.00086-predeploy-k9.tar.gz "
echo " sudo -y sh vpn_install.sh   #dans le terminal, dans bon dossier          "
echo " once/if  vpnclient is crashed "
echo " -find the folder  /opt/cisco/anyconnect/bin "
echo " -there's a file called vpnagentd ( the vpn deamon ) just double-click it "
echo "and start again "vpnui" ( cisco anyconnect icon , you should have a desktop link too) everything will go back to work!!!! "

echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "        Kwin - Krohnkite settings GUI     "
		echo "   =========================================="
echo -e "\e[0m"

echo "mkdir -p ~/.local/share/kservices5/"
echo "ln -s ~/.local/share/kwin/scripts/krohnkite/metadata.desktop ~/.local/share/kservices5/krohnkite.desktop"

echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "          MAnually change SWAPPINESS     "
		echo "   =========================================="
echo -e "\e[0m"

echo "sudo sh -c 'echo 10 > /proc/sys/vm/swappiness'"
echo " sudo cp -p /etc/sysctl.conf /etc/sysctl.conf.`date +%Y%m%d-%H:%M`"
echo "# sudo sh -c 'echo "10" >> /etc/sysctl.conf'"
echo "# sudo sh -c 'echo "vm.swappiness = 10" >> /etc/sysctl.conf'"
echo "# cat /proc/sys/vm/swappiness"
echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "             Install PulseEffects     "
		echo "   =========================================="
echo -e "\e[0m"

echo "sudo apt install pulseeffects ;"
echo "cd ~/.config/PulseEffects/irs ;"
echo "wget -O 'Dolby ATMOS ((128K MP3)) 1.Default.irs' 'https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/irs/Dolby%20ATMOS%20((128K%20MP3))%201.Default.irs' ;"
echo "cd ;"
# IF CRAKLING: nano /etc/pulse/default.pa
#then find a line containing:

#load-module module-udev-detect
#modify this to become:

#load-module module-udev-detect tsched=0
#save and exit and you're all set!

echo -e "\e[96m" #96cyan/91red/92green/93yellow/95magenta
		echo "   =========================================="
		echo "            Install Enpass manually     "
		echo "   =========================================="
echo -e "\e[0m"

echo -e "\e[92m" #96cyan/91red/92green/93yellow/95magenta
		echo "================================================="
		echo "             Réinstallation terminée "
		echo "================================================="
echo -e "\e[0m"
