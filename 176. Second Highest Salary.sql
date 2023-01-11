# Write your MySQL query statement below
# Solution 1
# LIMIT 1 is like df.head(1), OFFSET 1 is to exclude the first row
SELECT 
    IFNULL 
    ((SELECT DISTINCT salary 
    FROM employee
    ORDER BY salary DESC
    LIMIT 1 
    OFFSET 1),
    NULL) as SecondHighestSalary
    
    
# Solution 2
# Write your MySQL query statement below
# I don't like this solution, cuz it's not elegant
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee 
WHERE Salary < 
    (SELECT MAX(Salary) FROM Employee)
