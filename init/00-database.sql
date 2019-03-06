create database player_database;
create schema scouting_schema;
create table scouting_schema.league (
	id serial primary key,
	league_name text
);
create table scouting_schema.player (
	id serial primary key,
	name text,
	cs_rank integer,
	league_id integer not null references scouting_schema.league(id)
);
create table scouting_schema.scout (
	id serial primary key,
	name text,
	overall text
);
