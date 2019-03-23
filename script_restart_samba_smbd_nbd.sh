#!/bin/bash
#reinicializa os serviços smbd e nmbd do samba
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#22/03/2019
#Base de conhecimento: http://www.devin.com.br/shell_script/
#Repo: https://github.com/Fernando-Eagle/shell_scripts

#Variáveis de cores
vermelho="\033[1;31m"
azul="\033[1;34m"
amarelo="\033[1;33m"
verdeclaro="\033[1;32m"
fundoazul="\033[44;1;37m"
fundovermelho="\033[41;1;37m"
fundopurple="\033[45;1;37m"
NORMAL="\033[m"

Principal() {
  clear
  echo -e "${amarelo}Este Script irá reinicializar todos os serviços do SAMBA${NORMAL}"
  echo -e "${amarelo}--------------------------------------------------------${NORMAL}"
  echo -e "${fundoazul}Opções:${NORMAL}"
  echo
  echo "1. Verificar o status dos serviços"
  echo "2. Reinicializar os serviços"
  echo "3. Sair"
  echo
  echo -n -e "${fundoazul}Qual a opção desejada? ${NORMAL}"
  read opcao
  case $opcao in
    1) Verificar ;;
    2) Reinicializar ;;
    3) clear; exit ;;
    *) echo -e "${fundovermelho}Opção desconhecida.${NORMAL}"; sleep 2 ; Principal ;;
  esac
}

Verificar() {
  clear
    echo -e "${fundopurple}Verificando os serviços do SAMBA agora...${NORMAL}"
    sudo systemctl status nmbd.service && sudo systemctl status smbd.service
    echo -n -e "${amarelo}Deseja retornar ao Menu Principal (S/n)${NORMAL}"
    read voltar
    if [ $voltar = "S" ]; then
      Principal
    elif [ $voltar = "n" ]; then
      clear; exit
    fi

}

Reinicializar() {
  clear
  sudo systemctl restart nmbd.service && sudo systemctl restart smbd.service
  echo -e "${amarelo}Reinicializando os serviços do SAMBA agora...${NORMAL}"
  sleep 3
  clear
  Principal
}

Principal
