#!/bin/bash
#initialisation des variables
doss=0  
test=0

clear
while [ $test -lt 1 ] #verification si le pays existe
do
    echo "Entrez un pays/continent à étudier: "
    read pays       #saisi du pays par l'utilisateur

    find -name projet-ss -exec cd {} \;
    doss=`grep -wir "$pays" | cut -d":" -f1 | grep -i Consumption`          #on recherche tous les fichier qui contiennent le pays/continent puis on prends que les fichiers qui contiennent dans leur titre "consumption"
    test=`echo "$doss" | wc -w`     #on verifie la longueur de la recherche

    if [ $test -lt 1 ]      #cas ou la pays n'existe pas (si la taille est egale a 0 aucun pays n'existe dans les fichiers)
    then
        echo "Ce pays n'est pas utilisable"
    else
    if [ -d Resultat ]          #verification de l'existence du dossier resultat
    then
        echo "Le dossier Resultat existe déjà."
    else
        mkdir Resultat          #s'il n'existe pas on le cree
    fi

    if [ -d Resultat/"$pays" ]         #verification de l'existence du dossier du pays/continent
    then
        echo "Le dossier $pays existe déjà"
    else
        mkdir Resultat/"$pays"          #sinon on cree le dossier
    fi
 
    rechercheCol=$(head -1 $doss | tr ',' '\n' | nl |grep -wi "$pays" | awk -F " " '{print $1}')    #recherche de la colonne correspondant au pays/continent rechercher dans le fichier
    echo "Année,$pays" > Resultat/"$pays"/conso.csv                 #ecriture de la premiere ligne contenant les titre des colonnes
    while IFS="," read -r dataCol1 dataColPays                      #boucle pour lire le fichier
    do
        echo "$dataCol1,$dataColPays" >> Resultat/"$pays"/conso.csv         #ecriture des données du fichier "consumption" dans le conso.csv
    done < <(cut -d "," -f1,${rechercheCol} $doss | tail -n +2)             #condition d'arret
    cd Resultat/"$pays"
    #creation du graphique en jpg
    gnuplot -e "set terminal jpeg;
                set output 'conso.jpg';
                set datafile separator ',';
                set key autotitle columnhead;
                set ylabel 'Tw/h';
                set xlabel 'Année';
                plot 'conso.csv' using 1:2 with lines;
               "
    display conso.jpg   #affichage du graphique
    cd -
    fi
done

