# Write your MySQL query statement below
WITH time AS (SELECT a1.machine_id, (a2.timestamp - a1.timestamp) AS time
FROM Activity a1
JOIN Activity a2 ON
a1.machine_id = a2.machine_id
AND a1.process_id = a2.process_id
WHERE a1.activity_type = 'start'
AND a2.activity_type = 'end')

SELECT machine_id, ROUND(SUM(time)/COUNT(machine_id),3) AS processing_time
FROM time
GROUP BY machine_id
