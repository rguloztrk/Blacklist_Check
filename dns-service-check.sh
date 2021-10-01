#!/bin/bash
source $(dirname $0)/common.sh

host=$1

if [ $# -lt 1 ]
then
    echo "Deficient parameter entered."
    exit 1
fi

fqdn $host

dns=$(dig $host A |grep "ANSWER SECTION")

if [ -z "$dns" ]; then
    echo "DNS error!!"
fi
