#!/bin/bash
# immulator : https://repl.it/repls/DarkgreyMustyEmulation#main.sh
#source ~/.bashrc
scriptjp="~/Documents/Github/update_apt_jp.sh" #Installer le script à cet endroit
#Couleurs - Liste couleurs sur bash: https://misc.flogisoft.com/bash/tip_colors_and_formatting
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
#Spécial - fonctionne qu'avec les couleurs en GRAS
	fade="\e[2m" #plus pale
	italic="\e[3m" #italique
	underline="\e[4m" #sousligne
	blink="\e[5m" #clignote
	highlight="\e[7m" #surligne
#Mise-en-page
	FAIT="-e $blink$GREEN    FAIT   $nc"
	ENTER="-e $blink$YELLOW [ ENTER ] $nc"
	ENTETE="-e $darkgreen========================================================== $nc"
 
afficher_menu(){
	clear
		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$GOLD          U P D A T E R j p           $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$CYAN            Gestion L I N U X         $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE #&& echo ""
		echo -e "$BLACK       S E C U R I T E                                $nc"
		echo -e "$italic$CYAN[ M ]$nc $highlight$CYAN MAJ + nettoyage (NALA/APT-SNAP-FLATPAK) $nc"
		echo -e "[ C ] Vérification ANTIVIRUS ClamAV"
		echo -e "[ ROOT ] #Vérification ROOTKIT [chkrootkit + rkhunter]"
  		echo -e ""
		echo -e "$BLACK       P A R A M E T R E S                            $nc"
		echo -e "[ V ] Vérification et démarrage NORDVPN"
		echo -e "[ W ] Gestion WIFI"
		echo -e "$italic$CYAN[ S ]$nc $highlight$BLUE Test de vitesse et choix serveur MAJ-NALA $nc"
		echo -e "[ A ] ALSAMIXER (ajuste son du terminal)"
		echo -e "[ D ] Systemd ou sysVinit [choix système de démarrage]" 
		echo -e "[ R ] REDSHIFT config (éclairage de nuit)"
  		echo -e ""
		echo -e "$BLACK       I N F O                                        $nc"
		echo -e "[ I ] INFO Système/batterie TLP"
		echo -e "[ L ] Liste ALIAS perso"
  		echo -e ""
		echo -e "$BLACK       A U T R E                                      $nc"
		echo -e "[ COW ] COWSAY game"
		echo -e "$PURPLE[ Q ] QUITTER $italic ou juste appuyer [enter] $nc"
		echo ""
	}
	
while true; do
	afficher_menu
	read -p "Choix: " CHOIX

case $CHOIX in

M|m) #MISE A JOUR
	clear
		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE             MISE A JOUR              $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE            S Y S T E M E             $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	echo ""
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
#SNAP		
		echo $ENTETE
		echo -e "$GOLD                     Mise à jour SNAP       "
		echo -e "               (sudo snap refresh ; --time)  $nc"
		echo $ENTETE
	sudo snap refresh
	sudo snap refresh --time
		echo $FAIT
#FLATPAK
		echo $ENTETE
		echo -e "$GOLD                     Mise à jour Flatpak "
		echo -e "             (sudo flatpak update & list --app) $nc"
		echo $ENTETE
	sudo flatpak list --app
	sudo flatpak -y update
		echo $FAIT
#GITHUB
		echo $ENTETE
		echo -e "$GOLD                     Mise à jour GitHub $nc"
		echo $ENTETE
	cd ~/Documents/Github/ && git pull scripts-gh main 
		echo -e "$italic$PURPLE....Vérification fichiers Github $nc"
	git status 
	cd ~/
		echo $FAIT
#NETTOYAGE
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
		echo $ENTER
	read mike
;;

S|s) #Choix serveurs-vitesse
	clear
		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE           TEST DE VITESSE            $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE           S E R V E U R S            $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE && echo ""
	sudo nala fetch
;;

V|v) #NORDVPN
	clear 
		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                N O R D               $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                V  P  N               $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE && echo ""
	nordvpn version
		echo ""
	sudo systemctl start nordvpnd
	nordvpn settings
		echo $ENTER
	read victor
	clear 
		echo $ENTETE
		echo -e "$GOLD                           NordVPN $nc"
		echo $ENTETE
	nordvpn version
		echo ""   
	nordvpn account
		echo ""
	nordvpn status
		echo " "
		echo "  ==> Lancement de la connection nordvpn? [o/n/d]"
		echo "      (oui,non,disconnect)"
		read -p "Choix: " answer
		
	case $answer in
	
	o|O|c|C)
		sudo nordvpn c
		sudo nordvpn status
			echo $FAIT
			echo $ENTER
		read victor
		#continue
	;;
	
	#n|N)
		#continue
	#;;
	
	d|D) #elif [ $answer = d ]
		#then
		sudo nordvpn d
		sudo nordvpn status
			echo $FAIT
			echo $ENTER
		read victor
		#continue
	;;
	
	*)
	;;
	
	esac
	#done
#continue
;;
    
L|l) #liste Aliases
	clear
 		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE               L I S T E              $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                    ALIAS             $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	echo ""
		echo -e "$DARKGREEN"
		echo ""
		echo ""
		echo ""
		echo ""
		echo "Quitter le script en appuyant sur [ENTER] et écrire « alias » dans le terminal"
		echo ""
		echo -e -n "retour automatique au menu précédent (5..." && sleep 1s && echo -n "4..." && sleep 1s && echo -n "3..." && sleep 1s && echo -n "2..." && sleep 1s && echo -n "1sec)" && sleep 1s
  		echo -e "$nc"
