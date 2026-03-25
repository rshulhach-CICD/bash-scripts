#!/bin/bash

# This script shows the open network ports on a system.
# Use -4 as an argument to limit output to IPv4 ports.

NETSTAT_OPTIONS='-nutl'

if [[ "${1}" = '-4' ]]
then
  NETSTAT_OPTIONS='-4nutl'
fi

PORTS=$(netstat ${NETSTAT_OPTIONS} | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}' | sort -n | uniq)
echo "${PORTS}"
