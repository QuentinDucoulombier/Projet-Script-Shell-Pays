# Projet Script Shell Pays/Continents
---

Auteurs : Quentin Ducoulombier, Lucas Thu Ping One  
Date: 2 Juin 2022  
Email: ducoulombi@cy-tech.fr, thupingone@cy-tech.fr

---
## Presentation

Ce projet permet l’exploitation de fichiers .csv contenant des informations
énergétiques selon des pays/continents et/ou selon le temps.  
Notre projet permet de
représenter ces données à l'aide de graphiques pour illustrer et comparer les données. De plus, à l'aide de certaines commandes nous avons accès plus facilement au donnée (par
exemple la consommation totale d’une certaine énergie renouvelable).  
Tout ceci est possible grâce à un script clair et un menu.

## Technologie utilisée

Afin de mener à bien notre projet nous avons utilisé plusieurs technologies comme
gnuplot pour créer des représentations graphiques des données que l’on étudie et gitlab
pour pouvoir travailler ensemble sur le projet très facilement. Nous avons en effet créé un
script qui nous permet de partager et mettre à jour rapidement les modifications apportées.

## Installation 

Le script doit être exécuté de la manière suivante :

- Ouvrir un terminal
- Se placer dans le répertoire du projet.
- Exécuter la commande :
  ```
  >> bash LeScript.sh 
  ```
- Attendre que le menu s'affiche
- Choisir la commande à exécuter !
- Attention :   
    Il faut choisir des numéro pour selectioner le menu:  
    - Dans "2) - Etude de la consommation d'un pays/continent par année -" il faut selectioner un pays ou continent selon la liste ci-dessous
    - Dans "3) - Production d'une énergie renouvelable en TWh -" Il faut selectionner l'energie en tout lettre selon la liste affiché
    - Dans "4) - Comparaison de l'évolution des énergies renouvelables par année -" Il faut selectionner l'energie en nombre selon la liste affiché


Liste pays et continents disponible :
- Continents : World,OECD,BRICS,Europe,North America,Latin America,Asia,Pacific,Africa,Middle-East,CIS
- Pays : China,United States,Brazil,Belgium,Czechia,France,Germany,Italy,Netherlands,Poland,Portugal,Romania,Spain,Sweden,United Kingdom,Norway,Turkey,Kazakhstan,Russia,Ukraine,Uzbekistan,Argentina,Canada,Chile,Colombia,Mexico,Venezuela,Indonesia,Japan,Malaysia,South Korea,Taiwan,Thailand,India,Australia,New Zealand,Algeria,Egypt,Nigeria,South Africa,Iran,Kuwait,Saudi Arabia,United Arab Emirates.

## Autres

Pour plus d'information telecharger le document [Rapport_Script_Schell.pdf](https://github.com/QuentinDucoulombier/Projet-Script-Shell-Pays/blob/main/Rapport_Script_Shell.pdf)