#!/bin/bash
source $(dirname $0)/common.sh

host=$1

if [ $# -lt 1 ]
then
    echo "Deficient parameter entered."
    exit 1
fi


fqdn $host


blacklist="
dnsbl.sorbs.net
bl.scientificspam.net"

host_ip=$(dig +short $host |head -n1)

reverse=$(echo $host_ip | sed -ne "s~^\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)$~\4.\3.\2.\1~p")

echo -e "\e[1;47m$host\e[0m is searching on blaclist..."; echo

for bl in ${blacklist}
do
    listed=$(dig +short -t a ${reverse}.${bl}.)

    printf $(env tz=utc date "+%d.%m.%y_%h:%m")
    printf " ${reverse}.${bl}."

    if [[ $listed ]]
    then
        if [[ $listed == *"timed out"* ]]
        then
            echo -e "\e[1;33m[timed out]\e[0m"
        else
            echo -e "\e[1;31;5m[blacklisted] (${listed})\e[0m"
        fi
    else
        echo -e "\e[32;1m[not listed]\e[0m"
    fi
done
