#!/bin/bash

echo "dropping volume will remove data"
docker volume rm scouting

echo "creating volume to enable PostgreSQL to re-run initialization scripts"
docker volume create scouting

echo "volume recreated and ready for initialization"
