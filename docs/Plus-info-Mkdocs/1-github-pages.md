# Génération du portail MkDocs

**[MkDocs](https://www.mkdocs.org)** est un générateur de sites statiques open source conçu pour créer et  
publier facilement de la documentation à partir de fichiers Markdown. 

La configuration se fait via un fichier `mkdocs.yml` qui définit la structure, les  
thèmes (intégrés ou personnalisés) et les options du site.

## Principe générale

La génération automatique du site sur GitHub avec MkDocs repose sur  
l’utilisation de GitHub Actions, qui exécute un workflow défini dans un fichier  
de configuration situé dans le dossier `.github/workflows`. Ce workflow  
automatise les étapes de récupération du code source, l’installation des  
dépendances nécessaires, la génération des fichiers statiques à partir des  
fichiers Markdown, puis leur déploiement sur la branche dédiée au site,  
généralement `gh-pages`, utilisée par GitHub Pages pour servir le site web.

## Configuration de Github et MkDocs

### Dossiers

```
.github/
    └── 📁 workflows/
         └── 📝 main.yml       # Fichier de configuration du workflow GitHub Actions
docs/
    📁 Plus-info-Mkdocs/
         ├── 📁 Images/                # Dossier contenant les images pour les guides
         ├── 📝 1-github-pages.md      # Guide sur l'utilisation de GitHub Pages avec MkDocs
         ├── 📝 2-config-mkdoc.md      # Instructions pour configurer MkDocs
         ├── 📝 3-workflow.md          # Workflow pour automatiser les tâches avec MkDocs
         └── 📝 4-tips.md              # Conseils pratiques pour MkDocs
    📝 index.md           # Page principale ou table des matières du projet
🛑 .gitignore             # Liste des fichiers/dossiers exclus du contrôle de version Git
⚙️ mkdocs.yml             # Fichier de configuration principal pour MkDocs
📖 README.md              # Documentation principale du projet
📋 requirements.txt       # Liste des dépendances Python nécessaires pour le projet

```

### Url importantes

- Page du dépôt principal : https://github.com/INRIA/datalake
- Documentation du projet (hébergée sur GitHub Pages) : https://inria.github.io/datalake/
- Actions (workflows CI/CD) : https://github.com/INRIA/datalake/actions

## Faire tourner le serveur en local

Il suffit de lancer :

```
mkdocs serve
```
et d'aller sur http://127.0.0.1:8000/

```
% mkdocs serve
INFO    -  Building documentation...
INFO    -  [macros] - No default module `main` found
PDF rendering is disabled in serve mode
NFO    -  [macros] - Config variables: ['extra', 'config', 'environment', 'plugin', 'git', 'macros', 'filters', 'filters_builtin']
INFO    -  [macros] - Config macros: ['context', 'macros_info', 'now', 'fix_url']
INFO    -  [macros] - Config filters: ['pretty', 'relative_url']
INFO    -  Cleaning site directory
INFO    -  Documentation built in 0.23 seconds
INFO    -  [16:03:01] Watching paths for changes: 'docs', 'mkdocs.yml'
INFO    -  [16:03:01] Serving on http://127.0.0.1:8000/


```
!!! Warning
    Il est possible qu'il faille installer plein 
    d"extensions avec `pip ou autre ;-)
&nbsp;

!!! info inline end "Texte générés en partie par ChatGPT !"

