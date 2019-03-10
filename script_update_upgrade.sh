#!/bin/bash

clear
echo "Iniciando a atualização"
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove
whoami
echo "A atualização foi efetuada com sucesso!"
echo "Info hora atual e tempo de ligado:"
uptime
echo "O script está rodando no diretório:"  && pwd
echo "Fim da atualização"
