#The answer is identical to 176......
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
set N=N-1;
RETURN (
IFNULL((SELECT DISTINCT SALARY
         FROM Employee
        ORDER BY Salary desc
        LIMIT 1 OFFSET N),Null)
);
END
