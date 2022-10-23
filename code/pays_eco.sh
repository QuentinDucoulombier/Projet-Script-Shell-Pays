#!/bin/bash
cd data/                                                                                                   #On se place dans le dossier contenant les fichier de données
eco=`cat top20CountriesPowerGeneration.csv | cut -d"," -f1 | head -2 | tail -1`                            #On cherche le fichier qui nous interesse et on récupere le premier pays
echo "Le pays qui produit le plus d'énergie renouvelable est: $eco"                                        #On affiche le résultat