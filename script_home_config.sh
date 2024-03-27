#!/bin/bash
#Configura a pasta /home em outra partição
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#16/06/2022
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

#Faz a verificação das unidades de disco, por partição no sistema
clear
echo "${fundoazul}Este Script irá guiá-lo para Configurar a pasta "/home" em outra partição${NORMAL}"

sudo blkid 


