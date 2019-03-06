#!/bin/bash

echo "checking for docker network; creating if missing"
NETWORK="psql-pgql"
if [[ "$(docker network ls | grep --count "psql-pgql")" -eq 1 ]] ; then
	echo "$NETWORK network already exists"
else
	echo "creating missing $NETWORK"
	docker network create "$NETWORK"
fi

echo "starting psql"
docker run \
	--detach \
	--expose 5432 \
	--name psql \
	--network "$NETWORK" \
	-p 5432:5432 \
	--rm \
	--volume scouting:/var/lib/postgresql/data \
	psql:latest \
	>/dev/null \
	|| exit 1

echo "psql started"
