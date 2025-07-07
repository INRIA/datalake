# 📚 KNIME Workflow – Exploitation de l'API HAL et Fichiers Locaux

Ce workflow KNIME présente plusieurs méthodes d'accès aux données scientifiques issues du portail **HAL (Hyper Articles en Ligne)**. Il permet d'extraire, analyser, visualiser et diffuser les résultats de manière automatique et reproductible.

---

##  Objectifs du workflow

- Extraire des données scientifiques depuis **HAL** :
  - via son API (formats XML-TEI ou JSON)
  - ou à partir de **fichiers locaux** (Excel, CSV, JSON)

- Exploiter et visualiser les métadonnées extraites (titre, auteurs, affiliations, résumés, etc.)

- Générer des **rapports HTML ou PDF**

- **Envoyer automatiquement** ces rapports par email via le nœud `Send Email`.

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

##  Dépendances KNIME

- **KNIME REST Client Extension** (pour API HAL)
- **KNIME Python Integration** (optionnel)
- **KNIME JSON/XML Processing**
- **KNIME Reporting **
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

Ce projet est open-source. Il peut être adapté à d'autres API de dépôts scientifiques (e.g. Zenodo, OpenAIRE). Contributions bienvenues.

