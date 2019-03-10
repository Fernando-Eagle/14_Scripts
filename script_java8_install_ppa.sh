#!/bin/bash
#Instala o Java 8 com base no ppa do webjavateam
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#09/03/2019 - Última atualização 09/03/2019
#Fonte: https://www.vivaolinux.com.br/dica/Instalar-Java-8-no-Ubuntu

#Variáveis de cores
vermelho="\033[1;31m"
azul="\033[1;34m"
NORMAL="\033[m"

echo -e "${azul}Abrindo o terminal e informando o repositório:${NORMAL}"
sudo add-apt-repository ppa:webupd8team/java

echo -e "${vermelho}Agora vamos atualizar a base de dados:${NORMAL}"
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove

echo -e "${azul}Instalando o Java 8:${NORMAL}"
sudo apt-get install oracle-java8-installer

echo -e "${vermelho}Verificando se o Java foi instalado corretamente:${NORMAL}"
java -version

echo -e "${azul}O script está rodando no diretório:${NORMAL}" && pwd
echo -e "${vermelho}Fim da atualização${NORMAL}"
