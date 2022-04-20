--Sortierte Ausgabe

select Sp1, sp2, sp3 , mathe , text
from Tabelle
order by sp1 | Alias | Nummer der Spalte, sp4 desc|asc


select orderid as Bestnr, freight , freight *1.19 --as Brutto
from orders 
order by bestnr


select orderid as Bestnr, freight , freight *1.19 --as Brutto
from orders 
order by orderid


select orderid as Bestnr, freight , freight *1.19 --as Brutto
from orders 
order by 3-- díe 3 te Spalte --sehr vorsichtig sein

select orderid as Bestnr, customerid, freight , freight *1.19 --as Brutto
from orders 
order by 3-- díe 3 te Spalte --sehr vorsichtig sein --jetzt andere Spalte

select * from orders order by employeeid asc, freight desc


--gib alle Kunden aus sortiert nach Land und Stadt alles absteigend

select customerid, country, city from customers
order by country, city


--das macht keinen Sinn.. im Gegenteil es kostet Leistung ohne Nutzen
select customerid, country, city from customers
order by city, customerid