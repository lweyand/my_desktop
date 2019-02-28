#!/usr/bin/env bash

set -o nounset

BASE_PATH="$(dirname ${0})"
#echo ${BASE_PATH}
LOG_FILE="/var/log/restore.log"

source ${BASE_PATH}/local-setup.sh

test=''
if [[ ${DEBUG} == 'true' ]]; then
    echo 'Debug mode enabled'
    test='--dry-run'
fi

# Restaure réoertoire Data
rsync -var --human-readable ${test} --log-file=${LOG_FILE} "${BASE_TARGET}${WORK_TARGET}/" "${BASE_ORIGIN}${WORK_ORIGIN}/"
#e=$?
# Restaure réoertoire home
rsync -var --human-readable ${test} --log-file=${LOG_FILE} "${BASE_TARGET}${HOME_TARGET}/" "${BASE_ORIGIN}${HOME_ORIGIN}/"
