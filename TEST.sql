CREATE DATABASE EURO_DB;

USE EURO_DB;

SELECT * FROM GOAL_DETAILS;

SELECT PLAYER_ID
FROM GOAL_DETAILS
GROUP BY PLAYER_ID
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT * FROM PLAYER_MAST;

ALTER TABLE PLAYER_MAST
CHANGE COLUMN ï»¿player_id PLAYER_ID INT;

SELECT * FROM PLAYER_MAST
WHERE PLAYER_ID = (SELECT PLAYER_ID
FROM GOAL_DETAILS
GROUP BY PLAYER_ID
ORDER BY COUNT(*) DESC
LIMIT 1);

SELECT * FROM SOCCER_COUNTRY;

SELECT PM.PLAYER_NAME, SC.COUNTRY_NAME, TABLE2.HIGH
FROM
(SELECT PLAYER_ID
FROM GOAL_DETAILS
GROUP BY PLAYER_ID
ORDER BY COUNT(*) DESC
LIMIT 1) AS TABLE1
INNER JOIN
PLAYER_MAST AS PM
ON TABLE1.PLAYER_ID = PM.PLAYER_ID
INNER JOIN
SOCCER_COUNTRY AS SC
ON PM.TEAM_ID = SC.ï»¿country_id
INNER JOIN
(SELECT PLAYER_ID , COUNT(*) AS HIGH
FROM GOAL_DETAILS
WHERE PLAYER_ID = (SELECT PLAYER_ID
FROM GOAL_DETAILS
GROUP BY PLAYER_ID
ORDER BY COUNT(*) DESC
LIMIT 1)
GROUP BY MATCH_NO, PLAYER_ID
ORDER BY COUNT(*) DESC
LIMIT 1
) AS TABLE2
ON TABLE2.PLAYER_ID = TABLE1.PLAYER_ID;



# 10. Write a SQL query to find the players who scored goals in each match.
-- Group the result set on match number, country name and player name.
-- Sort the result-set in ascending order by match number.
-- Return match number, country name, player name and number of goals.
-- use tables goal_details, soccer_country, player_mast


SELECT * FROM PLAYER_MAST;
SELECT * FROM GOAL_DETAILS;
SELECT * FROM SOCCER_COUNTRY;

select gd.match_no, sc.country_name, pm.player_name, count(goal_id) as no_of_goals
from goal_details as gd, soccer_country as sc, player_mast as pm
where gd.player_id = pm.player_id and pm.team_id = sc.ï»¿country_id
group by gd.match_no, sc.country_name, pm.player_name
order by gd.match_no asc;





