#!/bin/bash
#Atribui variaveis e depois as mostra
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#25/08/2023
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
# Atribuindo os valores das Variáveis que alimentarão as sentenças
nome_sistema="Script de Atualização De Sistema"
autor_sistema="Autor: Fernando'Eagle' De Sousa"

clear
# Exibindo o valor das variaveis
echo -e ${fundoazul}$nome_sistema ${NORMAL}
echo -e ${fundoazul}$autor_sistema ${NORMAL}
sleep 2
