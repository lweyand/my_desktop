#!/usr/bin/env bash

set -o nounset

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

BASE_PATH="$(dirname ${0})"
CYGWIN_BASE_PATH='/cygdrive/c/Program Files (x86)/Cntlm'

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

function stop() {
    $(ps -W | awk '/cntlm.exe/,NF=1'  | xargs kill -f)
    success "Cntlm proxy stopped"
}

function status() {
    pid="$(ps -W | awk '/cntlm.exe/,NF=1')"

    if [ "x${pid}" == "x" ]; then
        failed "Cntlm proxy not started"
    else
        success "Cntlm proxy started (${pid})"
    fi
}

function start() {
    sleep 2s

    sh "${BASE_PATH}/update-cntlm-ini.sh" "${CYGWIN_BASE_PATH}"
    result=$?
    if [ ${result} -ne 0 ]; then
        failed "Can't update cntlm.ini file"
        exit ${result}
    fi

    "${CYGWIN_BASE_PATH}/cntlm.exe" -c "${CYGWIN_BASE_PATH}/cntlm.ini"
    result=$?
    if [ ${result} -ne 0 ]; then
        failed "Can't start cntlm proxy"
        exit ${result}
    fi
}

case "${1}" in
    start)
        start
        status
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    restart)
        stop
        start
        ;;
    *) echo "usage: ${0} [start|stop|restart|status]"; exit 1
esac
shift
