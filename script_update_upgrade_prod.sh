#!/bin/bash
#Atualiza pacotes apt, flatpack e snap
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#Lançamento: 16/07/2022
#Atualização: 27/08/2023
#https://https://github.com/Fernando-Eagle/shell_scripts

#Variáveis de Sistema
nome_sistema="Script de Atualização De Sistema Linux Debian based"
autor_sistema="Autor: Fernando'Eagle' De Sousa"
versao_sistema="Versao 1.0"

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
# Exibindo o valor das variaveis de sistema
echo -e ${fundoazul}$nome_sistema ${NORMAL}
echo -e ${fundoazul}$autor_sistema ${NORMAL}
echo -e ${fundoazul}$versao_sistema ${NORMAL}
# Fim da exibição das variaveis de sistema

  echo -e "${fundoazul}Este script irá efetuar a atualização dos pacotes Apt, Snap, Flatpak e limpará a memória Swap ${NORMAL}"
  echo -e "${fundoazul}--------------------------------------------------------------------------------------------- ${NORMAL}"
  echo -e "${fundopurple}Iniciando a atualização dos pacotes apt:${NORMAL}"
  echo -e "${fundopurple}Iniciando o comando apt update:${NORMAL}"
#sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt dist-upgrade && sudo apt autoclean && sudo apt autoremove

sudo apt update

  echo -e "${fundoazul}Comando apt update efetuado com sucesso!${NORMAL}"; sleep 3
clear
# Exibindo o valor das variaveis de sistema
echo -e ${fundoazul}$nome_sistema ${NORMAL}
echo -e ${fundoazul}$autor_sistema ${NORMAL}
echo -e ${fundoazul}$versao_sistema ${NORMAL}

  echo -e "${fundovermelho}Iniciando o comando apt list --upgradable${NORMAL}"; sleep 3

sudo apt list --upgradable

  echo -e "${fundoazul}Comando apt list --upgradable efetuado com sucesso!${NORMAL}"; sleep 3
clear
# Exibindo o valor das variaveis de sistema
echo -e ${fundoazul}$nome_sistema ${NORMAL}
echo -e ${fundoazul}$autor_sistema ${NORMAL}
echo -e ${fundoazul}$versao_sistema ${NORMAL}
# Fim da exibição das variaveis de sistema
  echo -e "${fundovermelho}Iniciando o comando apt upgrade${NORMAL}"; sleep 3

sudo apt upgrade

  echo -e "${fundoazul}Comando apt upgrade efetuado com sucesso!${NORMAL}"
  echo -e "${fundovermelho}Iniciando o comando apt dist-upgrade${NORMAL}"; sleep 3

sudo apt dist-upgrade

  echo -e "${fundoazul}Comando apt dist-upgrade efetuado com sucesso!${NORMAL}"
  echo -e "${fundovermelho}Iniciando o comando apt autoclean${NORMAL}"; sleep 3

sudo apt autoclean

  echo -e "${fundoazul}Comando apt autoclean efetuado com sucesso!${NORMAL}"
  echo -e "${fundovermelho}Iniciando o comando apt autoremove${NORMAL}"; sleep 3

sudo apt autoremove

  echo -e "${fundoazul}Comando apt autoremove efetuado com sucesso!${NORMAL}"; sleep 3

clear
# Exibindo o valor das variaveis de sistema
echo -e ${fundoazul}$nome_sistema ${NORMAL}
echo -e ${fundoazul}$autor_sistema ${NORMAL}
echo -e ${fundoazul}$versao_sistema ${NORMAL}
# Fim da exibição das variaveis de sistema
  echo -e "${fundoazul}A atualização de pacotes apt efetuada com sucesso!${NORMAL}"
  echo -e "${fundovermelho}Iniciando a atualização dos pacotes snap:${NORMAL}";
sudo snap refresh && sudo snap list
sleep 5

clear
# Exibindo o valor das variaveis de sistema
echo -e ${fundoazul}$nome_sistema ${NORMAL}
echo -e ${fundoazul}$autor_sistema ${NORMAL}
echo -e ${fundoazul}$versao_sistema ${NORMAL}
# Fim da exibição das variaveis de sistema
  echo -e "${fundoazul}A atualização de pacotes snap efetuada com sucesso!${NORMAL}"
  echo -e "${fundovermelho}Iniciando a atualização dos pacotes flatpak:${NORMAL}";
flatpak update && flatpak list
sleep 5

#clear
# echo -e "${fundoazul}A atualização de pacotes snap efetuada com sucesso!${NORMAL}"
# echo -e "${fundovermelho}Iniciando a limpeza da memória swap:${NORMAL}"; sleep 2
#sudo swapoff -av && sudo swapon -av

clear
# Exibindo o valor das variaveis de sistema
echo -e ${fundoazul}$nome_sistema ${NORMAL}
echo -e ${fundoazul}$autor_sistema ${NORMAL}
echo -e ${fundoazul}$versao_sistema ${NORMAL}
# Fim da exibição das variaveis de sistema
echo -e "${fundoazul}A atualização foi efetuada com sucesso!${NORMAL}"
echo -e "${amarelo}Usuário logado:${NORMAL}"; whoami
echo -e "${amarelo}Info hora atual e tempo de ligado:${NORMAL}"; uptime
echo -e "${amarelo}O script está rodando no diretório:${NORMAL}"  && pwd
echo -e "${fundopurple} Fim da atualização ${NORMAL}"
