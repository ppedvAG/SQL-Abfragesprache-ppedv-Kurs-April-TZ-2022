--Subqueries/Nested queries/Unterabfragen

--Eine Unterabfrage darf nur EINEN Wert zurückgeben (im WHERE & SELECT)
--Sie muss "eigenständig" ausführbar sein

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)


--Funktionieren "im WHERE", "FROM", "SELECT"

SELECT * FROM 
(SELECT *  FROM Orders
WHERE Freight > 100) t
WHERE Freight > 110

--Wenn "im FROM", muss der Subquery ein Alias gegeben werden!


SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Customers WHERE Country = 'Germany' OR Country = 'FRance')