#!/bin/bash
source $(dirname $0)/common.sh

host=$1

if [ $# -lt 1 ]
then
    echo "Deficient parameter entered."
    exit 1
fi

fqdn $host

https=$(nc -vz $host 443 2>&1 |grep open)

if [ ! "$https" ]; then
    echo "HTTPS error!!"
fi
