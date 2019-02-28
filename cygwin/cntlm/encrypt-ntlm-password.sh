#!/usr/bin/env bash

BASE_PATH='/cygdrive/c/Program Files (x86)/Cntlm/'

who=$(whoami)
echo -n "Entrer le mot de passe NTLM (${who}):"
read -s password
echo
CYGWIN=nodosfilewarning "${BASE_PATH}"cntlm.exe -H -u "${who}" -p "${password}" -d ID
