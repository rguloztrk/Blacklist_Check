#!/bin/bash
source $(dirname $0)/common.sh

host=$1
port=$2
user=$3
pass=$4

if [ $# -lt 4 ]
then
    echo "Deficient parameter entered."
    exit 1
fi

fqdn $host

ftp=$(curl -s ftp://$host:$port --user $user:$pass)

if [[ ! $ftp ]]; then
    echo "FTP error!!"
fi
