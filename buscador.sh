#!/bin/bash

read -p "Digite o diretório: " DIRETORIO
read -p "Digite o nome do arquivo: " NOME

RESULTADO=$(find "$DIRETORIO" -name "*$NOME*")

> relatorio.txt

echo "RELATÓRIO DE BUSCA" >> relatorio.txt
echo "Data: $(date)" >> relatorio.txt
echo "Diretório: $DIRETORIO" >> relatorio.txt
echo "Busca: $NOME" >> relatorio.txt
echo "--------------------------------" >> relatorio.txt

for ARQUIVO in $RESULTADO
do
    stat --format="%n | %s bytes | %y" "$ARQUIVO" >> relatorio.txt
done

cat relatorio.txt
