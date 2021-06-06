#!/usr/bin/bash

# Create a shell script that adds users to the same Linux system as the script is executed on.
# Usage: ./User_Account_Creation.sh



# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
   echo 'Please run with sudo or as root.'
   exit 1
fi

# Get the username (login).
read -p 'Enter the username to create: ' USER_NAME

# Get the real name (contents for the description field).
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

# Get the password.
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the account.
useradd -c "${COMMENT}" -m ${USER_NAME} -p ${PASSWORD}

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
  echo 'The account could not be created.'
  exit 1
fi


# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0

