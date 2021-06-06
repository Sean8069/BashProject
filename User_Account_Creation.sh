#!/usr/bin/bash

# Create a shell script that adds users to the same Linux system as the script is executed on.
# Usage: ./User_Account_Creation.sh



# Make sure the script is being executed with superuser privileges.
if [[ ${UID} -ne 0 ]]
then
	echo 'You are not a root user, exiting program...'
	exit 1
fi

# Get the username (login).
read -p 'Please enter the desired username: ' ${USERNAME}

# Get the real name (contents for the description field).
read -p 'Please enter the name of the person who this account is for: '${COMMENT}

# Get the password.
read -p 'Please set a password for the user: ' ${PASSWORD}

# Create the user with the password.
useradd -c "${USERNAME}" -m $USERNAME

# Check to see if the useradd command succeeded.

# Set the password.

# Check to see if the passwd command succeeded.

# Force password change on first login.

# Display the username, password, and the host where the user was created.
