# Fichier de mise à jour custom de jppill
Mise à jour de distribution **DEBIAN** Linux via APT-NALA et autres surprises (version Française)
________________________________________
# Prérequis
Installation de certaines applications
> sudo apt install -y nala git neofetch lolcat cowsay fortune clamav chkrootkit rkhunter snapd flatpak tlp kate alsa-utils
________________________________________

## Installer git sur Linux
> sudo apt install git -y

## Comment relier **_GIT_** and **_Linux_** [*[1]*](https://www.freecodecamp.org/news/create-and-sync-git-and-github-repositories/)
- Création d'un dossier «Github» dans Documents (nom au choix):
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

[Titre]: # (Comme en HTML, il existe 6 niveaux de titres, qui se composent comme ceci 
#Titre 1 ##Titre 2 ...###### Titre 6 Attention, il faut toujours ajouter un espace entre “#” et le texte )
[style]: # (SANS ESPACE _italique_ **gras** **_gras/italique_** ~~barré~~)
[Citation]: # (Une citation doit être précédée du signe “>” )
