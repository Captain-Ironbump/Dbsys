/*aufgabe a*/

Select count(distinct f.wohnungsNr) as AnzahlUngebucht
from dbsys46.Ferienwohnung f left outer join dbsys46.Buchung b on f.wohnungsnr = b.wohnungsnr
where b.wohnungsnr is null;

/*aufgabe b*/

select distinct b1.mailadresse, b1.wohnungsnr, k.kundenname
from dbsys46.Kunde k, dbsys46.Buchung b1, dbsys46.Buchung b2
where b1.wohnungsnr = b2.wohnungsnr
and b1.mailadresse = b2.mailadresse
and b1.buchungsnr != b2.buchungsnr;

    
/*aufgabe c*/

Select f.wohnungsnr, f.fname
from dbsys46.Buchung b, dbsys46.Ferienwohnung f, dbsys46.Adresse a
where b.wohnungsnr = f.wohnungsnr
and f.adressID = a.adressID
and a.landname = 'Spanien'
group by f.wohnungsnr, f.fname
having avg(b.rating) >= 4;

/*group by mit having*/

/*aufgabe d*/

select f.fname, f.wohnungsnr
from dbsys46.Ferienwohnung f
where (select count(wohnungsnr) from dbsys46.Besitzt
where f.wohnungsnr = wohnungsnr)= (select max(count(wohnungsnr)) from dbsys46.Besitzt 
group by wohnungsnr);

/*view pro Ferienwohnung Anzahl zählen*/

/*aufgabe e*/

select l.name, count(b.buchungsnr) as BuchungProLand
from dbsys46.Buchung b inner join dbsys46.Ferienwohnung f on b.wohnungsnr = f.wohnungsnr
inner join dbsys46.Adresse a on f.adressid = a.adressid
right outer join dbsys46.Land l on a.landname = l.name
group by l.name
order by BuchungProLand desc;

/*aufgabe f*/

select count(f.fname) as FWproStadt, a.stadt
from dbsys46.Ferienwohnung f, dbsys46.Adresse a
where f.adressid = a.adressid
group by a.stadt;

/*aufgabe g*/

select distinct f.fname, avg(b.rating)
from dbsys46.Ferienwohnung f inner join dbsys46.Besitzt bs on f.wohnungsnr = bs.wohnungsnr
left outer join dbsys46.Buchung b on f.wohnungsnr = b.wohnungsnr on f.adressid = a.adressid
inner join dbsys46.Adresse a on
where bs.ausstattungsname = 'Sauna'
and a.landname = 'Spanien'
and f.wohnungsnr != all(Select f.wohnungsnr from dbsys46.Ferienwohnung f, dbsys46.Buchung b where f.wohnungsnr = b.wohnungsnr 
        and ((b.anfangsdatum >= '01-11-2022' and b.anfangsdatum <= '21-11-2022') or (b.enddatum >= '01-11-2022' and b.enddatum <= '21-11-2022')
        or b.anfangsdatum <= '01-11-2022' and b.enddatum >= '21-11-2022'))
group by f.fname
order by avg(b.rating) desc nulls last;
