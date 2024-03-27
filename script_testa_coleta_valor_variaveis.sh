#!/bin/bash
#coleta de dados através de variáveis
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
echo -n -e "${amarelo}Qual o usuário do domínio (cuidado com maúsculas e minúsculas)?  ${NORMAL}"
read usuario
echo -n -e "${amarelo}Qual a senha do usuário (cuidado com maúsculas e minúsculas)?  ${NORMAL}"
stty -echo #para ocultar os caracteres
read senha
stty echo #para reexibir o texto
echo \n   #para saltar uma linha de texto e esperar a proxima resposta
echo -n -e "${amarelo}Qual o servidor de proxy (ex: proxy01)?  ${NORMAL}"
read proxy
echo -n -e "${amarelo}Qual o domínio (ex: dominio.com.br)?  ${NORMAL}"
read dominio
echo -n -e "${amarelo}Qual a porta alvo (ex: 3128)?  ${NORMAL}"
read porta
clear
# Exibindo o valor das variaveis
echo -e "${fundopurple}Mostrando o valor das variaveis${NORMAL}"
sleep 2
echo -e "${amarelo}Usuário do domínio: ${fundoazul}$usuario ${NORMAL}"
echo -e "${amarelo}Senha do usuário: ${fundoazul}$senha ${NORMAL}"
echo -e "${amarelo}Servidor proxy: ${fundoazul}$proxy ${NORMAL}"
echo -e "${amarelo}Domínio: ${fundoazul}$dominio ${NORMAL}"
echo -e "${amarelo}Porta: ${fundoazul}$porta ${NORMAL}"
