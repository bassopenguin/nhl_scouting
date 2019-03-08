INSERT INTO scouting_schema.league (league_name)
        VALUES ('SHL'), ('Liiga'), ('OHL'), ('QMJHL'), ('WHL');
INSERT INTO scouting_schema.player (name, cs_rank, league_id)
        VALUES ('Top Prospect', 1, 4), ('Number Two', 2, 3), ('Someone else', 42, 4);
INSERT INTO scouting_schema.scout (name, overall)
        VALUES ('Scout A', 'A+'), ('Scout B', 'B-'), ('Scout E', 'E');
