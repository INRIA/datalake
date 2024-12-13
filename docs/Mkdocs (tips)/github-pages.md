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
.git  # Dossier du dépôt Git
.github  # Dossier de configuration GitHub
.gitignore  # Fichier pour spécifier les fichiers à ignorer
README.md  # Fichier principal de documentation du projet
docs  # Dossier contenant les fichiers de documentation
mkdocs.yml  # Fichier de configuration MkDocs
```

### Url importantes

- Page du dépôt principal : https://github.com/INRIA/datalake
- Documentation du projet (hébergée sur GitHub Pages) : https://inria.github.io/datalake/
- Actions (workflows CI/CD) : https://github.com/INRIA/datalake/actions

## Workflow

1. **Push vers GitHub**

    Lorsque vous effectuez un `git push` vers une branche, les fichiers 
modifiés sont envoyés au dépôt distant. Cela déclenche les workflows 
configurés dans GitHub Actions si des événements correspondants sont 
définis (par exemple, sur `push`).

2. **Déclenchement du Workflow GitHub Actions**

    GitHub détecte le **push** et exécute le fichier de workflow 
défini dans `.github/workflows/main.yml`.   

3. **Installation de l'environnement**

    Dans un projet MkDocs, les étapes  incluent :
        - Vérifier le code source en le clonant.
           - Installer Python et les dépendances requises :
           - MkDocs et ses plugins (`mkdocs-material`, etc.).
        - Toute autre bibliothèque spécifiée dans le workflow.

3. **Installation de l'environnement**

    Dans un projet MkDocs, les étapes typiques incluent :

    - Vérifier le code source en le clonant.
      - Installer Python et les dépendances requises :
           - MkDocs et ses plugins (`mkdocs-material`, etc.).
           - Toute autre bibliothèque spécifiée dans le workflow.

4. **Génération des fichiers statiques** 

    Une fois l'environnement prêt, la commande `mkdocs build` est 
exécutée pour convertir les fichiers Markdown en pages HTML statiques, selon la configuration définie dans `mkdocs.yml`.

5. **Déploiement sur GitHub Pages**

    Si la branche concernée est `main`, la commande `mkdocs gh-deploy` est exécutée :

       - Elle génère et pousse les fichiers HTML vers la branche `gh-pages`.
       - GitHub Pages sert automatiquement ces fichiers comme un site web.

6. **Mise à jour du site**
    
    Après le déploiement sur `gh-pages`, le site hébergé sur GitHub Pages 
(par ex. `https://inria.github.io/datalake/`) est automatiquement mis à jour avec les dernières modifications.

7. **Notification et suivi**

    GitHub affiche les logs du workflow dans l'onglet **Actions**, où vous pouvez
vérifier le succès ou l'échec des différentes étapes. En cas de problème 
(ex. : erreur de configuration), vous recevez une notification pour corriger et pousser une mise à jour.

## Debuguer le workflow

[//]: # (![Action button]&#40;Images/2024-12-13_11-28-35.png&#41;{ width="400" })

[//]: # ()
[//]: # (![build]&#40;Images/2024-12-13_11-37-06.png&#41;{ width="400" })

[//]: # ()
[//]: # (![gh-pages]&#40;Images/2024-12-13_11-37-31.png&#41;{ width="400" })

[//]: # ()
[//]: # (![see build details]&#40;Images/2024-12-13_11-38-08.png&#41;{ width="400" })

[//]: # ()
[//]: # (![build details]&#40;Images/2024-12-13_11-38-30.png&#41;{ width="400" })