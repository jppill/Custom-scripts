 # Mise à jour des ALIAS
 ## Faire copier-coller dans le fichier suivant: kate ~/.bash_aliases

alias update='bash ~/Documents/Github/update_apt_jp.sh' \
alias sd="shutdown 0" \
alias rb="reboot" \
alias hello="source ~/.bashrc" \
alias bashrc="kate ~/.bashrc" \
alias aliases="kate ~/.bash_aliases" \
alias update_jp="kate ~/Documents/Github/update_apt_jp.sh" \
alias alsa_reset="sudo alsa force-reload" \
alias commande_son="sudo fuser -v /dev/snd/*" \
alias info_son="pactl info" \
alias processes="ps aux" \
alias github="cd ~/Documents/Github/ && git pull scripts-gh main && cd && hello "

alias info="neofetch" #machine_info

alias sp="speedtest --bytes" \
#alias speed=" \
#echo "speedtest --list" \
#speedtest --list \
#echo '   ==»  Test avec quel serveur? ' \
#read Serveur \
#speedtest --bytes --server $Serveur \
#"
