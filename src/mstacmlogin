#! /bin/bash

HOME_DIRECTORY="/home/"
USER_HOME=""
USER_SHELL="/bin/bash"
GROUP_NAME="cs153sp2012"

read -p "Enter your username (e.g. djmvfb): " user && \
read -sp "Enter your desired password: " password && \

USER_HOME="${HOME_DIRECTORY}${user}" && \

# Add this user using the adduser command
## UNCOMMENT THE LINE BELOW WHEN READY
# sudo $(echo \"${user}\":\"${password}\"::${GROUP_NAME}::${USER_HOME}:${USER_SHELL} | newusers) && \
perl ./add153users.pl "${user}" "${password}" && \

echo "You may now log in using the username (\"${user}\") and password you provided." && \
echo "You will be booted off so that you can use your own user account." && \

# Log the connection to our log
DATE=`date "+%d.%m.%Y %Hh%Mm"`
IP=`echo $SSH_CONNECTION | awk '{print $1}'`
echo "${DATE} - ${IP}\nCreated account for \"${user}\"" >> /var/log/ssh_connections.log

# Immediately log out

