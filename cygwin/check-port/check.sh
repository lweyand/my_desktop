#!/usr/bin/env bash
# Script pour palier au manque de netcat sur la machine

set -o nounset

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

function success(){
    echo -e -n "["
    echo -e -n "${GREEN}OK"
    echo -e "${NOCOLOR}] ${1}"
}

function failed(){
    echo -e -n "["
    echo -e -n "${RED}KO"
    echo -e "${NOCOLOR}] ${1}"
}

function check_port() {
    local -r dest=$1
    local -r port=$2

    $(timeout 1 bash -c "cat < /dev/null > /dev/tcp/${dest}/${port}")
    local -r result=$?
    if [ ${result} -eq 0 ]; then
        success "${dest}:${port}"
    else
        failed "${dest}:${port}"
    fi
}

function usage() {
 echo "Usage: $(basename "$0") target_ip target_port"
}

if [ "$#" -ne 2 ]; then
    failed "Illegal number of parameters"
    usage
    exit 1
fi

check_port $1 $2
