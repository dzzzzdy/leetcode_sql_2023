#Solution 1
# Write your MySQL query statement below
SELECT name AS Customers
FROM Customers C
LEFT JOIN Orders O ON
C.id =  O.customerID
WHERE O.id is NULL

#Solution 2
#Does't work if 2 customers have the same name, so use id instead...
# Write your MySQL query statement below
SELECT name AS Customers 
FROM Customers
WHERE name NOT IN(
    SELECT name 
    FROM Customers C
    JOIN Orders O ON
    C.id =  O.customerID)

#Solution 3
#ID is a unique value, so ID works in all situation
SELECT name AS Customers 
FROM Customers
WHERE id NOT IN(
    SELECT customerId 
    FROM Customers C
    JOIN Orders O ON
    C.id =  O.customerID)
