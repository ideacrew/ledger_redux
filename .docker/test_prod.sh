#!/bin/bash

if [ -z "$1" ]
then
  echo "using default port: 80"
else
  export HTTP_PORT=$1
  echo "using custom port: "$HTTP_PORT
fi

docker-compose -f docker-compose.prod.yml up -d db
docker-compose -f docker-compose.prod.yml build --build-arg DB_HOST='host.docker.internal'
docker-compose -f docker-compose.prod.yml up
