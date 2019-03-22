#!/bin/bash
#reinicializa os serviços smbd e nmbd do samba
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#22/03/2019
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

# Limpa a tela e verifica se os serviços estão ativos
clear
echo -e "${amarelo}Este Script irá reinicializar todos os serviços do SAMBA${NORMAL}"
echo -e "${azul}Verificando se os serviços estão ativos${NORMAL}"
sudo systemctl status nmbd.service && sudo systemctl status smbd.service
sleep 3

echo -e "${fundovermelho}Backup finalizado e salvo em ${fundoazul}'/home/$USER/Downloads/Backup/$DATA'${NORMAL}"
echo -e "${amarelo} Info hora atual e tempo de ligado:${NORMAL}"
uptime
echo -e "${amarelo} O script está rodando no diretório:${NORMAL}"  && pwd
echo -e "${fundopurple}Fim do backup${NORMAL}"
