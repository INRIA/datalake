# Repérage des revues non valides dans les articles déposés dans HAL pour une collection en particulier.

## Objectif du code
* 1. Récupérer, chaque jour, les nouvelles notices de HAL et les PDF déposés qui ne sont pas sous embargo.
* 2. Recopier tout le contenu de HAL (env. 10To en 2024) progressivement, par tranches de 3h par jour.
## Résultat : 
Les notices sont déposées sur un serveur sur ABACA.
Les notices xml et les PDF sont déposés dans des dossiers séparés.

## Auteur et contact: 
Kumar Guha (Information et édition scientifiques, Inria, France) 
kumar.guha^inria.fr
https://orcid.org/0009-0005-6649-9515

## Licence : 
Creative Commons CC-BY (https://creativecommons.org/licenses/by/4.0/)

Date de création : 16 septembre 2024

Ce code peut être copié, partagé et modifié librement.

## Installation et pré-requis
* Pour exécuter ce script vous devez avoir installé un environnement qui permet de lancer des scripts Jupyter Notebook. Par exemple, Anaconda ou Visual Studio Code.
* La version de Python utilisées est 3.12
* Il faut aussi que HAL ne soit pas en panne ni ne connaisse pas de ralentissements significatifs.


## Adaptation nécessaire du code/configuration

L'emplacement et le nom des dossiers peuvent être modifiés.

## Limites au moment de sa mise en ligne

* Temps d'exécution du script peut-être long en cas d'opération de réindexation de HAL.
* L'espace de stockage nécessaire doit être au minimum de 10 To (volume estimé en 2024, +2To/an)

## Comprendre le script
* Des commentaires sont intégrés dans le code, précédés du signe #
* Pour davantage d'explications, contactez l'auteur.

## Contribution
Ne pas hésiter à soumettre une issue en cas de problème, ou à contacter l'auteur.