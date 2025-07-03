# Windows 10 Debloat 

Ce script PowerShell permet de désinstaller les applications préinstallées (bloatware) sur Windows 10 ainsi que McAfee s'il est détecté.

## Fonctionnalités

- Supprime les applications UWP inutiles (3D Builder, Xbox, Météo, Astuces, etc.)
- Désinstalle McAfee via WMI
- Vérifie les droits administrateur et relance le script avec élévation si nécessaire

## Utilisation

1. Enregistre le script dans un fichier nommé par exemple `bloatwaredecon.ps1`.

2. Exécute-le avec PowerShell :

   ```powershell
   powershell -ExecutionPolicy Bypass -File .\bloatwaredecon.ps1
