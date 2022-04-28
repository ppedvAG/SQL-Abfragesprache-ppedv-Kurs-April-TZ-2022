--Aggregates

--SUM() = Summiert Ergebnisse der Spalte auf

SELECT SUM(freight) as Summer_Fracht FROM Orders

--AVG() = Durchschnittswert der Spalte

SELECT AVG(Freight) as Durchschnitt_Fracht FROM Orders

--COUNT() = Anzahl der Einträge 

SELECT COUNT(*) as Anzahl_Einträge FROM Orders

SELECT SUM(Freight)/COUNT(OrderID) as Durchschnit_manuell FROM Orders

--MIN()/MAX() = Kleinster/Größter Wert der Spalte

SELECT MIN(Freight) as Minimum, MAX(Freight) as Maximum FROM Orders



--Alle Bestellungen mit Freight > Durchschnitt Freight

SELECT * FROM Orders
WHERE Freight > AVG(Freight)

SELECT AVG(Freight), OrderID FROM Orders



--GROUP BY

--Von jedem Kunden die gesamtem Frachtkosten ausgeben

SELECT c.CustomerID, c.CompanyName, SUM(o.Freight) as Summe_Fracht FROM Customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName 
ORDER BY Summe_Fracht DESC
--"Trick": Alle Spalten aus dem SELECT, die KEINE Aggregate sind, ohne Aliase hier kopieren

--HAVING = Where Filter für Gruppen

SELECT c.CustomerID, c.CompanyName, SUM(o.Freight) as Summe_Fracht FROM Customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName 
HAVING SUM(o.Freight) > 1000
ORDER BY Summe_Fracht DESC


--Frachtkosten nach "Shippers" aufsummiert
--Shippers.Companyname, Orders.Freight

select s.CompanyName, SUM(o.freight) as Summe_Frachtkosten, 
COUNT(o.Freight) as Anzahl_Bestellungen, AVG(o.Freight) as Durchschnitt_Frachtkosten  from shippers s
inner join orders o on s.ShipperID = o.ShipVia
GROUP BY s.CompanyName
ORDER BY Summe_Frachtkosten DESC


--Gesamtumsatz von jedem Kunden aus Deutschland
--Umsatz = Quantity*UnitPrice (Order Details) 

select c.CompanyName, sum(od.quantity*od.UnitPrice) as Gesamtumsatz from customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join [Order Details] od on od.OrderID = o.OrderID
WHERE c.Country = 'Germany'
group by c.CompanyName
order by Gesamtumsatz desc



--Welcher Employee höchster Umsatz
select e.LastName, sum(od.quantity*od.UnitPrice) as Gesamtumsatz from Employees e
inner join orders o on e.EmployeeID = o.EmployeeID
inner join [Order Details] od on od.OrderID = o.Orderid
group by e.LastName
order by Gesamtumsatz desc


--Rechnungssumme (Umsatz mit Discount + Freight) aller Kunden 

select c.CompanyName, sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) as Gesamtumsatz from customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join [Order Details] od on od.OrderID = o.Orderid
group by c.CompanyName
order by Gesamtumsatz desc


