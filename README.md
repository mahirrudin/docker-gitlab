# Gitlab-Lab
Gitlab-lab is docker-compose for running complete gitlab and gitlab ci. The main purpose is to simulate gitlab on development computer, so engineer free to do anything without fear of crashing production server.

## Requirements
1. Docker
2. Docker compose
3. Internet connection
4. TCP Port 2222, 9080, 4567, 9443 (or change by yourself in the docker-compose.yml)

## Setup

```
## setup gitlab
git clone --depth=1 https://github.com/mahirrudin/gitlab-lab
cd gitlab-lab
docker-compose up
```
```
## check if gitlab running
docker-compose ps
```
```
     Name                   Command                  State                             Ports
-------------------------------------------------------------------------------------------------------------------
gitlab-runners   /usr/bin/dumb-init /entryp ...   Up
gitlab-web       /assets/wrapper                  Up (healthy)   0.0.0.0:2222->22/tcp, 0.0.0.0:9443->443/tcp,
                                                                 0.0.0.0:4567->4567/tcp, 0.0.0.0:9080->80/tcp
```
Open browser `http://localhost:8080`, login with `root` and set for the password. You must copy runner token, and add to `script/runner-register.sh`

![](runner-token.png)

```
#!/bin/sh
# Get the registration token from:
# http://localhost:8080/root/${project}/settings/ci_cd

registration_token=CHANGEWITHYOURTOKEN

docker exec -it gitlab-runners \
  gitlab-runner register ....
```
Change `CHANGEWITHYOURTOKEN` with Runner token from gitlab. Then execute the script for registering runner.

```
script/runner-register.sh
```
