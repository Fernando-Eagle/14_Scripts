#!/bin/bash
# PJeOffice script

echo "Iniciando o PJeOffice!"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Diretorio da APP: $DIR"

cd $DIR

./jre/bin/java -jar pjeOffice.jar
