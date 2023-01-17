#Am I creative?
#After checking the answer, everybody uses this trick lol......
SELECT name
FROM(
SELECT c.name, COUNT(c.id) AS vote
FROM Candidate c
JOIN Vote v ON
c.id = v.candidateId
GROUP BY c.id
ORDER BY vote DESC) temp
LIMIT 1
