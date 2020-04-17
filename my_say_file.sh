#!/bin/bash

## fonction de diction;
## affiche la ligne puis la dicte
speehsay () {
    echo $line
    echo ""
    say $line
}

input="./$1"
## nbre_lignes=$(wc -l < $input)
if [ -f "$input" ]; then
  # si le fichier existe
  while IFS= read -r line
  do
    # fait les bails
    speehsay $line
  done < "$input"
else
  # si le fichier n'existe pas diplay un message d'info
  echo "Usage : passer un fichier text en paramètre pour être lu"
fi

# potite blague: check si user est root
if [[ $EUID -ne 0 ]]; then
    sleep 0
else
   text="c'est pas bien de lancer un script inconnu en root"
   speehsay $text
fi

sleep 1
# end