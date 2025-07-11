Exploitation de l'API HAL et Fichiers Locaux

Ce workflow KNIME présente plusieurs méthodes d'accès aux données scientifiques issues du portail **HAL (Hyper Articles en Ligne)**. Il permet d'extraire, analyser, visualiser et diffuser les résultats de manière automatique et reproductible.

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

## 🛠️ Méthodes d'extraction couvertes

### 1. 📡 API HAL (https://api.archives-ouvertes.fr/)
- Utilisation du **nœud Python** ou des nœuds natifs KNIME (`GET Request`)
- Choix du format de sortie : 
  - `XML-TEI` avec extraction via **XPath**
  - `JSON` avec extraction via **JSON Path**

### 2. 📁 Fichiers locaux
Le workflow prend en charge :
- 📄 Fichier **Excel** (`.xlsx`)
- 📄 Fichier **CSV** (`.csv`)
- 📄 Fichier **JSON** (`.json`)

> Ces fichiers peuvent contenir des données déjà extraites précédemment ou fournies par une autre source.

---

## 📊 Étapes du workflow

1. **Chargement des données**
   - Depuis l’API HAL ou fichiers locaux
2. **Extraction des champs clés**
   - Titre, auteurs, affiliations, résumés, mots-clés, etc.
3. **Nettoyage et transformation**
   - Normalisation des formats
   - Création de colonnes de synthèse
4. **Visualisation interactive**
   - Graphiques KNIME (barres, chronologies, nuages de mots)
   - Tableaux dynamiques
5. **Création d’un rapport**
   - Rapport HTML ou PDF avec `Report Designer`
6. **Envoi automatique par e-mail**
   - Via le nœud `Send Email` (configuration SMTP requise)

---

## 🔧 Paramètres configurables

| Élément                      | Description                              |
|------------------------------|------------------------------------------|
| URL HAL API                 | Lien de la requête (avec filtres)       |
| Format de sortie            | `xml`, `tei`, `json`                     |
| Extraction via              | `XPath` (XML) ou `JSONPath` (JSON)      |
| Données locales             | Sélection de fichiers en entrée          |
| Destinataires du rapport    | Adresse(s) e-mail                        |
| Format du rapport           | `HTML` ou `PDF`                          |

---

## Dépendances KNIME

- **KNIME REST Client Extension**
- **KNIME JSON/XML Processing**
- **KNIME Python Integration**
- **KNIME Reporting**
- **KNIME Excel/CSV/JSON Readers**
- **KNIME Email Extension**

---

## 📬 Envoi du rapport final

Le workflow permet de :
- Gérer dynamiquement les **destinataires du rapport**
- Envoyer en pièce jointe **le rapport HTML ou PDF**
- Ajouter un **message personnalisé**

> Pratique pour automatiser une **veille scientifique**, envoyer des bilans mensuels, ou alimenter une newsletter interne.

---

##  Cas d’usage

- Plateformes de recherche ou laboratoires souhaitant suivre la **production scientifique** de leurs membres
- Projets européens nécessitant un **suivi des publications**
- Départements de communication scientifique ou de valorisation

---

##  Licence et contributeurs

Ce projet est **open-source** et peut être adapté à d'autres dépôts comme **Zenodo**, **OpenAIRE**, etc.  
**Contributions, retours et améliorations sont les bienvenus.**
