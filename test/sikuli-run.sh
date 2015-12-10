#!/bin/bash

set -ex

# Clean up docker containers
docker stop sikuli_6082 || true
docker rm -f sikuli_6082 || true

# Srart docker container with VNC session
docker run -d --name sikuli_6082 -p 6082:6080 -v /dev/shm:/dev/shm -v $(pwd):/var/src/sikuli_scripts kkochubey1/sikuli-novnc:latest

sleep 5

# Set screen resolution to run scripts
dockerhost_ip=$(docker-machine ip $(docker-machine active))
curl -Ls -o /dev/null 'http://'$dockerhost_ip':6082/redirect.html?width=1900&height=1200'

sleep 5

open 'http://'$dockerhost_ip':6082'

# Make Chrome as default browser
docker exec sikuli_6082 bash -c 'sudo -E -i -u ubuntu bash -c \
"export DISPLAY=:1; export TEMP=/tmp/; google-chrome --no-default-browser-check --nosandbox --make-default-browser&"'

sleep 5

# Start sikuli-ide and run test in parameter
docker exec -t sikuli_6082 bash -c 'sudo -E -i -u ubuntu bash -c \
"export DISPLAY=:1; export TEMP=/tmp/; cd /var/src/sikuli_scripts/ && /usr/bin/sikuli-ide -s -r '$@'"'

# Clean up docker containers
#docker stop sikuli_6081 || true
#docker rm -f sikuli_6081 || true