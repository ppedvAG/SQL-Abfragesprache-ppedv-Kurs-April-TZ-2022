--Procedures/Prozeduren/Stored Procedures
--SP = Eine Batch

--Proc funktionieren mit allen Befehlen, Update, Delete, Create
--Haben Variablen
--Auf dem Server gespeichert, für alle "zugänglich" und veränderbar

--Speichert Ausführungsplan, dadurch sehr schnell, da nicht neu berechnet werden muss


CREATE PROCEDURE --CREATE PROC
spTest @Land varchar(20)
AS
SELECT * FROM Customers
WHERE Country = @Land

EXEC spTest 

--Verändern mit ALTER
--Löschen mit DROP
GO

ALTER PROC spTest @Land varchar(20) = 'USA'
AS
SELECT * FROM Customers
WHERE Country = @Land



GO

ALTER PROC spTest @Land varchar(20) = 'USA', @Name varchar(1)
AS
SELECT * FROM Customers
WHERE Country = @Land AND CompanyName LIKE '[@Name]%'


EXEC spTest  Germany, A


EXEC spTest Germany, A with recompile





--Aufgabe: Procedure erstellen die Kunden komplett löscht (CustomerID)

SELECT od.orderid FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE c.CustomerID = 'ALFKI'



CREATE PROC spDeleteCustomer
as
DELETE FROM
DELETE FROM
DELETE FROM



CREATE PROCEDURE --CREATE PROC
spDeleteCustomers @CustomerID nchar(5)
AS
DELETE FROM [Order Details] WHERE OrderID IN (SELECT OrderID FROM Orders where CustomerID = @CustomerID)
DELETE FROM Orders Where CustomerID = @CustomerID
DELETE FROM Customers WHERE CustomerID = @CustomerID



EXEC spDeleteCustomers 'PARIS'


--Function/Funktionen

CREATE FUNCTION f_Multiplikator(@Var1 int, @var2 int) returns int --returnS!
AS
BEGIN
	return(select @var1 * @var2)--Was soll er ausgeben? --> return
END

select dbo.f_Multiplikator (5, 29)