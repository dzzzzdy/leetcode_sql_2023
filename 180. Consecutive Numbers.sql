# Write your MySQL query statement below
SELECT DISTINCT num AS ConsecutiveNums
FROM(
    SELECT num, LEAD(num) OVER() AS 'lead', LAG(num) OVER() AS 'lag'
    FROM logs) AS temp
WHERE temp.num = temp.lead
AND   temp.num = temp.lag


# Similar solution
# Write your MySQL query statement below
SELECT DISTINCT num AS ConsecutiveNums
FROM(
    SELECT num, LEAD(num) OVER() AS 'lead1', lead(num,2) OVER() AS 'lead2'
    FROM logs) temp
WHERE temp.num = temp.lead1
AND temp.num = temp.lead2

# less straightforward solution
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON
l1.id = l2.id - 1
JOIN Logs l3 ON
l2.id = l3.id - 1
WHERE l1.num = l2.num
AND l1.num = l3.num
