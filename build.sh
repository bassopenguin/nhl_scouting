#!/bin/bash

echo "starting build"
docker build --tag psql:latest /home/elephant/players

echo "finished build"
