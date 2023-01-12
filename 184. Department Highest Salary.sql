# Solution 1
# Have to say this solution is not elegant
# Write your MySQL query statement below
SELECT Department, Employee, Salary FROM(
    SELECT d.name AS Department, 
           e.name AS Employee, 
           e.Salary, 
           RANK() OVER(PARTITION BY d.name ORDER BY e.Salary DESC) AS 'Rank'
    FROM Employee e
    JOIN Department d ON
    e.departmentId = d.id    
) as temp
WHERE temp.Rank = 1

#Solution 2
# Write your MySQL query statement below
Select d.name as Department, e.name AS Employee, e.Salary as Salary
FROM Employee e
JOIN Department d ON
e.departmentId = d.id
WHERE (d.name, e.Salary) in(
    SELECT d.name as Department, Max(Salary) as MaxSalary
    FROM Employee e
    JOIN Department d ON
    e.departmentId = d.id
    GROUP BY d.name 
)
