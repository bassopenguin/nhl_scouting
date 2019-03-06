#!/bin/bash

echo "starting build"
docker build --tag psql:latest ./

echo "finished build"
