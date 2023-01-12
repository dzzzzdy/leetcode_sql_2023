# Write your MySQL query statement below
SELECT Department, Employee, Salary
FROM(
    SELECT d.name AS Department,
           e.name AS Employee,
           e.Salary AS Salary,
           DENSE_RANK() OVER(PARTITION BY d.id ORDER BY salary DESC) AS 'Rank'
    FROM Employee e
    JOIN Department d
    ON e.departmentid = d.id
    ) temp
WHERE temp.Rank <= 3
