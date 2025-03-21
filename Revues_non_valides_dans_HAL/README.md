# Repérage des revues non valides dans les articles déposés dans HAL pour une collection en particulier.

## Objectif du code
* identifier, dans les articles d'une collection donnée, les articles dont le nom de la revue correspond à une entrée non valide dans Aurehal (statut : INCOMING) afin de corriger ou faire corriger.

## Résultat : 
Un fichier html est créé qui dresse la liste des revues non valides trouvées et des liens cliquables vers HAL et Aurehal. Les colonnes du tableau sont:
** Le titre de la revue
** Le lien vers la notice HAL qui contient ce titre
** La date de soumission de la notice
** Le lien vers la notice Aurehal de la revue non valide
** un message indiquant si le script a trouvé plusieurs réponses dans Aurehal correspondant à une version "appauvrie" du titre, ce qui permet de repérer un éventuel équivalent "valide" déjà existant. Si rien n'a été trouvé, un lien permet de réitérer la recherche dans Aurehal.

## Auteur et contact: 
Kumar Guha (Information et édition scientifiques, Inria, France) 
kumar.guha^inria.fr
https://orcid.org/0009-0005-6649-9515

Licence : Creative Commons CC-BY (https://creativecommons.org/licenses/by/4.0/)

Date de création : 16 septembre 2024

Ce code peut être copié, partagé et modifié librement.

## Installation et pré-requis
* Pour exécuter ce script vous devez avoir installé un environnement qui permet de lancer des scripts Jupyter Notebook. Par exemple, Anaconda ou Visual Studio Code.
* La version de Python utilisées est 3.12
* Téléchargez ou Recopiez le code "Revues_Incoming.ipynb" dans votre environnement et enregistrez-le comme fichier Jupyter Notebook (extension: ".ipynb")
* Il faut aussi que HAL et AUREHAL ne soient pas en panne ni ne connaissent pas de ralentissements significatifs.


## Adaptation nécessaire du code/configuration

Au début du code, deux paramètres peuvent être modifiés pour s'adapter à vos besoins:
* Le nom de la collection (variable "collection = "INRIA2" - vous pouvez remplacer INRIA2 par le nom de votre collection)
* Le nom et l'emplacement du répertoire où le fichier de résultat sera enregistré (variable repertoire_cible="chemin du répertoire").Si le répertoire n'existe pas, il sera créé au premier lancement du script.

## Limites au moment de sa mise en ligne

* Il est nécessaire de spécifier une collection HAL (mais l'api utilisée dans la variable "url1" peut être adaptée)
* Les colonnes du fichier html sont cliquables pour les trier, mais le javascript qui permet de le faire n'est pas toujours très efficace (si vous savez comment l'améliorer, n'hésitez pas à partager). Cependant, le tri par titre est toujours fonctionnel.

## Comprendre le script
* Des commentaires sont intégrés dans le code, précédés du signe #
* Pour davantage d'explications, contactez l'auteur.

## Contribution
Ne pas hésiter à soumettre une issue en cas de problème, ou à contacter l'auteur.