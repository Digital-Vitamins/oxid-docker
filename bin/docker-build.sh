#!/bin/bash

docker-compose up -d
docker-compose build

# remove all containers
docker rm $(docker ps -a -q)
