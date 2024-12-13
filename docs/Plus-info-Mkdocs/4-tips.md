# Ordre des entrées dans le menu


## Principe par défaut

Par défaut, MkDocs génère le menu à partir de l'arborescence 
des fichiers dans `docs/`, en triant les noms par ordre 
alphabétique et en utilisant les titres de niveau 1 (# Titre) 
des fichiers Markdown comme titres affichés. Si aucun titre
n'est défini, le nom du fichier est utilisé comme titre.

Généralement, ce n'est pas ce que l'on souhaite.

## Solution #1 : Nommage particulier des fichiers
Nommer les fichiers de sorte qu'ils respectent l'ordre 
souhaité (ici en mettant un numéro en début de fichier)


``` text
Arborescence des fichiers                 Correspondence avec les titres 
                                          dans les fichiers

docs/                                     Datalake DCIS
├── index.md                              ├── Accueil
└── More-about-Mkdocs/                    └── Plus info MkDocs
    ├── 1-github-pages.md                     ├── Génération du portail MkDocs
    ├── 2-config-mkdoc.md                     ├── Extensions MkDocs
    ├── 3-workflow.md                         ├── Workflow
    └── 4-tips.md                             └── Tips

```

## Solution #2 : Configuration explicite avec `nav:` dans `mkdocs.yml`

Une autre solution possible est de modifier directement l'ordre 
dans le fichier de configuration.
``` yaml
nav:
  - Accueil: index.md
  - Plus info MkDocs:
      - Génération du portail MkDocs: More-about-Mkdocs/1-github-pages.md
      - Extensions MkDocs: More-about-Mkdocs/2-config-mkdoc.md
      - Workflow: More-about-Mkdocs/3-workflow.md
      - Tips: More-about-Mkdocs/4-tips.md
```

## Cas particulier

Pour afficher un dossier avec un titre différent dans le menu, 
la seule solution est d’utiliser la configuration `nav` 
dans `mkdocs.yml`. Par exemple, pour un dossier  
nommé `Plus-info-Mkdocs` et une entrée de menu intitulée 
« *Plus d’infos sur MkDocs* »,  
vous devez écrire :

```yaml
nav:
  - Plus d’infos sur MkDocs:
      - Génération du portail: Plus-info-Mkdocs/1-github-pages.md
      - Extensions: Plus-info-Mkdocs/2-config-mkdoc.md
```  

Cela établit le lien entre le dossier réel et son alias dans le 
menu. Cette méthode est nécessaire si vous avez plusieurs dossiers.

&nbsp;

!!! info inline end "Texte générés en très grande partie par ChatGPT !"

