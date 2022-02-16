#!/bin/bash
#atualiza o sistema, faz do portal e do banco mysql/mariadb
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#13/03/2019
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

#Faz a atualização do sistema, baseado em debian
clear
echo -e "${amarelo}Este Script irá guiá-lo para atualizar seu Sistema Operacional${NORMAL}"
echo -e "${amarelo}Também irá guiá-lo para fazer backup das paginas do servidor Apache${NORMAL}"
echo -e "${amarelo}Bem como do SGBD MySQL ou MariaDB instalado${NORMAL}"
echo -e "${fundovermelho}Iniciando a atualização do sistema:${NORMAL}"

sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove && sudo snap refresh --list && sudo snap refresh

whoami
echo -e "${fundoazul}A atualização foi efetuada com sucesso!${NORMAL}"
echo -e "${fundoazul}Fim da atualização${NORMAL}"
echo -e "${amarelo}Testando se a pasta de backup foi criada${NORMAL}"
sleep 3
#Testa se a pasta para o backup já existe senão, cria a mesma
if [ -e "/home/$USER/Downloads/Backup" ]
then
echo -e "${amarelo}o diretorio existe e vamos compactar o portal lá${NORMAL}"
sleep 3
else
echo -e "${fundovermelho}o diretorio não existe e vamos criá-lo${NORMAL}"
sleep 3
mkdir /home/$USER/Downloads/Backup
echo -e "${fundoazul}Pasta criada e pronta para receber o backup${NORMAL}"
sleep 3
fi

#Faz o backup do portal do servidor apache, estrutura debian
##### Variaveis
declare DATA=`date +%Y%m%d_%H%M%S`
declare DIR_BACKUP="/home/$USER/Downloads/Backup/"  #  Define o diretório de backup
clear
echo -e "${fundovermelho}Iniciando o backup do portal do servidor Apache em: /var/www/html${NORMAL}"
sleep 3
#Se quiser apenas copiar o conteudo
#sudo cp -R  /var/www/html/ $DIR_BACKUP/html_$DATA
#Se quiser gravar a estrutura de pastas e conteudo compactado
sudo tar cvzf /home/$USER/Downloads/Backup/bkp_html_$DATA.tar.gz /var/www/html/
clear
echo -e "${amarelo}O backup foi salvo na pasta '/home/$USER/Downloads/Backup'sob o nome ${fundopurple}'bkp_html_$DATA.tar.gz'${NORMAL}"
sleep 3

#Faz o backup do SGBD MySQL ou MariaDB que suporta o portal
clear
echo -e "${fundovermelho}Iniciando o backup do SGBD MySQL ou MariaDB via mysqldump${NORMAL}"
sleep 3
##### Variaveis
declare DATA=`date +%Y%m%d_%H%M%S`
declare DIR_BACKUP="/home/$USER/Downloads/Backup/"  #  Define o diretório de backup
declare SENHA="November777"
declare USER="root"
DIR_DEST_BACKUP=$DIR_BACKUP$DATA
###################################################################

##### Rotinas secundarias
mkdir -p $DIR_BACKUP/$DATA # Cria o diretório de backup diário
echo "MariaDB"
echo "Iniciando backup do banco de dados"
##################################################################

# função que executa o backup
executa_backup(){
echo "Inicio do backup $DATA"
 #Recebe os nomes dos bancos de dados na maquina destino
 BANCOS=$(mysql -u $USER -p$SENHA -e "show databases")
 #retira palavra database
 BANCOS=${BANCOS:9:${#BANCOS}}

declare CONT=0

#inicia o laço de execução dos backups


for banco in $BANCOS
 do
 if [ $CONT -ne 0 ]; then    # ignora o primeiro item do array, cujo conteudo é "databases"
     NOME="backup_my_"$banco"_"$DATA".sql"


    echo "Iniciando backup do banco de dados [$banco]"
   # comando que realmente executa o dump do banco de dados
   mysqldump --hex-blob --lock-all-tables -u $USER -p$SENHA --databases $banco > $DIR_DEST_BACKUP/$NOME


   # verifica que se o comando foi bem sucedido ou nao.
   if [ $? -eq 0 ]; then
      echo "Backup Banco de dados [$banco] completo"
   else
      echo "ERRO ao realizar o Backup do Banco de dados [$banco]"
   fi
fi
 CONT=`expr $CONT + 1`
 done


DATA=`date +%Y%m%d_%H%M%S`

echo "Final do backup: $DATA"
}

executa_backup 2>> $DIR_BACKUP/$DATA/backup.log 1>> $DIR_BACKUP/$DATA/backup.log

###################################################################
clear
echo -e "${fundovermelho}Backup finalizado e salvo em ${fundoazul}'/home/$USER/Downloads/Backup/$DATA'${NORMAL}"
echo -e "${amarelo} Info hora atual e tempo de ligado:${NORMAL}"
uptime
echo -e "${amarelo} O script está rodando no diretório:${NORMAL}"  && pwd
echo -e "${fundopurple}Fim do backup${NORMAL}"
sleep 4

#Função pergunta se quer desligar, rebootar ou sair
Finalizar() {
  clear
  echo -e "${fundoazul}Chegamos ao final do script ${NORMAL}"
  echo -e "${amarelo}Escolha uma das opções abaixo ${NORMAL}"
  echo
  echo "[1] Reboot"
  echo "[2] Shutdown"
  echo "[3] Voltar para linha de comando"
  echo "[4] Fechar terminal"
  echo
  echo -n -e "${fundoazul}Digite a opção: ${NORMAL}"
  read opcao
  case $opcao in
    1) Reboot ;;
    2) Shutdown ;;
    3) Return ;;
    4) Exit;;
    *) echo -e "${fundovermelho}Opção desconhecida.${NORMAL}"; sleep 2 ; Finalizar ;;
  esac
}

#Demais funções
Reboot() {
  clear
    echo -e "${amarelo}reiniciando agora...${NORMAL}"
    sudo reboot

}

Shutdown() {
  clear
  echo -e "${vermelho}desligando...${NORMAL}"
  sudo shutdown -h now
#  systemctl poweroff -i - ainda não resolvemos qual dos dois fica

}

Return() {
  clear
  echo -e "${verdeclaro}voltando para o terminal...${NORMAL}"
  clear && exit

}
Exit() {
  clear
  echo -e "${verdeclaro}fechando o terminal...${NORMAL}"
  proc=$(ps -e | grep bash$ | cut -f1 -d '')
  kill -9 $proc

}

Finalizar
