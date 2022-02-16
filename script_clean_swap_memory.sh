#!/bin/bash
#Efetua limpeza da memória swap em Linux Debian based
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#30/03/2021
#Base de conhecimento: https://davibackendorf.medium.com/como-limpar-a-memória-swap-no-ubuntu-e-derivados-db91dfe289cb
#Repo: https://github.com/Fernando-Eagle/shell_scripts

#Variáveis de cores
vermelho="\033[1;31m"
azul="\033[1;34m"
amarelo="\033[1;33m"
verdeclaro="\033[1;32m"
fundoazul="\033[44;1;37m"
fundovermelho="\033[41;1;37m"
fundopurple="\033[45;1;37m"
NORMAL="\033[m"

Principal() {
  clear
  echo -e "${amarelo}Este Script efetua a limpeza abrupta da memória SWAP${NORMAL}"
  echo -e "${amarelo}--------------------------------------------------------${NORMAL}"
  echo -e "${fundoazul}Opções:${NORMAL}"
  echo
  echo "1. Mostra o status da memória"
  echo "2. Limpar memória SWAP"
  echo "3. Sair"
  echo
  echo -n -e "${fundoazul}Qual a opção desejada? ${NORMAL}"
  read opcao
  case $opcao in
    1) Memoria ;;
    2) Reinicializar ;;
    3) clear; exit ;;
    *) echo -e "${fundovermelho}Opção desconhecida.${NORMAL}"; sleep 2 ; Principal ;;
  esac
}

Memoria() {
  clear
    echo -e "${fundopurple}Verificando condições da memória agora...${NORMAL}"
    sudo free
    echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
    read voltar
    if [ $voltar = "S" ]; then
      Principal
    elif [ $voltar = "n" ]; then
      clear; exit
    fi

}

Reinicializar() {
  clear
  sudo swapoff -a && sudo swapon -a
  echo -e "${amarelo}Reinicializando a memória SWAP agora...${NORMAL}"
  sleep 3
  clear
  Principal
}

Principal
