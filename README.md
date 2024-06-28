# Regroupement de scripts de jppill
Scripts pour usage perso
________________________________________
# Prérequis
> Connaissance de base du terminal - SHELL \
> Suivre la «PROCÉDURE pour installer les scripts localement» plus bas
________________________________________

## [ALIAS](ALIAS)
> Liste d'alias a installer manuellement selon les instructions

## [REINSTALLATION](REINSTALLATION)
> Pour bien partir une nouvelle installation de type DEBIAN - Linux

## [UPDATERjp](UPDATERjp)
> Gestionnaire Linux Debian via terminal pour mise a jour (APT/NALA-SNAP-FLATPAK) et autres options pratiques
>   - APT/NALA SNAP FLATPAK
>   - ClamAV antivirus + ROOTkit
>   - Nord VPN
>   - Wifi - reboot
>   - Son (alsamixer)
>   - Modif système de démarrage: Systemd ou sysVinit
>   - Info système et batterie
>   - Cowsay pour s'amuser avec le terminal
________________________________________

# PROCÉDURE pour installer les scripts localement
### La mise à jour (sync) des scripts sera automatique en utilisant l'[UPDATERjp](UPDATERjp) (Option M du menu)
**_alternative_** Inscrire manuellement dans le terminal:
> cd ~/Documents/Github/ && git pull scripts-gh main && cd && hello \

**_Ctrl+Shift+v pour coller dans le terminal_**
## Applications requise dans les scripts
Inscrire dans le terminal:
> sudo apt install -y nala git neofetch lolcat cowsay fortune clamav chkrootkit rkhunter snapd flatpak tlp kate alsa-utils

## Installer git sur Linux
> sudo apt install git -y

## Comment relier **_GIT_** et **_Linux_** [*[1]*](https://www.freecodecamp.org/news/create-and-sync-git-and-github-repositories/)
- Création d'un dossier «Github» dans Documents:
> ./Documents/Github/
- Aller dans ce dossier via le terminal (cd ./Documents/Github/), puis envoyer la commande:
> git init
- Copier l'adresse du repository (sur le site web [github](https://github.com/)) et inscrire dans le terminal:
> git remote add scripts-gh https://github.com/jppill/Custom-scripts.git 

- Vérifier le lien créé (en étant encore dans le bon dossier sur le terminal):
> git remote

- Faire venir les fichiers de Github dans le dossier local Github avec la fonction PULL \
  Cette commande s'inscrit dans le terminal, t'amène dans le bon répertoire, met a jour, puis retourne dans le répertoire initial
  
  > cd ~/Documents/Github/ && git pull scripts-gh main && cd \
  
  Pour la première mise à jour, à ajouter à la fin de la commande **_pull_**
  > --allow-unrelated-histories \

- git config --global user.name "*your_name*"
- git config --global user.email "*your_email*"
- git config --global --list

  
\[1]: *https://www.freecodecamp.org/news/create-and-sync-git-and-github-repositories/*
