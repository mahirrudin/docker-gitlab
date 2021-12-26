#!/bin/sh
# Get the registration token from gitlab admin web

printf 'Wait for gitlab server up and run .'
until $(curl --output /dev/null --silent --head --fail http://gitlab.devsecops.lab); do
    printf '.'
    sleep 5
done
echo 'Input your runner registration token : '
read -p registration_token 

docker exec -it runner.devsecops.lab \
  gitlab-runner register \
    --non-interactive \
    --registration-token ${registration_token} \
    --locked=false \
    --description docker \
    --url http://gitlab \
    --executor docker \
    --docker-image docker:stable \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --docker-network-mode devsecops
