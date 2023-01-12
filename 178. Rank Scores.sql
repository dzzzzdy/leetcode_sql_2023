# It's wired that I have to add '' after add to make it work now
# Dense_RANK 1 2 2 3
# RANK 1 2 2 4
# ROW_RANK 1 2 3 4
SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores
