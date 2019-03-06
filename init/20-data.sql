insert into scouting_schema.league(name) values
('SHL'),
('Liiga'),
('OHL'),
('QMJHL'),
('WHL');
insert into scouting_schema.player(name, cs_rank, league_id) values
('Top Prospect', 1, 4),
('Number Two', 2, 3),
('Someone else', 42, 4);
insert into scouting_schema.scout(name, overall) values
('Scout A', 'A+'),
('Scout B', 'B-'),
('Scout E', 'E');
