#  KNIME Workflow – Extraction et Analyse de Publications via l'API Zenodo

Ce module Python s'intègre à un workflow KNIME pour automatiser la récupération et l’analyse de publications scientifiques depuis la plateforme **Zenodo**. Il constitue le point de départ d'un workflow plus vaste qui peut être enrichi par divers nœuds d'analyse, de visualisation et de transformation de données.

---

## Fonctionnalités principales

-  Utilisation de jetons d'authentification (`access_token`) pour interroger l'API Zenodo.
-  Requête dynamique via variables de flux (requête, tri, taille des résultats, etc.).
-  Extraction des métadonnées des publications :
  - Titre, DOI, date de publication
  - Auteurs, affiliations, ORCID
  - Type de ressource, mots-clés, sujets
  - Accès et lien Zenodo

-  Création d'une table KNIME pour traitement ultérieur dans le workflow.

---

## Intégration dans un workflow KNIME

Ce script sert de **point de départ** pour un pipeline analytique. Une fois les données extraites :

1. **Transformation et nettoyage** :
   - Normalisation des affiliations ou formats de date
   - Filtrage par types de publication ou mots-clés

2. **Analyse descriptive** :
   - Graphiques par année de publication
   - Distribution des types de ressources
   - Répartition des auteurs/institutions

3. **Visualisation** :
   - Graphiques interactifs via `KNIME JavaScript Views` ou `Plotly`
   - Cartes de chaleur, nuages de mots, diagrammes temporels

4. **Export et reporting** :
   - Génération de rapports PDF/HTML
   - Export vers Excel, CSV ou base de données

---

##  Variables de flux utilisées

| Nom               | Description                               | Valeur par défaut       |
|--------------------|-------------------------------------------|--------------------------|
| `access_token`     | Jeton d'accès API Zenodo (facultatif)     | Jeton public              |
| `query`            | Mot-clé de recherche                      | `Inria`                  |
| `sort`             | Critère de tri                            | `bestmatch`              |
| `size`             | Nombre de résultats par page              | `100`                    |

---

##  Dépendances

Ce script nécessite les bibliothèques suivantes (disponibles dans l'environnement Python de KNIME) :

- `requests`
- `pandas`
- `pyarrow`
- `xml.etree.ElementTree` (intégré à Python)
- `knime.scripting.io`

---

##  Exemple d'usage

Ce composant peut être intégré à un **workflow de veille scientifique**, d’analyse bibliométrique, ou pour l’alimentation automatique d’une **base de publications institutionnelles**.

---

## Auteurs et licence

Ce script est un composant open-source conçu pour un usage scientifique ou éducatif. Pour toute personnalisation ou contribution, merci de créer un ticket ou fork sur le dépôt associé.

