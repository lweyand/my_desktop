# Installation

Installer OS
```
partitions: /
            /home
```
```
Encrypter la home
          la swap
```
installer deja-dup et python3-venv et restaurer la sauvegarde

python install -r requirements.txt

Créer le fichier *inventory/host_vars/localhost.yml*, et y mettre:
```yaml
---

ansible_connection: local
ansible_become_pass: <local password>

docker:
  user_to_add: <locall_user_name>

```

ansible-playbook -i inventory
lancer le script ansible