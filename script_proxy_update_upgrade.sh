#!/bin/bash

clear
echo "Setando o proxy TJMA"
sudo export http_proxy="http://afvsousa:November777@proxy.tjma.jus.br:3128"
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove
whoami
echo "A atualização foi efetuada com sucesso!"
echo "Info hora atual e tempo de ligado:"
uptime
echo "O script está rodando no diretório:"  && pwd
echo "Fim da atualização"
