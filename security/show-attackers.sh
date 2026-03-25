#!/bin/bash

# Count the number of failed logins by IP address.
# If there are any IPs with over LIMIT failures, display the count, IP, and location.

usage() {
  # Display the usage and exit.
  echo "Usage: ${0} LOG_FILE LIMIT" >&2
  echo 'Shows count, IP, and location of failed logins with over LIMIT failures.' >&2
  exit 1
}

if [[ "${#}" -ne 2 ]]
then
  usage
fi

LOG_FILE="${1}"
LIMIT="${2}"
POSITION=3

if ! [[ "${LIMIT}" =~ ^[0-9]+$ ]]
then
  echo "The limit must be a non-negative integer." >&2
  exit 1
fi

# Make sure a file was supplied as an argument.
if [[ ! -f "${LOG_FILE}" ]]
then
  echo "Cannot open log file: ${LOG_FILE}" >&2
  exit 1
fi

if ! command -v geoiplookup &> /dev/null
then
  echo 'The geoiplookup command is required but not installed.' >&2
  exit 1
fi

# Display the CSV header.
echo 'Count,IP,Location'

# Loop through the list of failed attempts and corresponding IP addresses.
grep 'Failed' "${LOG_FILE}" | awk -v position="${POSITION}" '{print $(NF - position)}' | sort | uniq -c | sort -nr | while read -r COUNT IP
do
  # If the number of failed attempts is greater than the limit, display count, IP, and location.
  if [[ "${COUNT}" -gt "${LIMIT}" ]]
  then
    LOCATION=$(geoiplookup "${IP}" | awk -F ', ' '{print $2}')
    echo "${COUNT},${IP},${LOCATION}"
  fi
done
exit 0
