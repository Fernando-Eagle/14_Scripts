#!/bin/bash
#Atualiza pacotes apt, snap e limpará a memória swap
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#16/07/2022
#https://https://github.com/Fernando-Eagle/shell_scripts

#Variáveis de cores
vermelho="\033[1;31m"
azul="\033[1;34m"
amarelo="\033[1;33m"
verdeclaro="\033[1;32m"
fundoazul="\033[44;1;37m"
fundovermelho="\033[41;1;37m"
fundopurple="\033[45;1;37m"
NORMAL="\033[m"

clear
  echo -e "${fundoazul}Este script irá efetuar a atualização dos pacotes Apt, Snap, Flatpak e limpará a memória Swap ${NORMAL}"
  echo -e "${fundoazul}------------------------------------------------------------------------------------ ${NORMAL}"
  echo -e "${fundovermelho}Iniciando a atualização dos pacotes apt:${NORMAL}"; sleep 5
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt dist-upgrade && sudo apt autoclean && sudo apt autoremove

clear
  echo -e "${fundoazul}A atualização de pacotes apt efetuada com sucesso!${NORMAL}"
  echo -e "${fundovermelho}Iniciando a atualização dos pacotes snap:${NORMAL}";
sudo snap refresh && sudo snap list
sleep 5

clear
  echo -e "${fundoazul}A atualização de pacotes snap efetuada com sucesso!${NORMAL}"
  echo -e "${fundovermelho}Iniciando a atualização dos pacotes flatpak:${NORMAL}";
flatpak update && flatpak list
sleep 5

clear
  echo -e "${fundoazul}A atualização de pacotes snap efetuada com sucesso!${NORMAL}"
  echo -e "${fundovermelho}Iniciando a limpeza da memória swap:${NORMAL}"; sleep 2
sudo swapoff -a && sudo swapon -a

clear
whoami
echo -e "${fundoazul}A atualização foi efetuada com sucesso!${NORMAL}"
echo -e "${amarelo}Info hora atual e tempo de ligado:${NORMAL}"
uptime
echo -e "${fundopurple} O script está rodando no diretório:${NORMAL}"  && pwd
echo -e "${fundoazul} Fim da atualização ${NORMAL}"
