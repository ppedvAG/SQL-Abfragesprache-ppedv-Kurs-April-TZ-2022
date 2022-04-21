--die wo...

--das where ist der Teil der Abfrage, der für performance zuständig ist

--Filter für tabellen

--Vergleichsoperatoren
/*
where kommt immer nach dem FROM

sp = 
sp in
sp between
sp like 
sp !=     <>
sp <     >  <=  >=
is null

is not not like not in not between

Wildcards
% steht für beliebig viele Zeichen ( 0 bis...)

_ steht für genau ein unbekanntes zeichen


[ ] stehen für ein Zeichen und kann auch Bereiche abbilden (pattern)
[ACFG] A oder C oder F oder G
, [A-D] A bis D
, [0-9] 0 bis 9
,[A-D|0-9] A bis D oder auch 0 bis 9
[^0-9]  soll nicht 0 bis 9 sein

AND OR.. beliebig oft kombinierbar

AND ist stärker bindendimmer zuerst das AND
daher immer Klammern setzen , damit es allen verständlicher wird..

*/


select * from customers
where 
			Country = 'UK'


select * from customers
where
			country < 'UK' --? --alphabetischer Vergleich
order by country desc --verifizieren

select * from customers
where
			country <= 'UK' --Ergenis enthält auch UK
order by country desc --verifizieren


--orders: freight

--alle Bestellungen mit Liefekosten > 500

select * from orders where freight > 500 --13 Stück


--Wieviele Bestellungen liegen unter 100 Euro brutto?

select * from orders
where 
				freight *1.19 < 100



select * from orders
where 
				freight < 100/1.19


--suche alle Bestellungen deren Shipregion SP ist

select * from orders where shipregion = 'SP' --49

--suche alle Bestellungen deren Shipregion größer S ist? --sollte mind 49

select * from orders where shipregion > 'S' --95
select * from orders where shipregion <= 'S'  --228
--also sollten es 228+95 Datensätze sein, aber sollten 830 sein

select * from orders where shipregion >  'S'  --228
order by shipregion

--die DS mit NULL fehlen




--LIKE % beliebig viele zeichen
select * from customers where companyname like 'Ernst Handel'
select * from customers where companyname like 'Ernst%'
select * from customers where companyname like '%andel'
select * from customers where companyname like '%a%'

--alle Kunden, die aus einer Stadt mit S kommen ... S vorne

select * from customers where city like 'S%' --12

--Suche alle Kunden (Firmenname) mit % im Namen

select * from customers where CompanyName like '%%%' --alles.. identisch mit '%'

select * from customers where CompanyName like '%'%'%' --alles.. geht nicht 

--Suche alle Firmen mit ' im Namen...
--select * from customers where CompanyName like '%'%'   --Error


--Lösung: []

-- Suche nach %
select * from customers where companyname like '%[%]%' --2 Treffer

--Suche nach '
--select * from customers where companyname like '%[']%'  --Suche nach [.. aber Fehler ..

select * from customers where CompanyName like '%''%' --2 Hochkomma als Escape


--mehrere bedingungen AND OR

select * from customers
where
		country = 'UK' and customerid like 'A%'


select * from customers
where
		country = 'UK' or customerid like 'A%'


--Suche alle Bestellungen , die vom AngID 5 stammen 
--oder aus UK verschifft wurden und Frachtkosten kleiner 10 haben
--Employeeid Shipcountry freight

select * from orders
where
			employeeid = 5
			or
			(Shipcountry = 'UK'
			and
			freight < 10) --57


select * from orders
where
			(employeeid = 5
			or
			Shipcountry = 'UK')
			and
			freight < 10 --22 



--Suche alle Firmen, die im Namen folgendes haben
-- es soll am Ende ein Xy oder z sein der Name soll aber mit A od.  G od. H od. K beginnen
-- im Namen selbst soll der Buchste R vorkommen


select * from customers where companyname like '[AGHK]%r%[XYZ]'


--Annahme  Tabelle mit PIN (4 Stellen) .. dummerweise char(4)
--d30t, Aber am Automat klappt das nicht..
--wie finden wir die raus, die keine ordentliche PIN haben..?

--was leider nicht geht... < 10000 wg 0406

select * from tabellen 
where
				PIN not like '[0-9][0-9][0-9][0-9]'


--017_45673_34
--wie kann man exakt auf best Pos prüfen
--017[0-9]45673[0-9]34











--
--Suche alle Kunden aus UK Italy France Germany


--where country = 'UK' OR COUNTRY = 'FRANCE'...
--leichter mit IN

	
select * from customers 
where
			country IN ('UK', 'Italy', 'Germany' )


--Suche alle Bestellungen aus dem Jahr 1997 (orderdate)
--
select * from orders where orderdate ='1997' --falsch--wird durch 1.1. 0 uhr ergänzt

select * from orders where orderdate like '%1997%' --geht , aber sicher nicht die beste Wahl!!

select * from orders where datepart(yy, orderdate) = 1997 --klappt, aber nicht die beste Variante
select * from orders where year(orderdate) = 1997  --klappt , aber nicht beste Variante


select * from orders 
			where orderdate >= '1.1.1997'
						AND
					  orderdate <='31.12.1997' --falsch...weil 31.12.1997 = 31.12.1997 00:00:00.000



select * from orders 
			where orderdate >= '1.1.1997'
						AND
					  orderdate <='31.12.1997 23:59:59.999' --schnell, eigtl korrekt aber falsches Ergebnis


--kürzer mit between
select * from orders
	where 
				orderdate between '1.1.1997' AND '31.12.1997 23:59:59.999'--411 vs year() 408 Zeilen

--Warum?
--bei between und <= ist auch 1998

select * from orders
	where 
				orderdate between '1.1.1997' AND '31.12.1997 23:59:59.999'
	order by orderdate desc

--Grund für 411: das datetime ist ungenau ( 2 bis 3ms)

select * from orders
	where 
				orderdate between '1.1.1997' AND '31.12.1997 23:59:59.997'
	order by orderdate desc


--Suche alle Kunden mit Customerid, die mit A od. B od. C od. D beginnt
--IN klappt hier nicht wg Wildcard
select * from customers where customerid like 'A%' or Customerid like 'B%'...

select * from customers where customerid < 'E' --sofern alle mit Buchstaben beginnen

--Suche alle Kunden mit Customerid, die mit A od. C od. F od. G beginnt

select * from customers 
		where 
					customerid like '[ACFG]%'

select * from customers where country like 'Mexi_o'

--Suche nach : alle Bestll., die zwischen 10 und 50 Frachtkosten haben
--oder aus einem land , das mit u beginnt verschifft wurden
--und die KundenId hat an 2ter Stelle ein O und an letzter Stelle einen Wert zwischen M bis Z
select * from orders
where 
		(freight between 10 and 50
		OR
		Shipcountry like 'U%')
		AND 
		Customerid like '_o%[M-Z]'



























--Suche alle Bestelllungen, der Frachtkosten brutto über 100 liegen
--von einem Kunden mit ID SL enthaltend stammt
--ausserdem muss es aus UK kommen 
--und es darf shipregion nicht null sein


select * from orders
where
		freight *1.19 > 100
		AND
		customerid like '%SL%'
		AND
		Shipcountry = 'UK'
		AND
		ShipRegion IS NOT NULL