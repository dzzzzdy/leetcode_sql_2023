WITH TotalUsers AS(
    SELECT COUNT(DISTINCT player_id) AS Totalusers
    FROM Activity
),
LoginTwoDays AS(
    SELECT COUNT(DISTINCT a1.player_id) AS Logintwodays
    FROM Activity a1
    JOIN Activity a2 ON
    a1.player_id = a2.player_id
    WHERE (a1.player_id, a1.event_date) in(
        SELECT player_id, MIN(event_date)
        FROM Activity
        GROUP BY player_id
    )
    AND DATEDIFF(a2.event_date, a1.event_date) = 1
) 
SELECT ROUND((SELECT Logintwodays FROM LoginTwoDays)/(SELECT Totalusers FROM TotalUsers), 2) AS fraction
