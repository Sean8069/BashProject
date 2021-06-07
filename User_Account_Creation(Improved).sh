#!/usr/bin/bash`


# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
	echo 'You are not a root user, hence permission denied'
	exit 1
fi

# If the user doesn't supply at least one argument, then give them help.
if [[ "${#}" -lt 1 ]]
then
	echo 'Please supply at least one argument'
	echo 'Usage ./User_Account_Creation\(Improved\) USERNAME COMMENT_1 COMMENT_2...'
	exit 1
fi

# The first parameter is the user name.
USERNAME="${1}"

# The rest of the parameters are for the account comments.
shift
COMMENTS="${@}"

# Generate a password.
PASSWORD="$(date +%s%N | sha512sum | head -c12)"

# Create the user with the password.
useradd -c "${COMMENTS}" -m "${USERNAME}" -p "${PASSWORD}" 

# Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]]
then
	echo 'Something went wrong in user creation'
	exit 1
fi

# Force password change on first login.
passwd -e ${USERNAME}

# Display the username, password, and the host where the user was created.
echo
echo "username:${USERNAME}"
echo
echo "password:${PASSWORD}"
echo
echo "host:${HOSTNAME}"
