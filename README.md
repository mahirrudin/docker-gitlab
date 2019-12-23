# Gitlab-Lab
Gitlab-lab is docker-compose for running complete gitlab and gitlab ci. The main purpose is to simulate gitlab on development computer, so engineer free to do anything without fear of crashing production server.

## Requirements
1. Docker
2. Docker compose
3. Internet connection
4. TCP Port 2222, 8080, 4567, 443 (or change by yourself in the docker-compose.yml)

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
gitlab-web       /assets/wrapper                  Up (healthy)   0.0.0.0:2222->22/tcp, 0.0.0.0:443->443/tcp,
                                                                 0.0.0.0:4567->4567/tcp, 0.0.0.0:8080->80/tcp
```
Open browser `http://localhost:8080`, login with `root` and set for the password. You must copy runner token, and add to `script/runner-register.sh`

![](runner-token.png)
