#Solution 1
# It's wired that I have to add '' after add to make it work now
# Dense_RANK 1 2 2 3
# RANK 1 2 2 4
# ROW_RANK 1 2 3 4
SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores

#Solution 2
# Write your MySQL query statement below
SELECT S1.score, 
    (SELECT COUNT(DISTINCT score)
    FROM Scores S2
    WHERE S1.score <= S2.Score) AS 'rank'
FROM Scores S1
ORDER BY Score DESC
