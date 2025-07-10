#  Exploitation de l’API HAL et Fichiers Locaux – Collection de Workflows KNIME

Ce dossier contient une série de **workflows KNIME** destinés à extraire, transformer et valoriser des données scientifiques provenant du portail **HAL (Hyper Articles en Ligne)** ou de **sources locales** (Excel, CSV, JSON). Ces workflows permettent de produire des analyses automatisées, reproductibles et partageables sous forme de rapports ou de tableaux de bord.

---

## 📁 Organisation du dossier

```text
📂 extraction_donnees_hal/
├── README.md                            ← Présentation des workflows
├── 01_extraction_fichiers_locaux/      ← Extraction depuis fichiers Excel, CSV, JSON
│   └── workflow_local_data.knwf
├── 02_extraction_python_api_hal/       ← Extraction via script Python (API HAL)
│   └── workflow_api_python.knwf
├── 03_extraction_get_jsonpath/         ← API HAL via GET + JSON Path
│   └── workflow_get_json.knwf
├── 04_extraction_get_xpath_xml/        ← API HAL via GET + XPath (XML-TEI)
│   └── workflow_get_xml.knwf
├── 05_tableau_software_export/         ← (À venir) Connexion + Export vers Tableau
│   └── [À venir]
```

---

##  Workflows disponibles

| N° | Nom du workflow                   | Source de données             | Méthode d’extraction         |
|----|----------------------------------|-------------------------------|-------------------------------|
| 1  | `workflow_local_data.knwf`       | Fichiers locaux (Excel, CSV…) | Lecteurs natifs KNIME         |
| 2  | `workflow_api_python.knwf`       | API HAL                       | Nœud Python (`requests`)      |
| 3  | `workflow_get_json.knwf`         | API HAL                       | `GET Request` + `JSON Path`   |
| 4  | `workflow_get_xml.knwf`          | API HAL                       | `GET Request` + `XPath (XML)` |
| 5  | *(à venir)*                      | Tableau Software              | Connexion + export Tableau    |

---

##  Étapes communes à tous les workflows

Chaque workflow suit un processus en 5 étapes standardisées :

1. **Extraction des données**  
   Depuis une API, des fichiers locaux ou un connecteur externe

2. **Exploration & nettoyage**  
   Suppression des doublons, traitement des formats, enrichissement

3. **Visualisation des données**  
   Graphiques, tableaux croisés, nuages de mots, dashboards interactifs

4. **Export des résultats**  
   Formats pris en charge : **HTML, Excel, CSV, JSON, PDF**

5. **Partage des résultats**  
   Envoi automatisé par e-mail ou publication sur une plateforme web

---

##  Objectifs

- Exploiter les métadonnées scientifiques HAL (titre, auteurs, affiliations…)
- Intégrer plusieurs sources : **API HAL**, fichiers locaux, connecteurs externes
- Fournir des **analyses visuelles et rapports** automatiques
- Favoriser le **partage et la diffusion** des résultats

---

##  Méthodes d’extraction prises en charge

- **Fichiers locaux** (`Excel`, `CSV`, `JSON`)  
  → via les lecteurs KNIME natifs

- **API HAL avec Python**  
  → via le nœud `Python Script` et la librairie `requests`

- **API HAL via GET + JSON Path**  
  → via `GET Request` + `JSON Path`

- **API HAL via GET + XPath (XML-TEI)**  
  → via `GET Request` + `XPath`

- **(À venir) Connexion Tableau Software**  
  → pour synchroniser et publier les données vers des dashboards

---

##  Formats d’export disponibles

| Type de sortie   | Format                     |
|------------------|----------------------------|
| Rapport          | `.html`, `.pdf`            |
| Données          | `.csv`, `.xlsx`, `.json`   |
| Visualisation    | Dashboards intégrés KNIME  |
| Diffusion        | Envoi par e-mail, export web |

---

##  Paramètres personnalisables

- URL de l’API HAL (avec filtres, pagination…)
- Format de sortie (`json`, `tei`, `xml`)
- Champs extraits : titres, auteurs, affiliations, résumés…
- Format du rapport final (HTML, PDF…)
- Liste des destinataires (e-mail)
- Nom et emplacement des fichiers d’export

---

##  Dépendances KNIME

- **KNIME REST Client Extension**
- **KNIME JSON/XML Processing**
- **KNIME Python Integration**
- **KNIME Reporting**
- **KNIME Excel/CSV/JSON Readers**
- **KNIME Email Extension**

---

##  Cas d’usage

- Suivi automatique de la **production scientifique** d’un laboratoire
- Génération de **rapports mensuels** ou tableaux de bord
- **Veille scientifique** ou valorisation des résultats d’un projet
- Automatisation de **bilans à partager** avec partenaires ou financeurs

---

##  Contributeurs & Licence

Ce projet est **open-source** et peut être adapté à d'autres dépôts comme **Zenodo**, **OpenAIRE**, etc.  
**Contributions, retours et améliorations sont les bienvenus.**
