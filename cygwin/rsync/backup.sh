#!/usr/bin/env bash

set -o nounset

BASE_PATH="$(dirname ${0})"
#echo ${BASE_PATH}
EXCLUDE_FILE="${BASE_PATH}/ExclusionRSync"
#echo ${EXCLUDE_FILE}
LOG_FILE="/var/log/backup.log"

source ${BASE_PATH}/local-setup.sh

if [[ -e ${EXCLUDE_FILE} ]]; then
    test=''
    if [[ ${DEBUG} == 'true' ]]; then
        echo 'Debug mode enabled'
        test='--dry-run'
    fi

    # Sauvegarde réoertoire de travail
    rsync -var --exclude-from=${EXCLUDE_FILE} --delete --human-readable ${test} --log-file=${LOG_FILE} "${BASE_ORIGIN}${WORK_ORIGIN}/" "${BASE_TARGET}${WORK_TARGET}/"
    #e=$?
    # Sauvegarde réoertoire home utilisateur
    rsync -var --exclude-from=${EXCLUDE_FILE} --delete --human-readable ${test} --log-file=${LOG_FILE} "${BASE_ORIGIN}${HOME_ORIGIN}/" "${BASE_TARGET}${HOME_TARGET}/"
else
    echo "No ${EXCLUDE_FILE} file found"
fi
