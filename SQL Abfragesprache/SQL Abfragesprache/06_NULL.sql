--die NULL ist weder '' noch 0 ..es ist nix..Vakuum.. nada rein niente
--jede math Operation mit  NULL führt zu NULL


select 100+0 -- = 100
select 100+NULL --= NULL

--auch ein < > zählt dazu..
--was aber wenn ich die N ULL aber berücksichtigen möchte

--FUNKLTION isnull

select isnull(NULL, 0), isnull(5, 0)

select region , isnull(region, 'k.A.') from customers
order by region


select * from [Order Details]