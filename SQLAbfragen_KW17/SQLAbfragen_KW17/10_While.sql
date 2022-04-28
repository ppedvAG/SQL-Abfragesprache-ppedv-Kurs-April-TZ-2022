--WHILE = Loop/Schleife, solange die Bedingung wahr ist 

WHILE 1=1
	BEGIN
		SELECT getdate()
	END


WHILE 1=1
	BEGIN
		SELECT 'Hallo'
	END



DECLARE @Counter int = 1, @CounterAuﬂen int = 1
WHILE @CounterAuﬂen <=3
	BEGIN
		WHILE @Counter <= 10
			BEGIN
				SELECT @Counter
				SET @Counter +=1	
			END
		SET @Counter = 1
		SET @CounterAuﬂen +=1	
	END

--BackupOrders die Freight in 10% Schritten erhˆhen, dabei sollen Grenzwerte nicht ¸berschritten werden:
--AVG(Freight) nicht ¸ber 100, der hˆchste Freight Wert soll nicht ¸ber 1500


WHILE (SELECT MAX(BackupOrders.Freight) FROM BackupOrders) <= 1500 
AND (SELECT AVG(BackupOrders.Freight) FROM BackupOrders)  <=100
BEGIN
UPDATE BackupOrders
END




WHILE (SELECT MAX(Freight)*1.1 FROM BackupOrders) <= 1500 AND (SELECT AVG(Freight)*1.1 FROM BackupOrders) <=100
BEGIN
UPDATE BackupOrders
set freight = freight*1.10
END
UPDATE BackupOrders
SET Freight = freight/1.10

SELECT AVG(Freight) FROM BackupOrders
SELECT MAX(Freight) FROM BackupOrders