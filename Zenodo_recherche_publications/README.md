# Publications d'INRIA dans ZENODO

Ce projet a pour but de récupérer automatiquement les publications de l'Institut national de recherche en informatique et en automatique (Inria) à partir de l'API de Zenodo, et de les enregistrer dans un fichier CSV.

## Contenu

- `zenodo_inria_publications.py` : script Python permettant de collecter les données des publications.
- `zenodo_inria_publications.csv` : fichier CSV généré contenant les publications.
- `README.md` : ce fichier explicatif.

## Fonctionnement

1. Le script interroge l'API Zenodo avec une requête sur les publications contenant "Inria".
2. Il parcourt les résultats paginés.
3. Pour chaque publication, il extrait :
   - le titre,
   - la date de publication,
   - le DOI,
   - les auteurs (nom, affiliation, ORCID),
   - le type de publication,
   - les droits d'accès,
   - les institutions affiliées,
   - les mots-clés et sujets,
   - l'URL directe vers la ressource sur Zenodo.
4. Les résultats sont stockés dans un fichier CSV.

## Exécution

Avant de lancer le script :
- Remplacez la variable `ACCESS_TOKEN` par votre token personnel Zenodo.

```bash
python zenodo_inria_publications.py
```

Le fichier `zenodo_inria_publications.csv` sera généré dans le même répertoire.

## Dépendances

- `requests`
- `pandas`

Installez-les si nécessaire avec :

```bash
pip install requests pandas
```

## Informations supplémentaires

Pour plus de détails sur les paramètres disponibles et les fonctionnalités de l'API Zenodo, consultez la documentation officielle : [https://developers.zenodo.org/](https://developers.zenodo.org/)

## Auteur

Projet développé par [Andréa Nébot](https://github.com/steffynebot), data scientist spécialisée en scientométrie et analyse des publications scientifiques.