;;

D|d) #système de démarrage
	clear
		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE      Demarrage par defaut avec       $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE        systemD ou sysVinit?          $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE && echo ""		
		echo " ==> Que veux-tu faire?"
		echo -e "\e[92m"
		echo ""
		echo "       [ d ]  systemD par default "
		echo ""
		echo "                  Systemd est actuellement le standard le plus utilisé en termes de \"Kernel Boot Systems\" (Init) qui peut être réalisé dans les environnements Unix, tels que Linux. Démarre les processus en parallèle. Plus lourd, plus d'accès que sysVinit."
		echo ""
		echo ""
		echo "       [ v ]  sysVinit par default "
		echo ""
		echo "                  SysVinit est l'un des plus anciens et actuels Administrateurs de systèmes et services pour systèmes basés sur Linux. Il est encore largement utilisé sur de nombreux Distros GNU / Linux de trajectoires, et de nouvelles, comme Devuan. Démarre les processus en série. Très petit script et demande peu d'accès aux processus."
		echo " "
		echo ""
		echo "       [ ENTER ]  retour sans rien changer "
		echo " "
	read -p "Choix: " answer
	case $answer in
	d|D) #if [ $answer = d ]
		#then
		sudo apt install systemd-sysv
			echo -e "\e[5m\e[92m"
			echo "systemD par DEFAULT"
			echo $ENTER
		read delta
	;;
	
	v|V) #elif [ $answer = v ]
		#then
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
  		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE             I N F O SYSTEME          $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE             &   A U T R E S          $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	echo "" && echo " " 
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
	
	c|C) #if [ $answer = c ]
	#then
		gkbd-keyboard-display -g 1
			echo $FAIT
			echo $ENTER
		read India
	;;
	
	i|I) #elif [ $answer = i ]
	#then
		clear
			echo "" && echo $ENTETE
			echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE       Info Système/batterie TLP      $highlight$RED   $CYAN   $GOLD   $nc"
			echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE            (tlp-stat -s)             $highlight$RED   $CYAN   $GOLD   $nc"
			echo $ENTETE &&	echo ""		
		sudo nala install tlp
  		sudo tlp-stat -s # état système et batterie
			echo ""
		cat /etc/os-release
			echo $ENTER
		read india
	;;
	
	*)
	;;
	esac
;;

R|r) #REDSHIFT
			echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE               REDSHIFT               $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                                      $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	echo ""	
  	echo "Redshift"
	kate /home/jp/.config/redshift.conf
;;

A|a) # SON
	alsamixer
;;

W|w) #WIFI
	clear
  		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE              G E S T I O N           $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE              W   I   F   I           $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	echo "" && echo " " 		
		echo " ==> Que veux-tu faire?"
		echo -e "\e[92m"
		echo "       [ 1 ]  INFOS réseau              [CTRL+C pour revenir du rapport]"
		echo "       [ 2 ]  INFOS détaillées réseau   [CTRL+C pour revenir du rapport]" 
		echo -e "\e[95m"
		echo "       [ 3 ]  Redémarrage WIFI "
		echo "       [ 4 ]   "
		echo -e "\e[94m"
		echo "       [ 5 ]  Quitter sans rien modifier "
		echo -e "\e[0m"
	read -p "Choix: " answer
	
	case $answer in
	
	"1") #if [ $answer -eq 1 ]
		#then
			echo "INFO réseau"
		nmcli
			echo $FAIT
		read whisky
	;;
	
	"2") #elif [ $answer -eq 2 ]
	#then
			echo "INFO DÉTAILLÉES réseau"
		nmcli device show
			echo $FAIT
		read whisky
;;

	"3") #elif [ $answer -eq 3 ]
	#then
			echo "Redémarrage WIFI en cours ...."
		wifi off && wifi on
			echo -e "\e[5m\e[92m"
			echo "    Redémarrage WIFI complété"
			echo $ENTER
		read whisky
	;;

	*) 
			echo "    Fermeture du programme sans changement." 
			sleep 1
	;;
	esac
;;

ROOT|root) #ROOTKIT
	clear
		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE         Verification ROOTKIT         $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                                      $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	echo ""
  	
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
  		echo "" && echo $ENTETE
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE       Verification ANTIvirus         $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                                      $highlight$RED   $CYAN   $GOLD   $nc"
		echo $ENTETE &&	echo ""
  
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
		echo "" && echo $ENTETE
  		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE               C O W S A Y            $highlight$RED   $CYAN   $GOLD   $nc"
		echo -e " $highlight$GOLD   $CYAN   $RED   $nc$BLUE                                      $highlight$RED   $CYAN   $GOLD   $nc"		
  		echo $ENTETE &&	echo ""
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
	
	"1") #if [ $answer = 1 ]
	#then
		clear
			echo ""
			echo ""
		cowsay -l
			echo ""
		read -p "animal: " animal
		clear
			echo ""
			echo ""
		fortune | cowsay -f $animal
			echo "" 
			echo $ENTER
		read charlieoscar
	;;
	
	"2") #elif [ $answer = 2 ]
	#then
		clear
			echo ""
			echo ""
		cowsay -l
			echo ""
		read -p "animal: " animal
			echo ""
		read -p "ce qu'il dira: " say
		clear
			echo ""
			echo ""
		cowsay -f $animal $say
			echo "" 
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
