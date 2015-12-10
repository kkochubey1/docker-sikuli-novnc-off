#!/bin/bash

set -ex

# Clean up docker containers
docker stop sikuli_6081 || true
docker rm -f sikuli_6081 || true

# Srart docker container with VNC session
docker run -d --name sikuli_6081 -p 6081:6080 -v /dev/shm:/dev/shm -v $(pwd):/var/src/sikuli_scripts kkochubey1/sikuli-novnc:latest

sleep 5

# Open browser and use it size as screen resolution
dockerhost_ip=$(docker-machine ip $(docker-machine active))
open 'http://'$dockerhost_ip':6081'

sleep 5

curl -Ls -o /dev/null 'http://'$dockerhost_ip':6081'

# Make Chrome as default browser
docker exec sikuli_6081 bash -c 'sudo -E -i -u ubuntu bash -c \
 "export DISPLAY=:1; export TEMP=/tmp/; google-chrome --no-default-browser-check --nosandbox --make-default-browser&"'

sleep 5

# Start sikuli-ide with smoke test opened for edit
docker exec -t sikuli_6081 bash -c 'sudo -E -i -u ubuntu bash -c \
"export DISPLAY=:1; export TEMP=/tmp/; cd /var/src/sikuli_scripts/; /usr/bin/sikuli-ide '$@'"'

# Clean up docker containers
#docker stop sikuli_6081 || true
#docker rm -f sikuli_6081 || true