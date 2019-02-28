Le but de ce projet est de fournir un ensemble de scripts à utiliser, afin de mettre automatiquement le fichier cntlm.ini
à jour avec la bonne IP, dans un contexte d'IP dynamique.
Cette configuration de CNTLM requiert l'installation de Cygwin.

# Installation de Cygwin

* [site](https://sourceforge.net/projects/cntlm/)

Le démon ne tourne pas, il faut modifier la configuration par défaut, car le port 3128 est déjà occupés
N'installer pas Cygwin en mode service windows, on va le faire plus tard.

## Configuration de base

Editer le fichier cntlm.ini qui se trouve dans le répertoire d'installation de Cygwin.
```
Username        <YOUR_WINDOWS_ID>
Domain          <ENTERPRISE_DOMAIN>
Auth            NTLMv2
PassNTLMv2      
Proxy           <ENTERPRISE_PROXY_IP>:<ENTERPRISE_PROXY_PORT>
NoProxy         localhost, 127.0.0.*, 10.*, 192.168.*
Listen          <YOUR_IP>:3129
Listen          localhost:3129
```
Remplacer:
* **<YOUR_WINDOWS_ID>**: par votre id Windows
* **<YOUR_IP>**: par votre ip actuelle

## Génération de la chaine d'identification

Dans un shell cygwin, exécuter la commande:
```shell
$ sh encrypt-ntlm-password.sh
Entrer le mot de passe NTLM (weyand_l):<Entrez votre mot de passe puis tapper la touche ENTEE>
<tapper la touche ENTEE>
Password:
PassLM          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
PassNT          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
PassNTLMv2      01010101010101010101010101010101    # Only for user 'weyand_l', domain 'ID'

```

Récupérer le résultat de la ligne PassNTLMv2 et colles le dans le fichier cntlm.ini en remplacant les valeurs:
```
Username        <YOUR_WINDOWS_ID>
Domain          <ENTERPRISE_DOMAIN>
Auth            NTLMv2
PassNTLMv2      01010101010101010101010101010101
Proxy           <ENTERPRISE_PROXY_IP>:<ENTERPRISE_PROXY_PORT>
NoProxy         localhost, 127.0.0.*, 10.*, 192.168.*
Listen          <YOUR_IP>:3129
Listen          localhost:3129
``` 

# Création du service windows cntlm-service

Le script `cntlm-service.sh` doit être exécuté avec le user admin local windows.

2 solutions:
* dans le menu *Démarrer/Tous les Programmes/Cygwin*, faire clique droit sur **Cygwin64 Terminal/Exécuter en tant qu'Administrateur**
* depuis le terminal cygwin exécuter: 
  ```shell
  $ cygstart --action=runas <PATH_TO_CYGWIN_DIR>/bin/mintty.exe -i <PATH_TO_CYGWIN_DIR>/Cygwin-Terminal 
  ```
  Remplacer la valeur <PATH_TO_CYGWIN_DIR> par le chemin vers votre répertoire d'installation de Cygwin

Dans tous les cas, il faut ajouter une ligne à la fin du fichier .bashrc de l'admin local (j'ai pris nano, prenez votre éditeur préféré):
```shell
$ nano ~/.bashrc
export PATH=<CYGWIN_PATH_TO_CYGWIN_DIR>/bin:<CYGWIN_PATH_TO_CYGWIN_DIR>/:$PATH
```
La valeur de <CYGWIN_PATH_TO_CYGWIN_DIR> est le chemin vers le répertoire cygwin au format cygwin.
Exemple:
```
/cygdrive/c/cygwin64
```

Enfin exécuter la commande pour la création du service cntlm-service:
```shell
$ sh create-ctlm-service.sh
```

Pour vérifier que le service est lancé:
```shell
$ sh cntlm-service.sh status
[OK] Cntlm proxy started (9128)
```

# Les scripts

## encrypt-ntlm-password.sh
Script pour généré la clef à mettre dans le fichier `cntlm.ini`.

## cntlm-service.sh
Script qui permet de démarer/arrêter le proxy cntlm lorqu'il n'est pas en mode service windows.

```shell
$ sh /cygdrive/c/Workspace/github/cygwin/cntlm/cntlm-service.sh start
```
```shell
$ sh /cygdrive/c/Workspace/github/cygwin/cntlm/cntlm-service.sh status
```
```shell
$ sh /cygdrive/c/Workspace/github/cygwin/cntlm/cntlm-service.sh stop
```

## update-cntlm-ini.sh
Script qui met ajout l'adresse ip de la machine dans le fichier `cntlm.ini`.
Il est appelé par le script `cntlm-service.sh`.

## get-ip.sh
Récupère l'ip de la machine.

## create-ctlm-service.sh
Crée un service windows qui utilise le script `cntlm-service.sh`.
