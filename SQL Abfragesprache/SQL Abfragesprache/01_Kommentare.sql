---  Andreas Rauch andreasr@ppedv.de

--SQL Sharepoint

--ab hier ist ein Kommentar zu sehen..für den Rest der Zeile



--Immer Code markieren und ausführen ( F5)

select getdate() --Datum

/* ab hier
der Kommentar auch 
über viele zeilen
*/


/*
Kunden: select top 3 * from customers

*/


--Tu immer schön formatieren
--nicht so...!!!!
select Customerid
, companyname from 


customers where 


country = 

'USA'

--besser so


select 
		Customerid
	   , companyname 
from 
		customers  --Kundentabellen
where 
	    country = 'USA' --nur die wo aus USA