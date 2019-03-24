#!/bin/bash
#remove kernel antigo
#Flávio Oliveira
#www.youtube.com/flaviodicas
#www.flaviodeoliveira.com.br
#13/06/2015 - Última atualização 13/02/2017
#https://github.com/oliveiradeflavio/scripts-linux/blob/master/removeoldkernel.sh

#Variáveis de cores
vermelho="\033[1;31m"
azul="\033[1;34m"
amarelo="\033[1;33m"
verdeclaro="\033[1;32m"
fundoazul="\033[44;1;37m"
fundovermelho="\033[41;1;37m"
NORMAL="\033[m"

menu()
{
clear
echo -e "${azul}Kernel Atual do Sistema${NORMAL}"
uname -r
echo
echo -e "${azul}Kernels encontrados no Sistema${NORMAL}"
dpkg-query -l | awk '/linux-image-*/ {print $2}'
echo
echo
sleep 4
echo -e "${vermelho}Se tiver driver proprietário NVIDIA ou AMD, aconselho desabilitar antes de excluir os kernels antigos.\nLogo em seguida ative-os no kernel atual.Caso contrário pode resultar perda do driver de vídeo após o reboot do sistema, já que os drivers não foram compilados no kernel atual."
echo -e "${azul}Deseja exluir os kernels antigos, menos o atual? \nKernel atual: ${fundovermelho}`uname -r`${NORMAL}
 			\ns/n${NORMAL}"
sleep 1
read -n1 -s escolha

case $escolha in
	S|s) echo
		echo -e ${vermelho}Removendo Kernels antigos${NORMAL}
        sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
        sudo update-grub
        ;;
	N|n) echo
		echo -e ${azul}Operação Cancelada${NORMAL}
		sleep 2 && exit
        ;;
	*) echo
		echo -e ${vermelho}Opção incorreta${NORMAL}
        sleep 2 && menu
        ;;
esac
}
menu
