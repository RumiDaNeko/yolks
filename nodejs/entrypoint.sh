#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Download Parser
wget -O /etc/parsepackage.js https://raw.githubusercontent.com/NotMinhDucGamingTV/Cloudcodehosting-sourcenconfig/refs/heads/main/nodejs/parsepackage.js

# Print Node.js Version
node -v

node /etc/parsepackage.js

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
