@echo off
set /p registrationtoken="Enter Registration Token: "

docker exec -it runner gitlab-runner register --non-interactive --registration-token "%registrationtoken%" --locked=false --description docker --url http://gitlab --executor docker --docker-image docker:stable --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" --docker-network-mode devsecops
