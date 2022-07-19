#!/bin/bash
if [ $USER == "root" ]
then
    echo "Você é o root"
#    comandos_para_root
elif [ $USER == "antonio" ]
then
    echo "Você é o ricardo"
#    comandos_para_ricardo
else
    echo "Você não é o root, nem o antonio é $USER"
#    comandos_para_demais
fi
