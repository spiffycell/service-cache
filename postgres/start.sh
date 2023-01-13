#!/bin/bash

docker-compose build
docker-compose up -d
docker exec -it postgres psql -U ${POSTGRES_USER} ${POSTGRES_DB}
