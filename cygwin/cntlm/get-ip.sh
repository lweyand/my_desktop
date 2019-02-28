#!/usr/bin/bash

function getIp() {
	# find default gateways
	# select the one with the lowest metric
	ip=`route print | egrep "^ +0.0.0.0 +0.0.0.0 +" | gawk 'BEGIN {
	metric=255; ip="0.0.0.0"; } { if ( $5 < metric ) { ip=$4; metric=$5; } }
	END { printf("%s\n",ip); }'`
	echo "${ip}"
}

getIp
