#!/bin/sh
# Get the registration token from gitlab admin web

read -p "Runner Token : " registration_token 

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
