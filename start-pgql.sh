#!/bin/bash

if [[ -z "$1" ]] ; then
	echo "Please provide complete postgres URL as parameter"
	echo "Example: ./start-pgql.sh postgres://username:password@url:port/database_name"
	exit 2
else
	DATABASE_URL="$1"
	echo "$DATABASE_URL"
fi

if [[ "$(docker ps | grep --count "psql")" -eq 1 ]] ; then
	docker run \
		--detach \
		--expose 5000 \
		--link psql \
		--name pgql \
		--network psql-pgql \
		-p 5000:5000 \
		--restart no \
		--rm \
		pgql:rpi \
		--connection "$DATABASE_URL" \
		--host 0.0.0.0 \
		--port 5000 \
		--schema scouting_schema
else
	echo "please start a psql container before starting the PostGraphile container"
	exit 1
fi

echo "started pgql"
