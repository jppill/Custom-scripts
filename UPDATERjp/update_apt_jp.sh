#!/bin/bash
# immulator : https://repl.it/repls/DarkgreyMustyEmulation#main.sh
#source ~/.bashrc
updater="~/Documents/Github/update_apt_jp.sh" #Installer le script à cet endroit
#ALIAS_Couleurs - Liste couleurs sur bash: https://misc.flogisoft.com/bash/tip_colors_and_formatting
	black='\e[0;4m' #noir
	BLACK='\e[1;4m' #noir GRAS
	red='\e[0;31m' #rouge pale
	RED='\e[1;31m' #rouge pale GRAS
	darkred='\e[0;91m' #rouge fonce
	DARKRED='\e[1;91m' #rouge fonce GRAS
	blue='\e[0;34m' #bleu
	BLUE='\e[1;34m'	#bleu GRAS
	cyan='\e[0;36m' #cyan pale
	CYAN='\e[1;36m' #cyan pale GRAS
	darkcyan='\e[0;96m' #cyan fonce
	DARKCYAN='\e[1;96m'	#cyan fonce GRAS
	green='\e[0;32m' #vert pale
	GREEN='\e[1;32m' #vert pale GRAS
	darkgreen='\e[0;92m' #vert fonce
	DARKGREEN='\e[1;92m' #vert fonce GRAS
	yellow='\e[0;33m' #jaune pale
	YELLOW='\e[1;33m' #jaune pale GRAS
	gold='\e[0;93m'	#dore
	GOLD='\e[1;93m' #dore GRAS
	pink='\e[0;35m' #rose
	PINK='\e[1;35m' #rose GRAS
	purple='\e[0;95m' #mauve
	PURPLE='\e[1;95m' #mauve GRAS
	nc='\e[0m' #no color=régulier
#ALIAS_Spécial - fonctionne qu'avec les couleurs en GRAS
	fade="\e[2m" #plus pale
	italic="\e[3m" #italique
	underline="\e[4m" #sousligne
	blink="\e[5m" #clignote
	highlight="\e[7m" #surligne
#ALIAS_Mise-en-page
	FAIT="-e $blink$GREEN    FAIT   $nc"
	ENTER="-e $blink$YELLOW [ ENTER ] $nc"
	ENTETE="-e $darkgreen========================================================== $nc"
#FCT Raccourci
SAUT(){ 
	echo -e ""
}
 
afficher_menu(){
	clear
		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$GOLD          U P D A T E R j p           $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$CYAN            Gestion L I N U X         $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE #&& SAUT
		echo -e "$BLACK       S E C U R I T E                                $nc"
		echo -e "$italic$CYAN[ M ]$nc $highlight$CYAN MAJ + nettoyage (NALA/APT-SNAP-FLATPAK) $nc"
	 	echo -e "$italic$CYAN[ MAJ ]$nc $highlight$GOLD MAJ + nettoyage (PKCON-SNAP-FLATPAK) $nc"
		echo -e "[ C ] Vérification ANTIVIRUS ClamAV"
		echo -e "[ ROOT ] #Vérification ROOTKIT [chkrootkit + rkhunter]"
  		SAUT
		echo -e "$BLACK       P A R A M E T R E S                            $nc"
		echo -e "[ V ou N ] Vérification et démarrage NORDVPN"
		echo -e "[ W ] Gestion WIFI"
  		echo -e "[ S ou VIT ] Test vitesse internet "
		echo -e "$italic$CYAN[ NALA ]$nc $highlight$BLUE Choix serveur MAJ-NALA (>rapide au moins) $nc"
		echo -e "[ A ] ALSAMIXER (ajuste son du terminal)"
		echo -e "[ D ] Systemd ou sysVinit [choix système de démarrage]" 
		echo -e "[ R ] REDSHIFT config (éclairage de nuit)"
  		SAUT
		echo -e "$BLACK       I N F O                                        $nc"
		echo -e "[ I ] INFO Système/batterie TLP"
		echo -e "[ L ] Liste ALIAS perso"
  		SAUT
		echo -e "$BLACK       A U T R E                                      $nc"
		echo -e "[ COW ] COWSAY game"
  		SAUT
		echo -e "$PURPLE[ Q ] QUITTER $italic ou juste appuyer [enter] $nc"
		SAUT
	}
	
