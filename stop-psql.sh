#!/bin/bash

echo "stopping psql"
docker stop psql >/dev/null || exit 1

echo "psql stopped"
