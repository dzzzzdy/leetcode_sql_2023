# Write your MySQL query statement below
#Don't need to include COUNT(email) in SELECT statement
#HAVING COUNT(email) > 1
SELECT email AS Email 
FROM (
    SELECT  email, COUNT(email) AS count
    FROM Person
    GROUP BY email
    HAVING count > 1
) as temp

