#!/bin/bash
source $(dirname $0)/common.sh

host=$1

if [ $# -lt 1 ]
then
    echo "Deficient parameter entered."
    exit 1
fi


fqdn $host

if [[ "ping -c1 $host" ]]
then
    echo SUCCESS
else
    echo FAIL
fi
