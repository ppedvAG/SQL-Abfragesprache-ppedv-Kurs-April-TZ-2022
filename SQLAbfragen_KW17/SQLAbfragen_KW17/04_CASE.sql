--CASE = Fallunterscheidungen
--CASE wird ins SELECT geschrieben, quasi "eigene" Spalte


select c.CompanyName,
sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) as Rechnungssumme,
CASE
	WHEN sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) > 100000 THEN 'A'
	WHEN sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) BETWEEN 50000 AND 100000 THEN 'B'
	ELSE 'C'
END as Kategorie
FROM Customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join [Order Details] od on od.OrderID = o.Orderid
group by c.CompanyName
order by Rechnungssumme desc



--Frachtkosten der Kunden erhöhen,
--Wenn AVG(Freight) > 100 dann um 5%, zwischen 70 - 100 um 10%, sonst um 15%

SELECT c.Companyname , Freight,
CASE
	WHEN AVG(Freight) > 100 THEN Freight*1.05
	WHEN AVG(Freight) BETWEEN 70 and 100 THEN Freight*1.10
	ELSE Freight*1.15
END as Freight_Neu
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName, Freight
ORDER BY Freight_Neu DESC
