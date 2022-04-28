SELECT * FROM Customers
WHERE country = 'Germany'
UNION
SELECT * FROM Customers
WHERE City = 'Paris'


--UNION verbindet Tabellen vertikal, also macht aus mehreren Ergebnistabellen eine einzige

SELECT * FROM Customers
UNION
SELECT * FROM Orders

--Funktioniert nur mit gleicher Spaltenanzahl

SELECT Address FROM Customers
UNION
SELECT address FROM employees

--UNION macht direkt DISTINCT mit

SELECT * FROM Customers
UNION
SELECT * FROM Customers

--Mit UNION ALL kein DISTINCT

SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers



--ABC Analyse nach Rechnungssumme unserer Kunden
--A = >100.000 ; B = ab 50.000 ; Rest C


select c.CompanyName, sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) as Rechnungssumme, 'A' as Kategorie from customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join [Order Details] od on od.OrderID = o.Orderid
group by c.CompanyName
HAVING sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) > 100000
UNION
select c.CompanyName, sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) as Rechnungssumme, 'B' as Kategorie from customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join [Order Details] od on od.OrderID = o.Orderid
group by c.CompanyName
HAVING sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) BETWEEN 50000 AND 100000
UNION
select c.CompanyName, sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) as Rechnungssumme, 'C' as Kategorie from customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join [Order Details] od on od.OrderID = o.Orderid
group by c.CompanyName
HAVING sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) < 50000
order by Rechnungssumme desc