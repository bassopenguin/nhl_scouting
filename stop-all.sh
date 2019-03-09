#!/bin/bash

echo "stopping pgql" && docker stop pgql >/dev/null && echo "pgql stopped"
echo "stopping psql" && docker stop psql >/dev/null && echo "psql stopped"
