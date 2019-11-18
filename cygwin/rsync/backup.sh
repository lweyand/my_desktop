#!/usr/bin/env bash

set -o errexit
set -o nounset

BASE_PATH="$(dirname ${0})"
#echo ${BASE_PATH}
EXCLUDE_FILE="${BASE_PATH}/ExclusionRSync"
#echo ${EXCLUDE_FILE}
LOG_FILE="/var/log/backup.log"

source ${BASE_PATH}/local-setup.sh

function backup() {
    local -r source_dir=$1
    local -r target_dir=$2

    test=''
    if [[ ${DEBUG} == 'true' ]]; then
        echo 'Debug mode enabled'
        echo "backup ${source_dir} ${target_dir}"
        test='--dry-run'
    fi

    rsync -rtvWxP --exclude-from=${EXCLUDE_FILE} --delete --human-readable ${test} --log-file=${LOG_FILE} "${source_dir}" "${target_dir}"
}

if [[ -e ${EXCLUDE_FILE} ]]; then
    # Sauvegarde répertoire de travail
    backup "${BASE_ORIGIN}${WORK_ORIGIN}/" "${BASE_TARGET}${WORK_TARGET}/"
    # Sauvegarde répertoire home utilisateur
    backup  "${BASE_ORIGIN}${HOME_ORIGIN}/" "${BASE_TARGET}${HOME_TARGET}/"
else
    echo "No ${EXCLUDE_FILE} file found"
fi
