--Systemfunktion

/*

Datentypen

DATUM

datetime (ms)
date (nur Datum)
time (nur Uhrzeit)
smalldatetime (sec)
datetime2 (ns)
datetimeoffset (ms und Zeitzone)
*/

--das JETZT
select getdate() --vs Geburtstag :-( datetime

--Wie wollen wir nun das Jahr oder Quartal alleine rausfinden


--Datumsfunktionen
/* INTERVALLE
yy Jahr
qq Quartal
dd Tage
hh Stunden
mm Monat
dw day of week
dy Tag des Jahres
ms Millisekunden
ss Sekunde
mi Minute
ns Nanosekunde

*/
--Vorsicht bei einem y = 110
Select datepart(yy, getdate()) --2022

Select datepart(qq, getdate()) --2

select datepart(dy, getdate()) --110


select datediff(dd,getdate(), '31.12.2022') -- + 255

select datediff(dd, '31.12.2022',getdate()) -- -255

select datediff(dd, getdate(), '21.6.1969') -- -19296 

--da die Datuzmsfunktionen immer mit datetime rechnen-
--wird autoamtisch ein DAtum mit 0 Uhr 0 Min und 0 Sek 0 ms ergänzt

--21.6.1969 00:00:00.000

--Treffen wir uns in 30 Tagen wieder

select dateadd(mm, 1, getdate()) --2022-05-20 10:00:42.073


--Welches Datum und Uhrzeit hatten wir vor 96 Stunden?-

select DATEADD(hh,-96, getdate()) --2022-04-16 10:02:56.483



--an wekchem Tag war die Mondlandung

select datepart(dd, getdate()) --20 ..möchte aber Mittwoch

select datename(dw, getdate())



--Textfunktionen

-- 'otto'

/*

char(50) --kann auch 8000 sein.. hat fixe Länge   'otto                              '  50
varchar(50) --kann aber auch 8000 sein				   'otto'   4
nchar(50) .. n für UNICODE									   'otto                              '  2*50
nvarchar(50)															   'otto	' 4*2
text  nicht mehr nehmen.. deprecated seit 2005
varchar(max) char(max)  ..bis 2 GB

*/

--Leerzeichen wegschnippeln
-- ltrim  /  rtrim
select 'otto                            '
select rtrim('otto                         ')

--Textverketten
select 'A' + 'B'
select 'A' + 100 --Error
--einfachste Lösung
select 'A' + '100' -- ;-).. geht aber nicht bei Tabellenabfragen
--Konvertieren
select convert(varchar(50), 100)
select 'A' + convert (varchar(50) , 100)
select UPPER('otto')
select lower('OTTO')
select UPPER ('o') + 'tto' -- 'Otto'
--Längen feststellen
select len('otto'), datalength('otto')
select len('otto        '), datalength('otto         '),len('         otto        ')
--Len  macht automat einen rtrim, aber keinen ltrim
select len(customerid), datalength(customerid)
from customers
--Left right
select left('abcdefg',4), right('abcdefg',4)
-- ab cde  fg
--Substing.. ab best Position (beginnt bei 1) für eine bestimmte  etwas ausgeben
select substring ('abcdefg',3,3) --cde
--txt ersetzen--die zu ersetzenende zeichen müssen nicht gleich lang sein
select stuff('abcdefg',3,2,'XY')
select stuff('abcdefg',3,2,'ABCDEFGH')
select reverse('ein Neger mit Gazelle zagt im regen nie')





--bei einer beliebigen TelNr sollen die letzten 3 Zeichen ausgeixt werden

-- 08677-988971---> 08677-988XXX



select stuff(' 08677-988971',len(' 08677-988971')-2,3,'xxx')

select reverse(stuff( reverse(' 08677-988971'),1,3,'XXX'))






























