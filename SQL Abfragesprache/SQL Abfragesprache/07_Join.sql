-- INNER LEFT RIGHT CROSS FULL JOIN 

--der Inner join sucht alles raus, was in beiden Seiten vertreten ist
--der left oder right findet alles! aus einer tabellen und das passende aus der 2ten tabellen

--ALIAS loht sich...,
select * 
from 
				TABELLE1 A inner|left|right join TABLLE2 B ON A.sp1 = B.Sp2
--                LINKS                                                  RIGHT



select * 
from 
				TABELLE1 A inner join TABELLE2 B  ON TABELLE1.sp1 = TABELLE2.Sp2
								   inner join TABELLE3  ON TABELLE3.sp1 = TABELLE2.Sp2
								   inner join TABELLE4  ON TABELLE3.sp1 = TABELLE2.Sp2
where 
order by

--man muss nicht über die IDs joinen

select c.CompanyName, c.CustomerID, o.OrderID from customers C inner join orders O ON C.CustomerID=O.CustomerID
where c.Country= 'UK'

--Gib folgendes aus: 
--Firma, Land, Stadt
--Orderid , frachtkosten
--die wo frachtkosten < 500
--sortiert nach Fraxchtkosten absteigend

select 
		c.CompanyName,c.Country,c.City,
		o.OrderID, o.Freight
from 
		orders o inner join customers c on o.CustomerID=c.CustomerID
where 
		o.freight <500
order by 
		o.freight desc

--Was ist left und right?
--damit könnten wir die Kunden finden , die nichts bestellt haben

select   o.orderid,c.*
from 
			customers c  left join orders o on c.CustomerID=o.CustomerID
where 
			o.orderid is null

--baue diese Abfrage auf einen Right Join um...
select   o.orderid,c.*
from 
		orders o 	right join customers c  on c.CustomerID=o.CustomerID
where 
			o.orderid is null

--Gibts verwaiste Bestellungen (ohne Kunden)

select   o.orderid,c.*
from 
			orders o right join  customers c   on c.CustomerID=o.CustomerID
where 
			c.CustomerID is null


--Suche alle Kunden raus, die in einer Stadt wohnen , an denen auch ein Ang wohnt

select 
			e.lastname, e.city, c.city, c.CompanyName
from
				employees e inner join customers c on e.City=c.City
order by 1,2

--hoher Krankheitsstand.. Ausgabe der Ang (Lastname) , Stadt , pot Stellvertreter
--der als Beding in der gleichen Stadt ist

--Self Join
select e.LastName, e.city, e1.city, e1.LastName
from 
		employees e inner join employees e1 on e.city = e1.city
		and e.EmployeeID != e1.EmployeeID
order by 1,2

select e.LastName, e.city, e1.city, e1.LastName
from 
				employees e inner join employees e1 on e.city = e1.city
where 		e.EmployeeID != e1.EmployeeID
order by 1,2

--select 91 * 830
--jede Variation
select * from customers cross join orders

select * from products

select * from Categories


--Wir brauchen  Firma, Land, Stadt der Kunden  (customers)
--zudem BestNr , Frachtkosten , bestelldatum  (orders)
--ProductId, Menge und den Preisc (oder details)
--productname (products)

select 
			c.CompanyName, c.Country, City,
			o.OrderID, o.Freight, o.Orderdate,
			od.ProductID, od.UnitPrice, od.Quantity,
			p.ProductName
from 
			customers c inner join orders o					on c.CustomerID  = o.CustomerID
								inner join [Order Details] od	on od.OrderID     = o.OrderID
								inner join Products p				on p.ProductID    = od.ProductID









