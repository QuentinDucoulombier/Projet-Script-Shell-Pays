#!/bin/bash
clear
sleep 0.5
echo "Bienvenue dans notre super programme!"
sleep 1.5
echo "Vous aurez l'occasion d'avoir accès à un nombre colossal de donnée!
"
sleep 1.5
echo "Que voulez vous savoir?"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
PS3="~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Votre choix : "
select item in "- Le pays qui produit le plus d'énergie renouvelable -" "- Etude de la consommation d'un pays/continent par année -" "- Production d'une énergie renouvelable en TWh -" "- Comparaison de l'évolution des énergies renouvelables par année -" "- FIN -" #Menu est sélection de la commande
do
  case $REPLY in
    1)
      bash code/pays_eco.sh    #exécution de la commande choisie
      break
      ;;
    2)
      bash code/etude_pays.sh   #exécution de la commande choisie
      break
      ;;

    3)
      bash code/production_energie.sh     #exécution de la commande choisie
      break
      ;;

    4)  
      bash code/ressource.sh            #exécution de la commande choisie
      break
      ;;
    5)
      break                             #quitte le programme
      ;;
    *)
      echo "Choix incorrect. Veuillez saisir votre choix"         #Choix différent de ceux proposés
  esac
done
echo "
A bientot !"
