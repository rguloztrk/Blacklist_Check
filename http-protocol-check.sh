#!/bin/bash
source $(dirname $0)/common.sh

host=$1

if [ $# -lt 1 ]
then
    echo "Deficient parameter entered."
    exit 1
fi

fqdn $host

http=$(nc -vz $host 80 2>&1 | grep open)

if [ ! "$http" ]; then
    echo "HTTP error!!"
fi
