#!/bin/bash

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
  echo "1. Atualizar pacotes Apt"
  echo "2. Atualizar pacotes Snap"
  echo "3. Limpar memória Swap"
  echo "4. Reinicializar"
  echo "5. Sair"
  echo
  echo -n -e "${fundoazul}Qual a opção desejada? ${NORMAL}"
  read opcao
  case $opcao in
    1) Atualiza_apt ;;
    2) Atualiza_snap ;;
    3) Limpa_swap ;;
    4) Reiniciar_sistema ;;
    5) clear; exit ;;
    *) echo -e "${fundovermelho}Opção desconhecida.${NORMAL}"; sleep 2 ; Main ;;
  esac
}

Atualiza_apt() {
clear
  echo -e "${fundovermelho}Iniciando a atualização dos pacotes apt:${NORMAL}"; sleep 2
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove
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
  echo -e "${fundovermelho}Tem certeza que quer reinicializar? (S/n)${NORMAL}"; sleep 2
read certeza
if [ $certeza = "n" ]; then
  Main
elif [ $certeza = "S" ]; then
  sudo reboot
fi
}

Main
