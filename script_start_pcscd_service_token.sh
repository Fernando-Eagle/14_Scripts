#!/bin/bash
#Verifica o status dos serviços pcscd.socket e pcscd.service
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
  echo -e "${fundoazul}Este script irá checar o status, iniciar ou reiniciar o serviço pcscd para tokens ${NORMAL}"
  echo -e "${fundoazul}------------------------------------------------------------------------------------ ${NORMAL}"
  echo -e "${fundoazul}Opções:${NORMAL}"
  echo
  echo "[1] Verificar status pcscd.service"
  echo "[2] Verificar status pcscd.socket"
  echo "[3] Iniciar serviço pcscd"
  echo "[4] Reinicializar serviço pcscd"
  echo "[5] Parar serviço pcscd"
  echo "[6] Sair"
  echo
  echo -n -e "${fundoazul}Qual a opção desejada? ${NORMAL}"
  read opcao
  case $opcao in
    1) Verificar_pcscdservice ;;
    2) Verificar_pcscdsocket ;;
    3) Iniciar_pcscd ;;
    4) Reiniciar_pcscd ;;
    5) Parar_pcscd ;;
    6) clear; exit ;;
    *) echo -e "${fundovermelho}Opção desconhecida.${NORMAL}"; sleep 2 ; Main ;;
  esac
}

Verificar_pcscdservice() {
clear
  echo -e "${fundovermelho}Verificando o status do pcscd.service:${NORMAL}"; sleep 2
sudo systemctl status pcscd.service
  echo -e "${fundoazul}O status do serviço pcscd pode ser visualizado acima!${NORMAL}"
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
read voltar
  if [ $voltar = "S" ]; then
    Main
  elif [ $voltar = "n" ]; then
    clear; exit
  fi
  }

Verificar_pcscdsocket() {
clear
  echo -e "${fundovermelho}Verificando o status do pcscd.socket:${NORMAL}"; sleep 2
sudo systemctl status pcscd.socket
  echo -e "${fundoazul}O status do socket pcscd pode ser visualizado acima!${NORMAL}"
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
read voltar
  if [ $voltar = "S" ]; then
    Main
  elif [ $voltar = "n" ]; then
    clear; exit
  fi
  }

Iniciar_pcscd() {
clear
  echo -e "${fundovermelho}Iniciando o serviço do pcscd.service:${NORMAL}"; sleep 2
sudo systemctl start pcscd.service
  echo -e "${fundoazul}O serviço pcscd foi reiniciado com sucesso!${NORMAL}"
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
read voltar
  if [ $voltar = "S" ]; then
    Main
  elif [ $voltar = "n" ]; then
    clear; exit
  fi
  }

Reiniciar_pcscd() {
clear
  echo -e "${fundovermelho}Reiniciando o serviço do pcscd.service:${NORMAL}"; sleep 2
sudo systemctl restart pcscd.service
  echo -e "${fundoazul}O serviço pcscd foi reiniciado com sucesso!${NORMAL}"
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
read voltar
  if [ $voltar = "S" ]; then
    Main
  elif [ $voltar = "n" ]; then
    clear; exit
  fi
  }

Parar_pcscd() {
clear
  echo -e "${fundovermelho}Parando o serviço do pcscd.service:${NORMAL}"; sleep 2
sudo systemctl stop pcscd.service
  echo -e "${fundoazul}O serviço pcscd foi parado com sucesso!${NORMAL}"
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
read voltar
  if [ $voltar = "S" ]; then
    Main
  elif [ $voltar = "n" ]; then
    clear; exit
  fi
  }

Main
