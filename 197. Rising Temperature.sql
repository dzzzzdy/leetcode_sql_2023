#Big L, never trust naive basic algorithms on date
# Write your MySQL query statement below
SELECT w1.id
FROM Weather w1
LEFT JOIN Weather w2 ON
w1.recordDate = w2.recordDate + 1 
WHERE w1.temperature > w2.temperature

#Solution 1
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate,w2.recordDate) = 1
WHERE w1.temperature > w2.temperature

#Solution
SELECT w1.id
FROM   Weather w1
JOIN Weather AS w2
ON w1.recordDate = ADDDATE(w2.recordDate, 1) 
WHERE w1.temperature > w2.temperature
