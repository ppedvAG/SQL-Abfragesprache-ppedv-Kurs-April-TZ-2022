--Geben Sie die vollen Namen aller Angestellten aus, 
--die mehr als 70 Bestellungen bearbeitet haben.
--Ordnen Sie die Ausgabe aufsteigend nach Anzahl der Bestellungen.


select e.FirstName + ' ' + e.LastName, count(o.orderid) as anzahl_Bestellungen from employees e
inner join Orders o on o.EmployeeID = e.EmployeeID
group by e.FirstName, e.LastName
having count(o.orderid) > 70
order by anzahl_Bestellungen 


--Alle Bestellungen ausgeben, bei denen wir eine Lieferverzögerung hatten


select orderid, datediff(dd,isnull(ShippedDate, getdate()),RequiredDate) as Verzögerung, RequiredDate, ShippedDate
from orders o
where datediff(dd,ShippedDate,RequiredDate) <= 0 OR ShippedDate IS NULL


--isnull() prüft ob wert null, wenn ja gibt er einen angegebenen Ersatzwert aus



--Employees sortieren nach Altersgruppen: U30, 30-40, 40-50, 50-60, Ü60
--Ausgabe, wieviel Alkoholika verkauft wurden (nach Altersgruppe)
--Category 'beverages'; ProductID (1, 24, 43) sind Alkohol
--Alter = Birthdate/Orderdate


SELECT * FROM Products
WHERE CategoryID = 1


select
--e.lastName,
--e.BirthDate,
--o.OrderDate,
case
when datediff(YY, e.BirthDate,o.orderdate) < 30 THEN 'U30'
when datediff(YY, e.BirthDate,o.orderdate) between 30 and 40 THEN '30-40'
when datediff(YY, e.BirthDate,o.orderdate) between 40 and 50 THEN '40-50'
when datediff(YY, e.BirthDate,o.orderdate) between 50 and 60 THEN '50-60'
else 'Ü60'
end as Altersgruppe,
SUM(od.Quantity) as Anzahl
from employees e
inner join orders o on e.EmployeeID = o.EmployeeID
Inner join [Order Details] od on od.OrderID = o.OrderID
inner join Products p on od.ProductID = p.ProductID
inner join Categories cat on p.CategoryID = cat.CategoryID
where p.ProductID NOT IN (1, 24, 43) AND cat.CategoryName = 'beverages'
GROUP BY 
case
when datediff(YY, e.BirthDate,o.orderdate) < 30 THEN 'U30'
when datediff(YY, e.BirthDate,o.orderdate) between 30 and 40 THEN '30-40'
when datediff(YY, e.BirthDate,o.orderdate) between 40 and 50 THEN '40-50'
when datediff(YY, e.BirthDate,o.orderdate) between 50 and 60 THEN '50-60'
else 'Ü60'
end
ORDER BY Anzahl DESC

