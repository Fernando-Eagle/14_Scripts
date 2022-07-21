#!/bin/bash
#Atualiza pacotes apt, snap e limpará a memória swap com opções
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

Main() {
  clear
  echo -e "${fundoazul}Este script irá efetuar a atualização dos pacotes Apt, Snap e limpará a memória Swap ${NORMAL}"
  echo -e "${fundoazul}------------------------------------------------------------------------------------ ${NORMAL}"
  echo -e "${fundoazul}Opções:${NORMAL}"
  echo
  echo "[1] Atualizar pacotes Apt"
  echo "[2] Atualizar pacotes Snap"
  echo "[3] Atualizar pacotes Flatpak"
  echo "[4] Limpar memória Swap"
  echo "[5] Reinicializar"
  echo "[6] Sair"
  echo
  echo -n -e "${fundoazul}Qual a opção desejada? ${NORMAL}"
  read opcao
  case $opcao in
    1) Atualiza_apt ;;
    2) Atualiza_snap ;;
    3) Atualiza_flatpak ;;
    4) Limpa_swap ;;
    5) Reiniciar_sistema ;;
    6) clear; exit ;;
    *) echo -e "${fundovermelho}Opção desconhecida.${NORMAL}"; sleep 2 ; Main ;;
  esac
}

Atualiza_apt() {
clear
  echo -e "${fundovermelho}Iniciando a atualização dos pacotes apt:${NORMAL}"; sleep 2
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt dist-upgrade && sudo apt autoclean && sudo apt autoremove
  echo -e "${fundoazul}A atualização de pacotes apt efetuada com sucesso!${NORMAL}"
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
read voltar
  if [ $voltar = "S" ]; then
    Main
  elif [ $voltar = "n" ]; then
    clear; exit
  fi
  }

Atualiza_snap() {
clear
  echo -e "${fundovermelho}Iniciando a atualização dos pacotes snap:${NORMAL}"; sleep 2
sudo snap list && sudo snap refresh
  echo -e "${fundoazul}A atualização de pacotes snap efetuada com sucesso!${NORMAL}"
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
read voltar
  if [ $voltar = "S" ]; then
    Main
  elif [ $voltar = "n" ]; then
    clear; exit
  fi
  }

Atualiza_flatpak() {
clear
  echo -e "${fundovermelho}Iniciando a atualização dos pacotes flatpak:${NORMAL}"; sleep 2
flatpak update && flatpak list
  echo -e "${fundoazul}A atualização de pacotes snap flatpak efetuada com sucesso!${NORMAL}"
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
read voltar
  if [ $voltar = "S" ]; then
    Main
  elif [ $voltar = "n" ]; then
    clear; exit
  fi
  }

Limpa_swap() {
clear
  echo -e "${fundovermelho}Iniciando a limpeza da memória swap:${NORMAL}"; sleep 2
sudo swapoff -a && sudo swapon -a
  echo -e "${fundoazul}A a limpeza da memória swap foi efetuada com sucesso!${NORMAL}"
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
read voltar
if [ $voltar = "S" ]; then
  Main
elif [ $voltar = "n" ]; then
  clear; exit
fi
}

Reiniciar_sistema() {
clear
  echo -e "${fundovermelho}!!! CUIDADO, ESSA OPERAÇÃO REINICIARÁ TODO O SISTEMA !!!${NORMAL}"; sleep 2
  echo -n -e "${fundovermelho}Tem certeza que quer reinicializar? (S/n)${NORMAL}"
read certeza
if [ $certeza = "n" ]; then
  Main
elif [ $certeza = "S" ]; then
  sudo reboot
fi
}

Main
