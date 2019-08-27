#!/usr/bin/env bash

set -o errexit
set -o nounset

BASE_PATH="$(dirname ${0})"
#echo ${BASE_PATH}
LOG_FILE="/var/log/restore.log"

source ${BASE_PATH}/local-setup.sh

function restore() {
    local -r source_dir=$1
    local -r target_dir=$2

    test=''
    if [[ ${DEBUG} == 'true' ]]; then
        echo 'Debug mode enabled'
        echo "restore ${source_dir} ${target_dir}"
        test='--dry-run'
    fi

    rsync -rltDvWxP --human-readable ${test} --log-file=${LOG_FILE} "${source_dir}" "${target_dir}"
}

# Restaure répertoire Data
restore "${BASE_TARGET}${WORK_TARGET}/" "${BASE_ORIGIN}${WORK_ORIGIN}/"
#e=$?
# Restaure répertoire home
restore "${BASE_TARGET}${HOME_TARGET}/" "${BASE_ORIGIN}${HOME_ORIGIN}/"
