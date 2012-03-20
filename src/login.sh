#! /bin/bash

HOME_DIRECTORY="/home/"
USER_HOME=""
USER_SHELL="/bin/bash"
GROUP_NAME="cs153sp2012"

read -p "Enter your username (e.g. djmvfb): " user
read -sp "Enter your desired password: " password

USER_HOME="${HOME_DIRECTORY}${user}"

# Add this user using the adduser command
## UNCOMMENT THE LINE BELOW WHEN READY
# echo \"${user}\":\"${password}\"::${GROUP_NAME}::${USER_HOME}:${USER_SHELL} | newusers
echo "Now calling $ newusers \"${user}\":\"${password}\"::${GROUP_NAME}::${USER_HOME}:${USER_SHELL}" 

echo "You may now log in using the username and password you provided."
echo "You will be booted off so that you can use your own user account."

# Immediately log out
#exit

