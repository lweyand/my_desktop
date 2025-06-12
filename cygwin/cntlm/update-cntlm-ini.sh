#!/bin/sh

BASE_PATH="$(dirname ${0})"

replaceip(){
    local -r path_to_cntlm="${1}"/cntlm.ini
    content=$( sed -r "s/Listen([[:blank:]]+)[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}:/Listen\1$(${BASE_PATH}/get-ip.sh):/g" "${path_to_cntlm}" )
    return_sed=$?
    if [ ${return_sed} -ne 0 ]; then
        exit ${return_sed}
    fi
    echo "$content" > "${path_to_cntlm}"
    exit 0
}

if [ $# -eq 1 ]; then
    path_to_cntlm="${1}"
fi

replaceip "${path_to_cntlm}"
