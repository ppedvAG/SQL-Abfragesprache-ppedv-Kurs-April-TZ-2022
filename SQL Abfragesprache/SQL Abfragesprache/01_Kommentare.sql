---  Andreas Rauch andreasr@ppedv.de

--SQL Sharepoint

--ab hier ist ein Kommentar zu sehen..f�r den Rest der Zeile



--Immer Code markieren und ausf�hren ( F5)

select getdate() --Datum

/* ab hier
der Kommentar auch 
�ber viele zeilen
*/


/*
Kunden: select top 3 * from customers

*/


--Tu immer sch�n formatieren
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