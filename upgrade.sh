#!/bin/bash

function banner {
orange='\033[0;33m'
sleep 4 && clear
printf "${orange}
██   ██ ██ ██ ██████   ██████   ██████  ██████  ██ ███    ██ 
██  ██  ██ ██ ██   ██ ██    ██ ██      ██    ██ ██ ████   ██ 
█████   ██ ██ ██████  ██    ██ ██      ██    ██ ██ ██ ██  ██ 
██  ██  ██ ██ ██   ██ ██    ██ ██      ██    ██ ██ ██  ██ ██ 
██   ██ ██ ██ ██   ██  ██████   ██████  ██████  ██ ██   ████"
printf "\n"
printf "
███    ███  █████  ███████ ████████ ███████ ██████  ███    ██  ██████  ██████  ███████ 
████  ████ ██   ██ ██         ██    ██      ██   ██ ████   ██ ██    ██ ██   ██ ██      
██ ████ ██ ███████ ███████    ██    █████   ██████  ██ ██  ██ ██    ██ ██   ██ █████   
██  ██  ██ ██   ██      ██    ██    ██      ██   ██ ██  ██ ██ ██    ██ ██   ██ ██      
██      ██ ██   ██ ███████    ██    ███████ ██   ██ ██   ████  ██████  ██████  ███████"
printf "\n"
printf "
██    ██ ██████   ██████  ██████   █████  ██████  ███████    
██    ██ ██   ██ ██       ██   ██ ██   ██ ██   ██ ██         
██    ██ ██████  ██   ███ ██████  ███████ ██   ██ █████      
██    ██ ██      ██    ██ ██   ██ ██   ██ ██   ██ ██         
 ██████  ██       ██████  ██   ██ ██   ██ ██████  ███████"
printf ""
sleep 2
}

hr="\n\n****************************************************************************************\n\n";
# Check if user is root
if [ "$EUID" -ne 0 ]
  then banner; printf ""; root=0; printf "${hr}WARNING${hr}"; printf ""; printf "User is not root.\n\n"; printf "Script may fail with some operations if current user is not in sudo group or configured correctly.";sleep 4;
fi
banner
printf "${hr}Updating & Installing unzip${hr}"
sudo apt update && sudo apt-get install unzip -f
printf "Downloading V1.0.0.4 Kiiro wallet"
sudo rm -rf ~/v1.0.0.4 && wget github.com/Kiirocoin/kiiro/releases/download/v1.0.0.4/kiirocoin-1.0.0.4-linux-18.04.zip 
printf "${hr}Done${hr}"
banner
printf "${hr}Unzipping${hr}"
unzip kiirocoin-1.0.0.4-linux-18.04.zip -d ~/v1.0.0.4 -x kiirocoin-tx kiirocoin-qt
printf "${hr}Done${hr}"
banner
printf "${hr}Chmod files as executable${hr}"
sudo chmod +x ~/v1.0.0.4/*
printf "${hr}Done${hr}"
banner
printf "${hr}Stopping kiirocoind service and waiting 15 seconds${hr}"
sudo systemctl stop kiirocoind.service
sleep 15
printf "${hr}Done${hr}"
banner
printf "${hr}Moving files to /usr/bin${hr}"
sudo mv -f ~/v1.0.0.4/kiirocoin-cli /usr/bin && sudo mv -f ~/v1.0.0.4/kiirocoind /usr/bin
printf "${hr}Done${hr}"
banner
printf "${hr}Removing old files${hr}"
sudo rm -rf ~/v1.0.0.4 && rm -f kiirocoin-1.0.0.4-linux-18.04.zip
printf "${hr}Done${hr}"
banner
printf "${hr}Upgrade of Masternode to V1.0.0.4 is complete.\n\n"
printf "Starting Masternode and waiting 15 seconds\n\n"
sudo systemctl start kiirocoind.service
sleep 15
printf "Running kiirocoin-cli evoznode status\n\n"
kiirocoin-cli evoznode status
printf "\n\nIf you do not see ready then run the following command again in 30 minutes:\n\n"
printf "kiirocoin-cli evoznode status\n\n"
printf "If you are receiving an error, you may have not properly registered Masternode or entered wrong information in beginning of install script\n\n"
printf "Reach out to us on Discord if you need any help\n\n"
printf "https://discord.gg/g88D2RP9\n\n"
