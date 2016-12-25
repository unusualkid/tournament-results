-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

 -- Jump out of tournament database to allow droping.
\c vagrant

DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

-- Connect to tournament database.
\c tournament

-- Drop the tables to allow for multiple runs of this file.
DROP TABLE IF EXISTS players;

DROP TABLE IF EXISTS matches;

CREATE TABLE players (id SERIAL primary key,
                    name TEXT);

CREATE TABLE results (match_id SERIAL primary key,
                    winner_id INTEGER references players(id),
                    loser_id INTEGER references players(id));


-- Create a standings to show player's id, name, wins and matches played
-- and sort by the most wins and most matches played.
CREATE VIEW standings AS
            SELECT
            players.id, players.name,
            (SELECT COUNT(results.winner_id)
                FROM results
                WHERE players.id = results.winner_id) AS wins,
            (SELECT COUNT(results.loser_id)
                FROM results
                WHERE players.id = results.loser_id OR players.id = results.winner_id) AS matches_played
            FROM players
            ORDER BY wins DESC, matches_played DESC;

-- Create a view from standings with row to know each players' current standing
-- to help with SwissPairing.
CREATE VIEW standings_with_row AS
            SELECT ROW_NUMBER() OVER(ORDER BY wins DESC, matches_played DESC) AS row, *
            FROM standings;

