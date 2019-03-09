# nhl_scouting

## Background

While playing NHL 19 Franchise mode, I created a new team and was excited by the new scouting mechanics.
However, that led me to consider how I could optimize my scouting.
For a long time now, I've wanted to explore GraphQL and this seems like a good excuse to do both!

## Description

This project will create a database schema of Players and Scouts and use GraphQL (and probably React on the front-end) to manage scout assignments.
The vision is that this database would hold information about scouting accuracy and allow the best performance in the draft by having complete scouting reports for the most players.

## Usage

- Build the psql image using `build-psql.sh`
- Start the psql:latest container with `start-psql.sh` (on first run, this will cause the database to be created using the SQL scripts from ./init, if the volume doesn't exist, Docker should create it automatically)
- Start the pgql:rpi container with `start-pgql.sh postgres://username:password@host:port/database_name` **NOTE: the pgql:rpi image was built on the Raspberry Pi with the same Dockerfile from the graphile/postgraphile public image; it was needed when running on the ARM architecture**
- Stop the psql container using `stop-all.sh`
- **NOTE:** If needed, use `drop-create-volume.sh` to drop the existing data and re-create the volume _(this is useful for making the initialization scripts run again on psql startup)_
