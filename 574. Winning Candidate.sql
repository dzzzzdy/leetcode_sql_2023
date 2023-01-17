#Am I creative?
SELECT name
FROM(
SELECT c.name, COUNT(c.id) AS vote
FROM Candidate c
JOIN Vote v ON
c.id = v.candidateId
GROUP BY c.id
ORDER BY vote DESC) temp
LIMIT 1
