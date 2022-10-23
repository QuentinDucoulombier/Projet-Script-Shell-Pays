#!/bin/bash
doss=0
test=0

clear                                                                                                                                       #On clear le terminal
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"                                                                                                        #menu
echo "Choississez une énergie: "
echo "Hydro
Wind
Biofuel
Solar PV
Geothermal
Renewable waste
Solar Thermal
Tidal"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
while [ $test -lt 1 ]                                                                                                                       #Boucle qui permet de reposer la question si l'utilisateur entre une réponse inutilisable
do
    echo "Votre choix: "
    read reponse
    find -name projet-ss -exec cd {} \;                                                                                                     #On cherche le dosser projet-ss
    doss=`grep -wir "$reponse" | cut -d":" -f1 | grep -i renewablesTotalPowerGeneration`                                                    #On cherche si la réponse est présente dans le fichier qui nous interesse
    test=`echo "$doss" | wc -w`
    if [ $test -lt 1 ]                                                                                                                      #Si on ne trouve aucun fichier alors la réponse est inutilisable
    then
        echo "Cette énergie est introuvable
        "
    else
        echo "La quantité d'énergie $reponse en TWH est de: `cat $doss | grep -wi "$reponse" | cut -d"," -f2`"                              #On affiche la réponse
    fi
done