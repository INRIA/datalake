# Notebook - Process d'extraction des documents HAL et océrisation des pdf
---

## Structure des dossiers

- **Dossier destination (`dst_dir`)** :  
  Créé automatiquement avec la même structure par année, contenant les fichiers texte OCR générés.

- **Dossier rapport** :  
  Créé automatiquement dans `dst_dir.parent/rapports/` pour stocker le fichier Excel de rapport.

---

## Installation (Windows)

### 1. Installer les dépendances Python

Assurez-vous d’avoir installé les paquets nécessaires :

```bash
pip install pdf2image pytesseract openpyxl tqdm ipywidgets
```

### 2. Installer Poppler

`pdf2image` utilise **Poppler** pour convertir les pages PDF en images.

- Téléchargez Poppler pour Windows ici :  
  [https://github.com/oschwartz10612/poppler-windows/releases/latest](https://github.com/oschwartz10612/poppler-windows/releases/latest)

- Choisissez l’archive ZIP la plus récente et décompressez-la (par exemple sur le Bureau)

- Le chemin du dossier `bin` à utiliser dans le script sera quelque chose comme :  
  `C:\Users\<votre_nom>\Desktop\poppler-xx.xx.x\Library\bin`

### 3. Installer Tesseract OCR

- Téléchargez et installez **Tesseract OCR** pour Windows :  
  [https://github.com/tesseract-ocr/tesseract/releases/latest](https://github.com/tesseract-ocr/tesseract/releases/latest)

- Pendant l’installation, sélectionnez les langues dont vous avez besoin (ex : français)

- Ajoutez le chemin du dossier `Tesseract` à votre variable d’environnement **PATH**  
  ou utilisez le chemin complet dans votre script (ex :  
  `pytesseract.pytesseract.tesseract_cmd = r"C:\Program Files\Tesseract-OCR\tesseract.exe"`)

---

## Utilisation du notebook

- **Paramètres** : à renseigner via les widgets Jupyter ou modifier directement dans le code  
  - `src_w` : chemin vers dossier source  
  - `dst_w` : chemin vers dossier destination  
  - `poppler_w` : chemin vers dossier `poppler\bin`  
  - `lang_w` : langue OCR (`fra`, `eng`, `deu`, etc.)  
  - `retry_w` : cochez pour ne traiter que les fichiers ayant échoué lors d’une précédente exécution  

- **Lancer OCR** : cliquer sur le bouton **Lancer OCR**  
  Le script :  
  - Parcourt tous les sous-dossiers par année  
  - Recherche les PDFs  
  - Convertit chaque page en image  
  - Extrait le texte via OCR  
  - Sauvegarde les fichiers `.txt` correspondants  

- **Suivi de progression** : barre de progression affichée dans le notebook pendant le traitement.

- **Résultats** :  
  - Fichiers texte dans `dst_dir`, sous-dossiers par année  
  - Rapport Excel dans `dst_dir.parent/rapports/rapport_ocr_from_img.xlsx` listant fichiers traités, succès et erreurs  

---

## Explication du code principal

1. **Fonction `ocr_un_fichier`**  
   - Convertit un PDF en images (une par page) via `convert_from_path()`  
   - Applique Tesseract OCR sur chaque image  
   - Concatène les textes extraits dans un fichier `.txt`  
   - Gère les fichiers déjà traités et les erreurs  
   - Retourne un dictionnaire résumé du traitement  

2. **Fonction `ocr_pdf_folder`**  
   - Prépare la liste des fichiers PDF à traiter (par année)  
   - Charge la liste des fichiers échoués si l’option `retry` est activée  
   - Lance les tâches OCR en multithreading (`ThreadPoolExecutor`) pour accélérer le traitement  
   - Collecte les résultats et génère un rapport Excel  

3. **Widgets Jupyter**  
   - Interface utilisateur simple avec champs texte, dropdown, checkbox et bouton  
   - Permet de modifier les paramètres sans toucher au code  
   - Affiche la progression et le rapport  

---

## Conseils pour éviter les erreurs courantes

- Vérifiez que le chemin `poppler_path` est correct et contient `pdfinfo.exe`  
- Sous Windows, utilisez des *raw strings* (`r"chemin"`) pour les chemins contenant des backslashs  
- Assurez-vous que Tesseract est installé et accessible depuis le `PATH` ou configurez explicitement `pytesseract.pytesseract.tesseract_cmd`  
- Organisez bien vos dossiers source et destination avec des sous-dossiers par année  

---

## En résumé

Ce notebook vous permet d’automatiser un workflow OCR complet sur des dossiers de PDF structurés par année.  
Il est efficace grâce au multithreading et ergonomique via les widgets Jupyter.  
Le rapport Excel final offre une vision claire du traitement et des fichiers problématiques.

---

## Contact / Support

Pour toute question ou aide concernant ce projet, n’hésitez pas à me contacter.
