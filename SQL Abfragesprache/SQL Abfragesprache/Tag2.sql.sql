/*
USE DB;
GO

/* dies ist eine Demo */
SELECT 
				Sp1, Sp2, Spn....  -- alle Spalten der Tabellen des FROM
				Mathe as ALIASNAME,
				'TXT' as ALIASNAME,
				F(Wert), F(Sp) as ALIASNAME --kleiner Tipp am Rande: F() sind nicht das schnellste, aber unheimlich praktisch
FROM		TABELLE
ORDER BY Sp1 asc default, Sp2 asc|desc, [1,3,5 desc];
GO

*/


use northwind;
GO


--Ausgabe der Angestellten nach Alter.. Ausgabe Lastname, GebDatum, Alter sortiert nach Alter absteigend
select * from employees
--Nachwuchssorgen!!

select lastname 
		, birthdate
		,datediff(yy, birthdate,  getdate()) as [Alter] 
from employees
order by [alter] desc

--nun mit Präfix Alter

select lastname 
		, birthdate
		, 'ALTER: ' + convert(varchar(50),datediff(yy, birthdate,  getdate())) as [Alter] 
from employees
order by [alter] desc

select 100
print '*OK' --kommt nur in den Benachrichtigungsteil , aber nicht im Ergebnis vor..Fortschrittsanzeige
select 200


select 100
select 'OK' -- --
select 200











*/

select * from orders