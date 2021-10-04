#!/bin/bash
#aumenta a área swap do linux Ubuntu e derivados
#Fernando "Eagle" De Sousa
#fernandodesousa.wordpress.com
#03/10/2021
#https://https://github.com/Fernando-Eagle/shell_scripts

#Variáveis de cores
vermelho="\033[1;31m"
azul="\033[1;34m"
amarelo="\033[1;33m"
verdeclaro="\033[1;32m"
fundoazul="\033[44;1;37m"
fundovermelho="\033[41;1;37m"
fundopurple="\033[45;1;37m"
fundocinza="\033[47;1;37m"
NORMAL="\033[m"

#Descreve o que faz o script na tela do operador
clear
echo -e "${amarelo}Este Script irá guiá-lo para aumentar a área de memória SWAP do seu Sistema Operacional${NORMAL}"
#echo -e "${fundovermelho}Iniciando a atualização do sistema:${NORMAL}"
#  sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove
#  whoami
#echo -e "${fundoazul}A atualização foi efetuada com sucesso!${NORMAL}"
#  sleep 3
#  clear
echo -e "${fundopurple}INICIANDO VERIFICAÇÃO / ACRÉSCIMO SWAP{NORMAL}"
echo -e "${fundoazul}Passo 1 - Verificando o Sistema em Relação às Informações de Swap (troca)${NORMAL}"
  sudo swapon --show
  sleep 3
echo -e "${fundoazul}Verificando se não existe um swap ativo usando o utilitário free :${NORMAL}"
  free -h
  sleep 3
echo -e "${fundovermelho}Passo 2 - Verificando o Espaço Disponível na Partição do Disco Rígido${NORMAL}"
  df -h
  sleep 3
echo -e "${fundoazul}Passo 3 - Criando um Arquivo de Swap${NORMAL}"
echo -e "${fundopurple}Vamos criar um SWAP de 2Gb${NORMAL}"
echo -e "${fundoazul}Desativando o swap${NORMAL}"
  sudo swapoff -a
  sudo fallocate -l 2G /swapfile

echo -e "${fundoazul}Verificando se a quantidade correta de espaço foi reservada${NORMAL}"
  ls -lh /swapfile
  sleep 3

echo -e "${fundoazul}Passo 4 - Habilitando o Arquivo de Swap${NORMAL}"
echo -e "${fundovermelho}Tornando o arquivo acessível somente para root${NORMAL}"
  sudo chmod 600 /swapfile
echo -e "${fundovermelho}Verificando a alteração de permissões${NORMAL}"
  ls -lh /swapfile
echo -e "${fundoazul}Marcando o arquivo como espaço de swap${NORMAL}"
  sudo mkswap /swapfile
echo -e "${fundoazul}Reativando o swap${NORMAL}"
  sudo swapon /swapfile
echo -e "${fundoazul}Verificando se o swap está disponível${NORMAL}"
  sudo swapon --show
echo -e "${fundovermelho}Verificando novamente o swap ativo usando o utilitário free:${NORMAL}"
  free -h
  sleep 3

echo -e "${fundoazul}Passo 5 - Tornando o Arquivo de Swap Permanente${NORMAL}"
echo -e "${fundovermelho}Fazendo um backup do arquivo /etc/fstab para o caso de algo dar errado:${NORMAL}"
#Faz o backup do portal do arquivo fstab, estrutura debian
##### Variaveis
  declare DATA=`date +%Y%m%d_%H%M%S`

  #sudo cp /etc/fstab /etc/fstab_$DATA.bak

  sudo cp /etc/fstab /etc/fstab.bak

echo -e "${fundovermelho}Adicionando a informação do arquivo de swap no final do seu arquivo /etc/fstab:${NORMAL}"

  echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab



#----------------------------

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
