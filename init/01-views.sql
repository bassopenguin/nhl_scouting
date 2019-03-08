CREATE VIEW scouting_schema.scouting_reports AS
SELECT
    scouting_schema.player.id AS player_id,
    scouting_schema.player.cs_rank,
    scouting_schema.scout_report.report_type,
    scouting_schema.scout_assignment.completion_date,
    scouting_schema.region_familiarity.familiarity,
    scouting_schema.scout.name AS scout_name,
    scouting_schema.scout.overall
FROM
    scouting_schema.player
    JOIN scouting_schema.scout_report ON scouting_schema.player.id = scouting_schema.scout_report.player_id
    JOIN scouting_schema.scout_assignment ON scouting_schema.scout_report.assignment_number = scouting_schema.scout_assignment.id
    JOIN scouting_schema.region_familiarity ON scouting_schema.scout_assignment.scout_familiarity = scouting_schema.region_familiarity.id
    JOIN scouting_schema.scout ON scouting_schema.region_familiarity.scout_id = scouting_schema.scout.id;

CREATE VIEW scouting_schema.draft_class_overview AS
SELECT
    scouting_schema.player.id AS player_id,
    scouting_schema.player.gem,
    scouting_schema.player.cs_rank,
    scouting_schema.player.name,
    scouting_schema.league.league_name,
    count(
        scouting_schema.scout_report.id) AS number_of_scout_reports
FROM
    scouting_schema.player
    JOIN scouting_schema.league ON scouting_schema.player.league_id = scouting_schema.league.id
    LEFT JOIN scouting_schema.scout_report ON scouting_schema.scout_report.player_id = scouting_schema.player.id
GROUP BY
    scouting_schema.player.id,
    scouting_schema.player.cs_rank,
    scouting_schema.player.name,
    scouting_schema.league.league_name
ORDER BY
    scouting_schema.player.cs_rank ASC;

CREATE VIEW scouting_schema.assignment_overview AS
SELECT
    scouting_schema.scout_assignment.id AS assignment_number,
    scouting_schema.scout_assignment.completion_date,
    scouting_schema.league.league_name,
    scouting_schema.scout.name AS scout_name,
    scouting_schema.scout.overall,
    scouting_schema.region_familiarity.familiarity AS region_familiarity
FROM
    scouting_schema.scout_assignment
    JOIN scouting_schema.region_familiarity ON scouting_schema.scout_assignment.scout_familiarity = scouting_schema.region_familiarity.id,
    JOIN scouting_schema.scout ON scouting_schema.region_familiarity.scout_id = scouting_schema.scout.id
    JOIN scouting_schema.league ON scouting_schema.region_familiarity.league_id = scouting_schema.league.id
ORDER BY
    scouting_schema.scout_assignment.completion_date ASC;

CREATE VIEW scouting_schema.reports_by_assignment AS
SELECT
    scouting_schema.scout_assignment.id AS assignment_id,
    scouting_schema.player.gem,
    scouting_schema.player.cs_rank,
    scouting_schema.player.name as player_name,
    scouting_schema.scout_report.report_type
FROM
    scouting_schema.scout_assignment
    JOIN scouting_schema.player ON scouting_schema.scout_report.player_id = scouting_schema.player.id
    JOIN scouting_schema.scout_report ON scouting_schema.scout_report.assignment_number = scouting_schema.scout_assignment.id
ORDER BY
    scouting_schema.player.cs_rank;
