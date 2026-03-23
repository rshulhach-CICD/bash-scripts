#!/bin/bash

# This script deletes a user.

# Run as root.
if [[ "${UID}" -ne 0 ]]
then
  echo 'Please run with sudo or as root.' >&2
  exit 1
fi

# Assume the first argument is the user to delete.
USER_NAME="${1}"

if [[ "${#}" -lt 1 ]]
then
  echo "Usage: ${0} USER_NAME" >&2
  exit 1
fi

# Delete the user.
userdel "${USER_NAME}"

# Make sure the user got deleted.
if [[ "${?}" -ne 0 ]]
then
  echo "The account ${USER_NAME} was NOT deleted." >&2
  exit 1
fi

# Tell the user the account was deleted.
echo "The account ${USER_NAME} was deleted."

exit 0
