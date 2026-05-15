#!/bin/bash

echo "1 - Buscar por nome"
echo "2 - Buscar por conteúdo"

read -p "Escolha uma opção: " OPCAO

read -p "Digite o diretório: " DIRETORIO

if [ $OPCAO -eq 1 ]
then
    read -p "Digite o nome do arquivo: " NOME

    RESULTADO=$(find "$DIRETORIO" -name "*$NOME*")

    TOTAL=$(echo "$RESULTADO" | wc -l)

    > relatorio.txt

    echo "RELATÓRIO DE BUSCA" >> relatorio.txt
    echo "Data: $(date)" >> relatorio.txt
    echo "Diretório: $DIRETORIO" >> relatorio.txt
    echo "Busca por nome: $NOME" >> relatorio.txt
    echo "Total de arquivos encontrados: $TOTAL" >> relatorio.txt
    echo "--------------------------------" >> relatorio.txt

    for ARQUIVO in $RESULTADO
    do
        stat --format="%n | %s bytes | %y" "$ARQUIVO" >> relatorio.txt
    done

    cat relatorio.txt

elif [ $OPCAO -eq 2 ]
then
    read -p "Digite a palavra que deseja procurar: " PALAVRA

    RESULTADO=$(grep -r "$PALAVRA" "$DIRETORIO" 2>/dev/null)

    > relatorio.txt

    echo "RELATÓRIO DE BUSCA" >> relatorio.txt
    echo "Data: $(date)" >> relatorio.txt
    echo "Diretório: $DIRETORIO" >> relatorio.txt
    echo "Busca por conteúdo: $PALAVRA" >> relatorio.txt
    echo "--------------------------------" >> relatorio.txt

    echo "$RESULTADO" >> relatorio.txt

    cat relatorio.txt

else
    echo "Opção inválida"
fi
