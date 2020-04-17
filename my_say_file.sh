#!/bin/bash

## fonction de diction;
## affiche la ligne puis la dicte
speehsay () {
    echo $line
    echo ""
    say --progress $line
}

input="./$1"
## nbre_lignes=$(wc -l < $input)
if [ -f "$input" ]; then
  # si le fichier existe
  while IFS= read -r line
  do
    # dicter ligne par ligne
    speehsay $line
  done < "$input"
fi


sleep 1
## potite blague: check si user est root
if [[ $EUID -ne 0 ]]; then
    sleep 0
else
   text="c'est pas bien de lancer un script inconnu en root"
   speehsay $text
fi

sleep 1
#end