while true; do
	afficher_menu
	read -p "Choix: " CHOIX


entete_maj(){
	SAUT && echo $ENTETE
	echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE             MISE A JOUR              $highlight$RED   $CYAN   $GOLD   $nc"
	echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE            S Y S T E M E             $highlight$RED   $CYAN   $GOLD   $nc"
	echo $ENTETE &&	SAUT
}

update_apt_nala(){
		echo -e "$highlight$GREEN    update apt/nala     $nc"
	sudo apt install nala
		#sudo nala install
 		#APT-NALA
	sudo nala update
		echo -e "$highlight$GREEN    maj listes     $nc"
	sudo nala list --upgradable
		echo -e "$highlight$GREEN    full upgrade nala     $nc"
	sudo nala upgrade --full -y
		echo -e "$highlight$GREEN    reparation paquets nala     $nc"
	sudo nala install -f
}

update_pkcon(){
		echo -e "$highlight$GREEN    update PKCON     $nc"
	sudo apt update
		echo -e "$highlight$GREEN    pkcon REFRESH     $nc"
	sudo pkcon refresh
		echo -e "$highlight$GREEN    pkcon UPDATE     $nc"
	sudo pkcon update -y
#		echo -e "$highlight$GREEN    apt full-upgrade     $nc"
#	apt full-upgrade -y
}

update_snap(){
		echo $ENTETE
		echo -e "$GOLD                     Mise à jour SNAP       "
		echo -e "               (sudo snap refresh ; --time)  $nc"
		echo $ENTETE
	sudo snap refresh
	sudo snap refresh --time
		echo $FAIT
}

update_flatpak(){
		echo $ENTETE
		echo -e "$GOLD                     Mise à jour Flatpak "
		echo -e "             (sudo flatpak update & list --app) $nc"
		echo $ENTETE
	sudo flatpak list --app
	sudo flatpak -y update
		echo $FAIT
}

update_github(){
		echo $ENTETE
		echo -e "$GOLD                     Mise à jour GitHub $nc"
		echo $ENTETE
	cd ~/Documents/Github/ && git pull scripts-gh main 
		echo -e "$italic$PURPLE....Vérification fichiers Github $nc"
	git status 
	cd ~/
		echo $FAIT
}

