WITH Rate AS(
SELECT question_id, 
       SUM(CASE WHEN action = 'answer' THEN 1
           ELSE 0 END)/
       SUM(CASE WHEN action = 'show' THEN 1 
           ELSE 0 END) AS rate                   
FROM SurveyLog
GROUP BY question_id)

SELECT question_id AS survey_log
FROM Rate
WHERE rate = (SELECT MAX(rate) FROM Rate)
ORDER BY question_id 
LIMIT 1
