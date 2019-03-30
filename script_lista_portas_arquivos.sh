#!/bin/bash
#Lista portas e arquivos existentes no micro
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#24/03/2019
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

#Função Principal
Principal() {
  clear
  echo "Bem vindo ao meu Script"
  echo "Escolha uma das opções abaixo"
  echo
  echo "[1] Listar as portas do seu computador"
  echo "[2] Listar os arquivos do diretório atual"
  echo "[3] Sair"
  echo
  echo -n -e "${fundoazul}Digite a opção: ${NORMAL}"
  read opcao
  case $opcao in
    1) ListaPortas ;;
    2) ListaArquivos ;;
    3) clear; exit ;;
    *) echo -e "${fundovermelho}Opção desconhecida.${NORMAL}"; sleep 2 ; Principal ;;
  esac
}

#Demais funções
ListaPortas() {
  clear
    echo -e "${amarelo}Listando as portas agora...${NORMAL}"
    sudo nmap -sS localhost
    echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
    read voltar
    if [ $voltar = "S" ]; then
      Principal
    elif [ $voltar = "n" ]; then
      clear; exit
    fi
}

ListaArquivos() {
  clear
  echo -e "${amarelo}Listando os arquivos agora...${NORMAL}"
  ls -l
  echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
  read voltar
  if [ $voltar = "S" ]; then
    Principal
  elif [ $voltar = "n" ]; then
    clear; exit
  fi
}

Principal
