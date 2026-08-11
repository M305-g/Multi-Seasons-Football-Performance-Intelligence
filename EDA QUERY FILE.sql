SELECT 'player_performance' AS dataset,COUNT(*) AS records
FROM football_analysis.player_performance_clean;

SELECT 'player_profiles', COUNT(*)
FROM football_analysis.player_profiles_clean;

SELECT p.player_id,
COUNT(DISTINCT p.season_name) AS seasons_played
FROM football_analysis.player_performance_clean p
JOIN football_analysis.player_profiles_clean pr
ON p.player_id = pr.player_id
GROUP BY p.player_id
ORDER BY seasons_played DESC;

SELECT COUNT(*) AS players,
seasons_played
FROM ( 
SELECT player_id,
COUNT(DISTINCT season_name) AS seasons_played
FROM football_analysis.player_performance_clean
GROUP BY player_id
) t
GROUP BY seasons_played
ORDER BY seasons_played;

SELECT player_id,
COUNT(DISTINCT season_name) AS seasons_played,
SUM(minutes_played) AS total_minutes,
AVG(minutes_played) AS avg_minutes
FROM football_analysis.player_performance_clean
GROUP BY player_id
HAVING COUNT(DISTINCT season_name) >= 2
ORDER BY total_minutes DESC
LIMIT 20;

SELECT player_id,
COUNT(DISTINCT season_name) AS seasons_played,
SUM(goals) AS total_goals,
SUM(assists) AS total_assists,
SUM(goals + assists) AS goal_contribution,
SUM(minutes_played) AS total_minutes
FROM football_analysis.player_performance_clean
GROUP BY player_id
HAVING COUNT(DISTINCT season_name)>=3
ORDER BY goal_contribution DESC
LIMIT 20;


SELECT player_id,
COUNT(DISTINCT season_name) AS seasons_played,
SUM(goals) AS total_goals,
SUM(assists) AS total_assists,
SUM(goals + assists) AS goal_contribution,
SUM(minutes_played) AS total_minutes,
ROUND(
(SUM(goals + assists) / SUM(minutes_played)) * 90,
2
) AS goal_contribution_per_90
FROM football_analysis.player_performance_clean
GROUP BY player_id
HAVING COUNT(DISTINCT season_name)>=3
AND SUM(minutes_played) >= 900
ORDER BY goal_contribution_per_90 DESC
LIMIT 20;

SELECT player_id,
COUNT(DISTINCT season_name) AS seasons_played,
MIN(goal_contribution) AS lowest_contribution,
MAX(goal_contribution) AS peak_contribution,
AVG(goal_contribution) AS average_contribution
FROM football_analysis.player_season_summary
GROUP BY player_id
HAVING COUNT(DISTINCT season_name) >= 3
ORDER BY peak_contribution DESC;

CREATE TABLE
player_profile_performance_summary
AS
SELECT
p.player_id,
p.player_name,
p.main_position,
p.foot,
p.height,
p.citizenship,
p.current_club_name,
COUNT(DISTINCT s.season_name) AS seasons_played,
SUM(s.total_goals) AS total_goals,
SUM(s.total_assists) AS total_assists,
SUM(s.goal_contribution) AS goal_contribution,
AVG(s.goal_contribution) AS avg_contribution
FROM football_analysis.player_profiles_clean p
JOIN football_analysis.player_season_summary s
ON p.player_id = s.player_id
GROUP BY 
p.player_id,
p.player_name,
p.main_position,
p.foot,
p.height,
p.current_club_name,
p.citizenship;

USE football_analysis;

SELECT 
main_position,
COUNT(*) AS players,
ROUND(AVG(goal_contribution),2) AS avg_goal_contribution,
MAX(goal_contribution) AS highest_goal_contribution
FROM football_analysis.player_profile_performance_summary
GROUP BY main_position
ORDER BY avg_goal_contribution DESC;

SELECT 
foot,
COUNT(*) AS players,
ROUND(AVG(goal_contribution),2) AS avg_goal_contribution,
MAX(goal_contribution) AS highest_goal_contribution
FROM football_analysis.player_profile_performance_summary
GROUP BY foot
ORDER BY avg_goal_contribution DESC;

SELECT 
player_name,
main_position,
foot,
height,
seasons_played,
goal_contribution
FROM player_profile_performance_summary
ORDER BY goal_contribution DESC
LIMIT 10;

SELECT 
current_club_name,
COUNT(*) AS players,
SUM(goal_contribution) AS total_goal_contribution,
ROUND(AVG(goal_contribution),2) AS avg_goal_contribution
FROM player_profile_performance_summary
WHERE current_club_name NOT IN ('Retired','Without Club','Unknown','---')
GROUP BY current_club_name
HAVING COUNT(*) >= 5
ORDER BY total_goal_contribution DESC
LIMIT 15;

SELECT *
FROM football_analysis.player_profile_performance_summary;
