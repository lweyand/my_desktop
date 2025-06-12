#!/usr/bin/bash

path=$(pwd)
echo "${path}"
#/usr/bin/cygrunsrv --install cntlm-service --path "${path}/cntlm-service.sh" --args "start" --user "weyand_l" --type auto
/usr/bin/cygrunsrv --install cntlm-service --path "${path}/cntlm-service.sh" --args "start"
