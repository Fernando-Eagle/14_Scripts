#!/bin/bash
#verifica a existencia de diretório e caso contrário cria o mesmo
#Marcio Mendes
#www.conectadohost.com
#baseado na resposta postada em: https://www.vivaolinux.com.br/topico/Shell-Script/Criar-diretorio-se-nao-houver
#25/07/2016 - Última atualização 13/03/2019

#Variáveis de cores
vermelho="\033[1;31m"
azul="\033[1;34m"
amarelo="\033[1;33m"
verdeclaro="\033[1;32m"
fundoazul="\033[44;1;37m"
fundovermelho="\033[41;1;37m"
NORMAL="\033[m"

if [ -e "/home/fernando/Downloads/Backup" ]
then
echo -e "${fundoazul}o diretorio existe${NORMAL}"
else
echo -e "${fundovermelho}o diretorio não existe e vamos criar o diretorio${NORMAL}"
mkdir /home/fernando/Downloads/Backup
fi
exit
