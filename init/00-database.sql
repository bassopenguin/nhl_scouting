CREATE DATABASE player_database;

CREATE SCHEMA scouting_schema;

CREATE TABLE scouting_schema.league (
    id serial PRIMARY KEY,
    league_name text
);

CREATE TABLE scouting_schema.player (
    id serial PRIMARY KEY,
    name text,
    cs_rank integer,
    gem boolean DEFAULT NULL,
    league_id integer NOT NULL REFERENCES scouting_schema.league (id)
);

CREATE TABLE scouting_schema.scout (
    id serial PRIMARY KEY,
    name text,
    overall text
);

CREATE TABLE scouting_schema.region_familiarity (
    id serial PRIMARY KEY,
    league_id integer NOT NULL REFERENCES scouting_schema.league (id),
    scout_id integer NOT NULL REFERENCES scouting_schema.scout (id),
    familiarity text
);

CREATE TABLE scouting_schema.scout_assignment (
    id serial PRIMARY KEY,
    scout_familiarity integer NOT NULL REFERENCES scouting_schema.region_familiarity (id),
    completion_date date
);

CREATE TYPE scouting_schema.report_type AS enum ( 'Skills',
    'Potential',
    'Strengths',
    'Style',
    'Character'
);

CREATE TABLE scouting_schema.scout_report (
    id serial PRIMARY KEY,
    player_id integer NOT NULL REFERENCES scouting_schema.player (id),
    assignment_number integer NOT NULL REFERENCES scouting_schema.scout_assignment (id),
    report_type scouting_schema.report_type
);
