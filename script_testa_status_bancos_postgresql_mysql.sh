#!/bin/bash
# Testa a atividade dos banco PostgreSQL e MySQL/MariaDB
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#18/03/2019
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
echo -e "${amarelo} Vamos testar se o banco de dados PostgreSQL está ativo${NORMAL}"
echo -e "${verdeclaro} ------------------------------------------------------${NORMAL}"
sleep 3
sudo systemctl status postgresql@10-main.service && sudo systemctl status postgresql.service && sudo systemctl postgresql-10.service
sleep 3
clear
echo -e "${amarelo} Vamos testar se o banco de dados MySQL/MariaDB está ativo${NORMAL}"
echo -e "${verdeclaro} ------------------------------------------------------${NORMAL}"
sleep 3
sudo systemctl status mysqld.service && sudo systemctl status mysql.service

echo -e "${amarelo} Fim do script${NORMAL}"
echo -e "${verdeclaro} -------------${NORMAL}"
