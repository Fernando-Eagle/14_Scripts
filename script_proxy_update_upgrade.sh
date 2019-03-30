#!/bin/bash
#atualiza o sistema, através do proxy
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#27/03/2019
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
# Coletando os valores das Variáveis que alimentarão as sentenças
echo -e "${azul}Setando o proxy${NORMAL}"
echo -n -e "${amarelo}Qual o usuário do domínio (cuidado com maúsculas e minúsculas)?${NORMAL}"
read usuario
echo -n -e "${amarelo}Qual a senha do usuário (cuidado com maúsculas e minúsculas)?${NORMAL}"
read senha
echo -n -e "${amarelo}Qual o servidor de proxy (ex: proxy01)?${NORMAL}"
read proxy
echo -n -e "${amarelo}Qual o domínio (ex: dominio.com.br)?${NORMAL}"
read dominio
echo -n -e "${amarelo}Informe a porta alvo, ex: 3128${NORMAL}"
read porta

echo -e "${fundopurple}Abrindo tunelamento e efetuando atualização${NORMAL}"
sleep 3
sudo export http_proxy="http://$usuario:$senha@$proxy:$porta"
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove
whoami
echo "A atualização foi efetuada com sucesso!"
echo "Info hora atual e tempo de ligado:"
uptime
echo "O script está rodando no diretório:"  && pwd
echo "Fim da atualização"
