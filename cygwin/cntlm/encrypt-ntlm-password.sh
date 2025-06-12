#!/usr/bin/env bash

source ./local-setup.sh

who=$(whoami)
echo -n "Entrer le mot de passe NTLM (${who}):"
read -s password
echo
CYGWIN=nodosfilewarning "${CNTLM_BASE_PATH}"/cntlm.exe -H -u "${who}" -d ID << EOF
$password
EOF
