Installation de mon poste de DEV windows

# Windows:

* installer python sur windows
  * télécharger python
  * installer python avec le script : *windows/python/python_install.bat* (**non testé pour le moment!!!**)
  * `pip install powerline-shell`
* installer java
* installer maven: 
  * télécharger maven
  * exécuter le script d'installation: *windows/maven/maven_install.bat*
* installer cygwin
  * télécharger cygwin
  * exécuter le script d'installation: *windows/cygwin/install_cygwin.bat*
  * exécuter le script de configuration de la home: *windows/cygwin/configure_home_cygwin.bat*
* installer cntlm
  * dans cygwin utiliser les scripts *cygwin/cntlm* pour configurer et installer cntlm en service 
* installer putty:
  * télécharger putty
  * exécuter le script d'installation: *windows/putty/putty_install.bat*
* installer IntelliJ

# Cygwin

## configuration
Copier ma configuration de base de cygwin, qui se trouve dans cygwin/configuration, dans la home cygwin

/!\ : vérifier ce qui se trouve dans le ~/.bashrc orginel avant de l'écraser.

## cntlm
Les scripts bash permettant de contrôler cntlm sont dans cygwin/cntlm

## backup

Si un partage réseau est fourni pour faire des sauvegardes quotidiennes, alors, il y a les scripts *cygwin/rsync* qui permettent
de facilité la tâche.  

## Quand t'as pas telnet et que netcat se fait mettre en quarantaine par l'antivirus:

/!\ : requiert BASH4 

Le script dans cygwin/check-port permet de tester l'ouverture des ports vers une machine/vm/whatever.
