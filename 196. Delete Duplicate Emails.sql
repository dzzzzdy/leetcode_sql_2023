# If you want to delete a column, you first select that column and change it to delete
DELETE p1 
FROM Person p1
JOIN Person p2 ON
p1.email = p2.email
AND p1.id > p2.id

### Solution 2
DELETE
FROM Person
WHERE id NOT IN (
    ### Have to do this twice, Otherwise raise You can't specify target error
    SELECT id FROM(
        SELECT MIN(id) AS id
        FROM Person
        GROUP BY email
    ) as temp
)
    
