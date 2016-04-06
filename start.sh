#!/bin/bash

if [[ ! $(vagrant status | grep running) ]]; then
  vagrant up
fi

vagrant ssh <<"EOF" # These quotes are VERY important. Without them the line EXIT= wont work
# With quiet it won't throw an error in the module is already removed
sudo modprobe --remove --quiet openafs

# Remove any previously existing containers
# docker rm -f `docker ps -qa | xargs`

cd /vagrant

# Build the containers
docker-compose build

# Run them. The --abort-on-container-exit stops all containers if any container was stopped.
docker-compose up --abort-on-container-exit
EXIT_CODE=$(docker-compose ps "afs-client" | grep -oP "(?<=Exit )\d+")

# Remove the containers to ensure a clean slate the next time this script in ran.
docker-compose rm -f

exit $EXIT_CODE
EOF