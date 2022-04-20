--  SELECT SPALTEN FROM TABELLEN

select sp1, sp3  --das was wikr sehen wollen
		, sp5 *sp7,   -- Mathe
		  left(sp2,1)  -F()
		  'TXT', Zahl
from tabelle  -- QUELLE

select 100, 'txt', orderid from orders


-select *  -- steht für alle Spalten der Tabellen aus dem from Teil



--mach dir ein Bild der DB --Diagramm!

--Tipp: bei DB Design : DB Objekte (Tabellen Spalten) keine Namen mit Leerzeichen und auch keine math Operatoren pder etwa komma

select * from order-details --soll keine Subtraktione

use northwind;
GO

select * from customers --91 Kunden
select * from orders --830
select * from [Order Details] --2155
select * from Products --77
select * from employees --9

select orderid, freight, orderdate from orders

select orderid, freight, orderdate, orderid from orders

select freight, * from orders

--ALIAS

select orderid as BestNr, * from orders

select orderid 'A' from orders --ohne as gehts auch

select orderid customerid from orders --Vorsicht
select orderid, customerid from orders


select orderid, freight from orders --wir brauchen die Augaben: BestNr, Frachtkosten und Bruttofrachtkosten (inkl MwSt 19%)

select orderid, freight , (freight *1.19) as Brutto from orders

--ergänze um Anteil der MwSt
select orderid, freight , (freight *1.19) as Brutto ,((freight *1.19)  -freight) as MwSt from orders


--um wieviele tage zu früh ,  zu spät oder in-time kamen die Lieferungen an

--Bestnr, Orderdate, Requireddate, Shippeddate, Difftage
--sortieren : nach Spalte oder Alias aufsteigend asc oder absteigend desc

select OrderID, OrderDate, RequiredDate, ShippedDate, datediff(dd, RequiredDate, ShippedDate) as Verzoegerung from orders
order by Verzoegerung desc

--nach Validieren des Ergebnisses die überflüssigen Spalten entfernen 
select OrderID, datediff(dd, RequiredDate, ShippedDate) as Verzoegerung from orders
order by Verzoegerung desc



select * from employees-- für Anschrift (Brief)  "Ms Nancy Davolio"
--Ausgabe Anrede plus  Vorname und FamName als ein Feld


select 
			TitleOfCourtesy + ' '  + Firstname + ' ' + Lastname,
			concat(TitleOfCourtesy , space(1)  ,Firstname , space(1) , Lastname),
			replicate ('.',1), replicate ('.',10)
from Employees


--der letzte Buchstabe des FamNamen muss Groß geschrieben sein
---Select * from employees
select * from orders

select substring(lastname, 1,len(lastname)-1)+upper(substring(lastname, len(lastname),1)) from employees


--select upper(left(reverse(lastname),1)) from employees

select reverse(stuff (reverse(lastname),1,1,upper(left(reverse(lastname),1))))  from employees

select left(lastname, len(lastname)-1)+ upper(right(lastname,1)) from employees












