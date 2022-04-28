--Kopien von vorhandenen Tabellen erstellen:
--SELECT INTO

SELECT * INTO BackupCustomers
FROM Customers


SELECT * FROM BackupCustomers



--Transactions
--Leitet wenn ausgeführt eine "Transaktion" ein, die noch nicht in die DB geschrieben wird
BEGIN TRANSACTION
BEGIN TRAN

COMMIT --Schreibt Transaktion in DB über
ROLLBACK --Setzt alles ausgeführte zurück auf den Zustand "vor Transaktion"

SELECT @@Trancount --Zeigt aktuellen Transaktionsstatus an (1 oder 0)


--Löschen von Tabellen
--DROP TABLE
DROP TABLE BackupCustomers

SELECT * FROM BackupCustomers

--Ändern von Zeilen/Zellen/Werten
--UPDATE
SELECT * INTO BackupOrders
FROM Orders


UPDATE BackupCustomers
SET City = 'Frankfurt'
WHERE CustomerID = 'ALFKI'

SELECT * FROM BackupCustomers 
WHERE CustomerID = 'ALFKI'

UPDATE BackupOrders
SET Freight = Freight*1.1
/*(
SELECT c.Companyname , Freight,
CASE
	WHEN AVG(Freight) > 100 THEN Freight*1.05
	WHEN AVG(Freight) BETWEEN 70 and 100 THEN Freight*1.10
	ELSE Freight*1.15
END as Freight_Neu
FROM BackupOrders o
JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName, Freight
)*/

--"Löschen" von Werten/Zellen über UPDATE SET = NULL
UPDATE BackupCustomers
SET ContactName = NULL
WHERE CustomerID = 'ALFKI'


--Löschen ganzer Zeilen
--DELETE
DELETE FROM BackupCustomers
WHERE CustomerID = 'PARIS'


--Neuen Table erstellen
--CREATE TABLE

CREATE TABLE Fuhrpark
(
Spaltenname Datentyp,
Spaltenname2 usw...
)

CREATE TABLE Fuhrpark
(
Kennzeichen varchar(9),
Automarke varchar(20) NOT NULL,
Baujahr date,
PS int,
Leasingrate decimal(5, 2) NOT NULL,
PRIMARY KEY (Spaltennamen)
)

--Bestehende Tabellen anpassen, bzw. Spalten ändern
--ALTER TABLE
ALTER TABLE Fuhrpark
DROP COLUMN PS

ALTER TABLE Fuhrpark
ALTER COLUMN Leasingrate money NOT NULL

ALTER TABLE Fuhrpark
ADD PRIMARY KEY (Kennzeichen)

ALTER TABLE Fuhrpark
ADD Farbe varchar(20)


SELECT * FROM Fuhrpark



--INSERT neue Zeilen zu Table hinzufügen
INSERT INTO Fuhrpark (Kennzeichen, Automarke, Leasingrate)
VALUES ('Kennzeichen', 'Automarke', 'Leasingrate')

INSERT INTO Fuhrpark 
VALUES ('AOESN1337', 'Opel', '20030101', 140, 12.399, 'Grün')

INSERT INTO Orders
VALUES (,Spalte2,Spalte3,4,5,6) --wenn Spalte mit automatisch-fortlaufender ID, diese Spalte weglassen im INSERT