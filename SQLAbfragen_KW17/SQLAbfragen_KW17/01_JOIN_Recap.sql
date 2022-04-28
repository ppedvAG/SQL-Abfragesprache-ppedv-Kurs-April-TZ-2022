--INNER JOIN

SELECT * FROM Customers
INNER JOIN Orders ON Customers.CustomerID = orders.CustomerID

SELECT * FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID


--OUTER JOINs

--LEFT/RIGHT JOIN

SELECT *
FROM Customers c LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL

FROM Customers c RIGHT JOIN Orders o

--FULL OUTER
SELECT * FROM Customers c
FULL OUTER JOIN orders o
ON c.CustomerID = o.CustomerID

--CROSS JOIN
SELECT * FROM Customers c
CROSS JOIN orders o

--SELF JOIN 
SELECT e.EmployeeID, e.LastName, e.FirstName, e.ReportsTo, e1.Lastname FROM Employees e
JOIN Employees e1 ON e.EmployeeID = e1.ReportsTo
