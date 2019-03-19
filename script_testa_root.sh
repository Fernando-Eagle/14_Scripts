#!/bin/bash
if [ $USER == "root" ]
then
    echo "Você é o root"
#    comandos_para_root
elif [ $USER == "ricardo" ]
then
    echo "Você é o ricardo"
#    comandos_para_ricardo
else
    echo "Você não é o root e nem o ricardo"
#    comandos_para_demais
fi

mkdir /home/$USER/Downloads/Teste
