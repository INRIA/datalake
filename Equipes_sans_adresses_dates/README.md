
# Vérification des équipes sans adresse AureHAL

Ce notebook a pour objectif d'identifier les équipes Inria mentionnées dans les publications HAL qui ne disposent pas d'une adresse structurée dans l'AureHAL. Cela permet de repérer les éventuels oublis ou incohérences dans le référencement des structures, et d'améliorer la qualité des données liées aux affiliations.

## Objectifs

- Charger les données exportées depuis HAL ou BASTRI contenant les informations d’auteurs et d’équipes.
- Identifier les équipes dont l’adresse AureHAL est manquante ou incorrecte.
- Faciliter la vérification manuelle ou automatisée de ces cas.

## Contenu du notebook

1. Importation des bibliothèques nécessaires
2. Chargement et exploration des données
3. Traitement des équipes sans `idStructureHal`
4. Affichage des résultats filtrés pour analyse ou correction

## Utilisation

1. Cloner ce dépôt :
   ```bash
   git clone https://github.com/ton-repo/verification_equipes_sans_adresse_aurehal.git
   cd verification_equipes_sans_adresse_aurehal
   ```

2. Ouvrir le notebook avec Jupyter :
   ```bash
   jupyter notebook verification_equipes_sans_adresse_aurehal.ipynb
   ```

## Auteur·rice

Notebook créé par [Andréa NEBOT](https://github.com/steffynebot)
