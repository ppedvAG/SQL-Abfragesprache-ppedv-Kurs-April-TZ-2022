--VIEW/Sicht
--View erstellen mit CREATE VIEW

CREATE VIEW vRechnungssummen
AS
select c.CompanyName, sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) as Rechnugssumme from customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join [Order Details] od on od.OrderID = o.Orderid
group by c.CompanyName


SELECT * FROM vRechnungssummen
ORDER BY Rechnugssumme

--VIEW Löschen mit DROP VIEW

DROP VIEW vRechnungssummen


--VIEW anpassen mit ALTER VIEW
USE Northwind
GO
ALTER VIEW vRechnungssummen
AS
select c.CompanyName, sum((od.quantity*od.UnitPrice)*(1 - od.Discount) + o.Freight) as Rechnungssumme from customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join [Order Details] od on od.OrderID = o.Orderid
group by c.CompanyName






VIEW, TEMP Tables, CTE common table expression