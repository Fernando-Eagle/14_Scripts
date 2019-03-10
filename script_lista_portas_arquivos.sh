#!/bin/bash

clear
echo "Bem vindo ao meu Script"
echo "Escolha uma das opções abaixo"
echo
echo "[1] Listar as portas do seu computador"
echo "[2] Listar os arquivos do diretório atual"
echo "[3] Sair"
echo -n "Digite a opção: "
read opcao
case $opcao in
1) sudo nmap -sS localhost
sleep 3
;;
2) ls -l
sleep 3
;;
3) exit
clear
;;esac
