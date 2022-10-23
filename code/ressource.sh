#!/bin/bash

# Affichage du menu pour choisir les ressources et leur numero #
echo " 1 - Hydro " 
echo " 2 - Biofuel "
echo " 3 - Solar PV "
echo " 4 - Geothermal "
echo "Combien de ressources voulez vous comparez ? (1 a 4)"
read ressource      #lecture du nombre de ressource
rm -r dataRessource 2> /dev/null    #supression,du menu dataRessource pour que les ressources ne s'accumule pas 
mkdir dataRessource   #creation d'un nouveau dataRessource

if [ $ressource -lt 4 -a $ressource -gt 0 ]   #cas ou les ressources a comparé est entre 1 et 3
then
  echo "rentrer la ressource n°1 (En chiffre)"
  read x    
  while [ $x -gt 4 -o $x -lt 1 ]    #verification si le chiffre est valable, tant qu'il ne l'est pas l'utilisateur doit ressaisir un chiffre
  do
    echo "rentrer une valeur valable (En chiffre)"
    read x
  done
  let "x++"   #on ajoute 1 a la valeur car la colonne 1 correspond au année
  
  i=1
  while [ $i -lt $ressource ]     #boucle pour saisir les ressources
  do
    let "i++"
    echo "rentrer la ressource n°$i (En chiffre)"
    read y
    while [ $y -gt 4 -o $y -lt 1 ]
    do
      echo "rentrer une valeur valable (En chiffre)"  #verification si le chiffre est valable, tant qu'il ne l'est pas l'utilisateur doit ressaisir un chiffre
      read y
    done
    let "y++"
    variable=", '' using 1:$y with lines"     #commande utilise dans gnuplot
    echo $variable >> dataRessource/ressource.txt     #sauvegarde des données dans un fichier pour continuer la boucle
  done
  cd dataRessource
  touch ressource.txt
  if [ $ressource -lt 3 ]     #cas ou il y a que deux données
  then
    variable1=`head -1 ressource.txt`   #recuperation de la commande de la donnée numero 2 sauvegardé dans le fichier ressource.txt
  else
    variable1=`head -1 ressource.txt`   #recuperation de la commande de la donnée numero 2
    variable2=`tail -1 ressource.txt`   #recuperation de la commande de la donée numero 3
  fi
  #creation du graphique
  gnuplot -e "set terminal jpeg;
             set output 'conso.jpg';
             set datafile separator ',';
             set key autotitle columnhead;
             set ylabel 'Tw/h';
             set xlabel 'Year';
             plot '../data/renewablePowerGeneration97-17.csv' using 1:$x with lines$variable1$variable2;
             "                                                                                              #creation d'un fichier conso.jpg qui selon le nombre de variable affiche plus ou moins de courbes
                                                                                                            #Si les $varible1 ou 2 son null il ne va pas les affiché
display conso.jpg   #affichage du jpg cree

elif [ $ressource -eq 4 ]   #cas ou les 4 ressources sont a comparé
then
  cd dataRessource
  #cration du graphique avec l'affiche de tt les données
  gnuplot -e "set terminal jpeg;
             set output 'conso.jpg';
             set datafile separator ',';
             set key autotitle columnhead;
             set ylabel 'Tw/h';
             set xlabel 'Time';
             plot '../data/renewablePowerGeneration97-17.csv' using 1:2 with lines, '' using 1:3 with lines, '' using 1:4 with lines, '' using 1:5 with lines;
             "
display conso.jpg   #affichage du jpg

else
  echo "Il y a trop ou pas assez de ressources"     #cas ou la saisi des ressources est mauvaise
fi
