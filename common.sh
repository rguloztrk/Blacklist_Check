#!/bin/bash
fqdn() {
    num=$(echo $1 | egrep "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$")
    alpha=$(echo $1 | egrep "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$")

    if [ -z "$num" ] && [ -z "$alpha" ]
    then
        echo "Incorrect format entered."
        exit 1
    fi

    if [[ -n $(host $1 |grep "not found") ]]
    then
        echo "Host not found."
        exit 1
    fi
}