update_nettoyage(){
		echo $ENTETE
		echo -e "$GOLD                         Nettoyage $nc"
		echo $ENTETE
	sudo apt autoclean && sudo apt autoremove
	sudo nala clean
	sudo flatpak uninstall --unused
	sudo flatpak repair 
	history -c
	rm -v -f ~/.cache/thumbnails/*/*.png ~/.thumbnails/*/*.png
	rm -v -f ~/.cache/thumbnails/*/*/*.png ~/.thumbnails/*/*/*.png
	cat /dev/null > ~/.local/share/recently-used.xbel
	sudo fstrim -v /
	sudo update-icon-caches /usr/share/icons/*
		#from https://sourceforge.net/p/peppermintos/pepwiki/xDaily%20-%20A%20Complete%20System%20Updater/
}

etat_wifi_autosave(){
		#sudo iw wlan0 set power_save off
   		echo "Etat mise en veille WIFI"
   	iw wlan0 get power_save
		echo $ENTER	
}

case $CHOIX in

M|m) #MISE A JOUR APT
	clear
	entete_maj
	update_apt_nala
	update_snap
 	update_flatpak
  	update_github
   	update_nettoyage
	etat_wifi_autosave
  		echo $ENTER
		read mike
;;

MAJ|maj|Maj) #MISE A JOUR PKCON
	clear
	entete_maj
	update_pkcon
	update_snap
 	update_flatpak
  	update_github
   	update_nettoyage
	etat_wifi_autosave
  		echo $ENTER
		read mikes
;;

NALA|nala) #Choix serveurs NALA -vitesse
	clear
		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE           TEST DE VITESSE            $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE           S E R V E U R S            $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE && SAUT
	sudo nala fetch
 		echo $ENTER
	read november
;;

V|v|n|N) #NORDVPN
		clear 
		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                N O R D               $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                V  P  N               $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE && SAUT
	nordvpn version
	nordvpn account
		SAUT 	
	sudo systemctl start nordvpnd
	nordvpn settings
		echo $ENTER
	read victor
 	afficher_menuvpn(){	
		clear 
			SAUT && echo $ENTETE
			echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                N O R D               $highlight$RED   $CYAN   $GOLD   $nc"
			echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                V  P  N               $highlight$RED   $CYAN   $GOLD   $nc"
			echo $ENTETE && SAUT
	  	nordvpn version
		nordvpn status
  			SAUT
    			echo "      [ O ou C ] Lancement de la Connection Nordvpn"
	 		echo "      [ D ] Déconnection"
    			echo -e " $PURPLE$italic     [ ENTER ] Retour au menu PRINCIPAL $nc"
       			SAUT
		}
	while true; do
		afficher_menuvpn
  		SAUT
		read -p "Choix: " answer
 
	case $answer in
	
	O|o|C|c) #connect nord VPN
		clear 
			SAUT && echo $ENTETE
			echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                N O R D               $highlight$RED   $CYAN   $GOLD   $nc"
			echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                V  P  N               $highlight$RED   $CYAN   $GOLD   $nc"
			echo $ENTETE && echo ""
			echo "  ==> Connection serveur de quel pays?"
			echo "      [ 1 ] Le plus rapide"
   			echo "      [ C ] Canada - CAN"
      			echo "      [ E ou U ] États-Unis - USA"
	   		echo -e " $PURPLE$italic     [ ENTER ] Retour au menu NordVPN $nc"
      			SAUT
		read -p "Choix: " country
  		case $country in

    		1) #le plus rapide
  			sudo nordvpn c
			sudo nordvpn status
				echo $FAIT
    				echo -e "$italic$YELLOW Retour au Menu NordVPN $nc"
				echo $ENTER
			read victor
		;;
  		C|c|CAN|can) #Canada
  			sudo nordvpn c Canada
			sudo nordvpn status
				echo $FAIT
				echo -e "$italic$YELLOW Retour au Menu NordVPN $nc"
    				echo $ENTER
			read victor
      		;;
		U|c|E|e|usa|USA) #Etats-Unis
    			sudo nordvpn c United_States
			sudo nordvpn status
				echo $FAIT
    				echo -e "$italic$YELLOW Retour au Menu NordVPN $nc"
				echo $ENTER
			read victor
  		;;
  		*)
		;;
		esac
	;;
	
	D|d) #disconnect nord vpn
		sudo nordvpn d
		sudo nordvpn status
			echo $FAIT
			echo $ENTER
		read victor
	;;
	*)
 		break
	;;
	esac
	done
;;
    
L|l) #liste Aliases
	clear
 		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE               L I S T E              $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                    ALIAS             $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	echo ""
		echo -e "$DARKGREEN"
		SAUT
  		SAUT
    		SAUT
      		SAUT
		echo "Quitter le script en appuyant sur [ENTER] et écrire « alias » dans le terminal"
		SAUT
		echo -e -n "retour automatique au menu précédent (5..." && sleep 1s && echo -n "4..." && sleep 1s && echo -n "3..." && sleep 1s && echo -n "2..." && sleep 1s && echo -n "1sec)" && sleep 1s
  		echo -e "$nc"
;;

D|d) #système de démarrage
	clear
		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE      Demarrage par defaut avec       $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE        systemD ou sysVinit?          $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE && echo ""		
		echo " ==> Que veux-tu faire?"
		echo -e "\e[92m"
		SAUT
		echo "       [ d ]  systemD par default "
		SAUT
		echo "                  Systemd est actuellement le standard le plus utilisé en termes de \"Kernel Boot Systems\" (Init) qui peut être réalisé dans les environnements Unix, tels que Linux. Démarre les processus en parallèle. Plus lourd, plus d'accès que sysVinit."
		SAUT
  		SAUT
		echo "       [ v ]  sysVinit par default "
		SAUT
		echo "                  SysVinit est l'un des plus anciens et actuels Administrateurs de systèmes et services pour systèmes basés sur Linux. Il est encore largement utilisé sur de nombreux Distros GNU / Linux de trajectoires, et de nouvelles, comme Devuan. Démarre les processus en série. Très petit script et demande peu d'accès aux processus."
		SAUT
  		SAUT
		echo "       [ ENTER ]  retour sans rien changer "
		SAUT
	read -p "Choix: " answer
	case $answer in
	d|D) #
		sudo apt install systemd-sysv
			echo -e "\e[5m\e[92m"
			echo "systemD par DEFAULT"
			echo $ENTER
		read delta
	;;
	
	v|V) #
		sudo apt remove systemd-sysv
			echo -e "\e[5m\e[92m"
			echo "sysVinit par DEFAULT"
			echo $ENTER
		read delta
	;;
	
	*)
	;;
	esac
;;

I|i) #info système
	clear
  		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE             I N F O SYSTEME          $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE             &   A U T R E S          $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	SAUT && SAUT 
		echo "  ==> Quelles informations souhaites-tu obtenir?"
		echo -e "\e[93m"
		echo "      [ C ] layout CLAVIER actuel (en image interactive)"
		echo -e "\e[95m"
		echo "      [ I ] INFORMATIONS système et batterie "
		echo -e "\e[34m"
		echo "      [ R ] RETOUR au menu précédent"
		echo -e "\e[0m"
	read -p "Choix: " answer
	
	case $answer in
	
	c|C) #
		gkbd-keyboard-display -g 1
			echo $FAIT
			echo $ENTER
		read India
	;;
	
	i|I) #
		clear
			SAUT && echo $ENTETE
			echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE       Info Système/batterie TLP      $highlight$RED   $CYAN   $GOLD   $nc"
			echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE            (tlp-stat -s)             $highlight$RED   $CYAN   $GOLD   $nc"
			echo $ENTETE &&	SAUT		
		sudo nala install tlp
  		sudo tlp-stat -s # état système et batterie
			SAUT
		cat /etc/os-release
			echo $ENTER
		read india
	;;
	*)
	;;
	esac
;;

R|r) #REDSHIFT
			SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE               REDSHIFT               $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                                      $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	SAUT
  	echo "Redshift"
	kate /home/jp/.config/redshift.conf
;;

A|a) # SON
	alsamixer
;;

W|w) #WIFI
	clear
  		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE              G E S T I O N           $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE              W   I   F   I           $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	SAUT && SAUT 		
		echo " ==> Que veux-tu faire?"
		echo -e "\e[92m"
		echo "       [ 1 ]  INFOS réseau              [CTRL+C pour revenir du rapport]"
		echo "       [ 2 ]  INFOS détaillées réseau   [CTRL+C pour revenir du rapport]" 
		echo -e "\e[95m"
		echo "       [ 3 ]  Redémarrage WIFI "
		echo "       [ 4 ]  Mise a off de de la mise en veille auto WIFI "
		echo -e "\e[94m"
		echo "       [ 5 ]  Quitter sans rien modifier "
		echo -e "\e[0m"
	read -p "Choix: " answer
	
	case $answer in
	
	"1") #
			echo "INFO réseau"
		nmcli
			echo $FAIT
		read whisky
	;;
	
	"2") #
			echo "INFO DÉTAILLÉES réseau"
		nmcli device show
			echo $FAIT
		read whisky
	;;

	"3") #
			echo "Redémarrage WIFI en cours ...."
		wifi off && wifi on
			echo -e "\e[5m\e[92m"
			echo "    Redémarrage WIFI complété"
			echo $ENTER
		read whisky
	;;
	
 	"4") #Autosave
			echo "Etat mise en veille WIFI avant modif"
   		iw wlan0 get power_save	
    			echo "Mise a off WIFI"
      		sudo iw wlan0 set power_save off
   			echo "Etat mise en veille WIFI après modif"
   		iw wlan0 get power_save
			echo $ENTER
		read whisky
	;;

	*) 
			echo "    Fermeture du programme sans changement." 
			sleep 1
	;;
	esac
;;

S|s|VIT|vit) #test vitesse internet
	clear
		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE              V I T E S S E           $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE             I N T E R N E T          $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	SAUT
	sudo speedtest --bytes
 	speedtest #bit
		echo $ENTER 
		read sierra

;; 

ROOT|root) #ROOTKIT
	clear
		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE         Verification ROOTKIT         $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                                      $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	SAUT
  	
		echo -e "\e[93m                  (chkrootkit + rkhunter) "
		
	sudo chkrootkit
	#sudo rkhunter -V --versioncheck
	sudo rkhunter --check --sk
		echo $FAIT
		echo $ENTER 
		read romeo
;;

C|c) #CLAMSHELL - ANTIVIRUS
	clear
  		SAUT && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE       Verification ANTIvirus         $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                                      $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	SAUT
  
		echo -e "\e[93m                          (ClamAV) "
		
		echo 'sudo freshclam'
	sudo freshclam
	#sudo wget https://database.clamav.net/daily.cvd
	#sudo cp daily.cvd /var/lib/clamav/
	#sudo systemctl start clamav-freshclam
		echo 'sudo clamscan -r --move=/home/$USER/VIRUS /home/$USER'
	sudo clamscan -r --move=/home/$USER/VIRUS /home/$USER
		echo $FAIT
		echo $ENTER;
	read charlie
;;

COW|cow) #COWSAY ET FORTUNE
	clear
		SAUT && echo $ENTETE
  		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE               C O W S A Y            $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                                      $highlight$RED   $CYAN   $GOLD   $nc"		
  		echo $ENTETE &&	SAUT
		echo " ==> Que veux-tu faire?"
		echo -e "\e[92m"
		echo ""
		echo "       [ 1 ]  Choisir ton animal et il te dira un fortune cookie  "
		echo ""
		echo "       [ 2 ]  Choisir ton animal et choisir ce qu'il dit "
		echo ""
		echo "          [ ENTER ]  retour sans rien changer "
		echo " "
		echo "                                              [cowsay -l && fortune | cowsay -f animal]"
	read -p "Choix: " answer
	
	case $answer in
	
	"1") #
		clear
			SAUT
			SAUT
		cowsay -l
			SAUT
		read -p "animal: " animal
		clear
			SAUT
   			SAUT
		fortune | cowsay -f $animal
			SAUT
			echo $ENTER
		read charlieoscar
	;;
	
	"2") #
		clear
			SAUT
			SAUT
		cowsay -l
			SAUT
		read -p "animal: " animal
			SAUT
		read -p "ce qu'il dira: " say
		clear
			SAUT
   			SAUT
		cowsay -f $animal $say
			SAUT
			echo $ENTER
		read charlieoscar
	;;

	*)
	;;
	esac
;;

q|Q|"") #QUIT - FERMETURE
	clear
	cd ~/
	source ~/.bashrc #redemarre le terminal
	exit
;;

*) # AUTRE
		echo -e "$hightlight$DARKRED   ==> Choix non valide, veuillez réessayer ...         "
		echo -e "   ==> Choix non valide, veuillez réessayer ...         "
		echo -e "   ==> Choix non valide, veuillez réessayer ...         $nc"
	sleep 1
;;

	esac
done
#Each case statement starts with the case keyword, followed by the case expression and the in keyword. The statement ends with the esac keyword.
#You can use multiple patterns separated by the | operator. The ) operator terminates a pattern list.
#A pattern can have special characters .
#A pattern and its associated commands are known as a clause.
#Each clause must be terminated with ;;.
#The commands corresponding to the first pattern that matches the expression are executed.
#It is a common practice to use the wildcard asterisk symbol (*) as a final pattern to define the default case. This pattern will always match.
#If no pattern is matched, the return status is zero. Otherwise, the return status is the exit status of the executed commands.
