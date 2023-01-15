# CTE is awesome!
# This elegant code doesn't work if nobody cancel or all cancel(by changing few line of code)
# In real work situation, I will just use pd.fillna(0)
# Write your MySQL query statement below
WITH total AS(
    SELECT t.request_at, 
           COUNT(t.id) AS unbaned_user
    FROM Trips t
    JOIN Users u1
    ON t.client_id = u1.users_id
    JOIN Users u2
    ON t.driver_id = u2.users_id
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND u1.banned = 'No'
    AND u2.banned = 'No'
    GROUP BY t.request_at
)
,
complete_order AS(
    SELECT t.request_at,
            COUNT(t.id) AS no_cancel_users
    FROM Trips t
    JOIN Users u1
    ON t.client_id = u1.users_id
    JOIN Users u2
    ON t.driver_id = u2.users_id
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND u1.banned = 'No'
    AND u2.banned = 'No'
    AND t.status = 'completed'
    GROUP BY t.request_at)

SELECT t.request_at AS Day,
       ROUND(((t.unbaned_user - c.no_cancel_users) / t.unbaned_user), 2) AS 'Cancellation Rate'
FROM total t
JOIN complete_order c
ON t.request_at = c.request_at
    
### REAL SOLUTION
# After debugging, I realize the error is on the conditional statement t.status = 'completed'. Some date will disappear, if I include this(No completed order on that day).
# Therefore, I include this conditional statement in the SELECT clause to make it work.
# Actually, I saw this code pattern a lot in my internship, during that time, I was naive and thought it's unnecessary.....
WITH total AS(
    SELECT t.request_at, 
           COUNT(t.id) AS unbaned_user
    FROM Trips t
    JOIN Users u1
    ON t.client_id = u1.users_id
    JOIN Users u2
    ON t.driver_id = u2.users_id
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND u1.banned = 'No'
    AND u2.banned = 'No'
    GROUP BY t.request_at
)
,
complete_order AS(
    SELECT t.request_at,
        SUM(CASE WHEN t.status != 'completed' 
            THEN 1 
            ELSE 0
            END) AS cancel_users
    FROM Trips t
    JOIN Users u1
    ON t.client_id = u1.users_id
    JOIN Users u2
    ON t.driver_id = u2.users_id
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND u1.banned = 'No'
    AND u2.banned = 'No'
    GROUP BY t.request_at)

SELECT t.request_at AS Day,
       ROUND((c.cancel_users / t.unbaned_user), 2) AS 'Cancellation Rate'
FROM total t
JOIN complete_order c
ON t.request_at = c.request_at
