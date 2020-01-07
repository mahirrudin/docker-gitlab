@echo off
set /p registrationtoken="Enter Registration Token: "

docker exec -it gitlab-runner gitlab-runner register --non-interactive --registration-token "%registrationtoken%" --locked=false --description docker-stable --url http://gitlab-web --executor docker --docker-image docker:stable --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" --docker-network-mode gitlab-network
