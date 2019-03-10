#!/bin/bash

clear
echo "Script de backup do portal compactado"
sudo tar cvzf /home/fernando/04_Portal/bkp_html.tar.gz /var/www/html/
clear
whoami
echo "O backup foi salvo na pasta '/home/fernando/04_Portal/' sob o nome 'bkp_html.tar.gz'"
echo "Info hora atual e tempo de ligado:"
uptime
echo "O script está rodando no diretório:"  && pwd
echo "Fim do backup"
