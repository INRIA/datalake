# Vérification des équipes sans adresse AureHAL

Ce notebook a pour objectif d'identifier les équipes Inria mentionnées dans les publications HAL qui ne disposent pas d'une adresse structurée dans l'AureHAL. Cela permet de repérer les éventuels oublis ou incohérences dans le référencement des structures, et d'améliorer la qualité des données liées aux affiliations.

## Objectifs

- Charger les données exportées depuis HAL ou BASTRI contenant les informations d’auteurs et d’équipes.
- Identifier les équipes dont l’adresse AureHAL est manquante ou incorrecte.
- Faciliter la vérification manuelle ou automatisée de ces cas.

## Contenu du notebook

Le notebook comprend les étapes suivantes :

1. **Importation des bibliothèques nécessaires** : pandas, numpy, etc.
2. **Chargement des données** : lecture des exports CSV ou JSON contenant les affiliations et identifiants HAL.
3. **Filtrage des équipes** :
   - Extraction des lignes sans identifiant `idStructureHal`
   - Détection des structures multiples par ligne (séparées par des `;`)
4. **Nettoyage des données** :
   - Suppression des doublons
   - Séparation des structures multiples en lignes distinctes
5. **Préparation pour vérification** :
   - Ajout d'une colonne booléenne pour indiquer la présence ou non d’un `idStructureHal`
   - Création d’un tableau final filtré prêt pour correction ou analyse manuelle
6. **Export des résultats** : possibilité de sauvegarder en CSV ou Excel les équipes à vérifier

## Utilisation

1. Cloner ce dépôt :
   ```bash
   git clone https://github.com/ton-repo/verification_equipes_sans_adresse_aurehal.git
   cd verification_equipes_sans_adresse_aurehal

2. Ouvrir le notebook avec Jupyter :
   ```bash
   jupyter notebook verification_equipes_sans_adresse_aurehal.ipynb
   
## Auteur

Projet développé par [Andréa Nébot](https://github.com/steffynebot), data analyst.
