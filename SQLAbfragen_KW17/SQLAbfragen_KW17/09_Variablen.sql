--Variablen existieren nur während der Laufzeit/im Fenster
--@ ist "lokal", @@ "global"

DECLARE @TestVariable int = 1, @Var2 money, @var3 datetime --Hier dein Datum setzen

SELECT @TestVariable

SET @TestVariable = 2

SELECT @TestVariable

SET @TestVariable = @TestVariable + 1

SELECT @TestVariable

SET @TestVariable = @TestVariable + 1
SET @TestVariable = @TestVariable + 1
SET @TestVariable = @TestVariable + 1
SELECT @TestVariable

SET @TestVariable +=1 -- Ist das selbe wie SET @TestVariable = @TestVariable + 1

SELECT @TestVariable




DECLARE @Land varchar(20)
SET @Land = 'Germany'

SELECT * FROM Customers
WHERE Country = @Land



