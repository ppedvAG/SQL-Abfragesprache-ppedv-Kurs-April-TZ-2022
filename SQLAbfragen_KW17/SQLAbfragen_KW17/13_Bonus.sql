--OVER/Windowed


SELECT c.CustomerID,  o.Freight, SUM(o.Freight) OVER(PARTITION BY c.CustomerID) as SummePerCustomer,
SUM(o.Freight) OVER() as SummeAllCustomer FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, o.Freight
ORDER BY c.CustomerID ASC, Freight DESC

--Mit OVER(), OVER(PARTITION BY [Spaltenname]), OVER(ORDER BY [Spaltenname])
--können wir unsere Ergebnistabelle noch in "Bereiche" unterteilen, auf die wir wiederrum Aggregatfunktionen anwenden können



--Aufgabe: contactName bei allen Kunden ändern, abhängig vom Land des Kunden
--Germany = Scholz, France = Macron, USA = Biden, UK = Johnson

--Lösung über UPDATE mit CASE

UPDATE BackupCustomers
SET ContactName =
CASE
WHEN Country = 'Germany' THEN 'Scholz'
WHEN Country = 'France' THEN 'Macron'
WHEN Country = 'USA' THEN 'Biden'
WHEN Country = 'UK' THEN 'Johnson'
ELSE ContactName --Hierdurch behalten nicht betroffene Zeilen ihren ursprünglichen Wert (sonst NULL)
END

SELECT * FROM BackupCustomers





SELECT * FROM Employees
DROP TABLE Fuhrpark

CREATE TABLE Fuhrpark2
(
Kennzeichen varchar(9),
EmployeeID int NOT NULL,
Automarke varchar(20) ,
Baujahr date,
PS int,
Leasingrate money
)
DROP TABLE Fuhrpark2
SELECT * FROM Fuhrpark

--Aufgabe: Jeder Employee bekommt ein Auto (Neue Zeile in Fuhrpark) (Werte egal bzw. leer)

SELECT * FROM Employees

DECLARE @EmID int = 1
WHILE (SELECT COUNT(EmployeeID) FROM Employees) >= @EmID
BEGIN
INSERT INTO Fuhrpark (EmployeeID)
VALUES (@EmID)
SET @EmID +=1
END


--Zusatz: Nur Employees aus UK bekommen ein Auto (Neue Zeile in Fuhrpark) (Werte egal bzw. leer)
SELECT EmployeeID, ROW_NUMBER() OVER(ORDER BY EmployeeID) as ID INTO #t FROM Employees
WHERE Country = 'UK'
--Mit Row_Number() und OVER(ORDER BY) können wir eine Hilfstabelle mit eigener ID "hertricksen"
--Dadurch können wir wiederum mit einer WHILE Schleife und hochzählender Variable einen MassenINSERT durchführen

DECLARE @EmID int = 1, @IDCounter int = 1
WHILE @IDCounter <= (SELECT COUNT(ID) FROM #t )
BEGIN
SET @EMID = (SELECT EmployeeID FROM #t WHERE ID = @IDCounter)
INSERT INTO Fuhrpark2 (EmployeeID)
VALUES (@EmID)
SET @IDCounter +=1
END
--Lösung 1: Hilfstabelle als #TempTable speichern und referieren (schneller da Hilfstabelle nur einmal abgefragt wird)

SELECT * FROM Employees
SELECT * FROM Fuhrpark2

DECLARE @EmpID int = 1
DECLARE @IDCounter int = 1

While @IDCounter <= (SELECT COUNT(EmployeeID) FROM employees where country = 'UK')
BEGIN
SET @EmpID = (SELECT a.EmployeeID FROM (SELECT EmployeeID, ROW_NUMBER() OVER(ORDER BY EmployeeID) AS ID FROM employees e WHERE Country = 'UK') a where a.ID = @IDCounter)
INSERT INTO Fuhrpark2 (EmployeeID)
VALUES (@EmpID);
SET @IDCounter +=1
END
--Lösung 2: Hilfstabelle direkt als Subquerie integrieren (langsamer da Hilfstabelle in jedem Durchgang neu abgefragt wird)


--Indizes/Indexes
--xml
























SELECT c.CustomerID,  o.freight, SUM(o.freight) OVER(PARTITION BY c.CustomerID) as SummePerCustomer,SUM(o.Freight) OVER() as SummeAlleKunden FROM orders o
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, o.freight
ORDER BY SUM(o.freight) OVER(PARTITION BY c.CustomerID) DESC, o.freight
