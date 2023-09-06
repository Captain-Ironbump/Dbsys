-- Teil 5
-- a) Wie viele Ferienwohnungen wurden noch nie gebucht?
SELECT Count(*) AS Anzahl
FROM   Ferienwohnung
WHERE  NOT EXISTS (SELECT *
                   FROM   Buchung
                   WHERE  Buchung.Wohnungsnummer = Ferienwohnung.Wohnungsnummer);


-- b) Welche Kunden haben EINE Ferienwohnung bereits mehrfach gebucht?
SELECT Kunde.Mailadresse, Count(*) AS Anzahl
FROM   Kunde, Buchung
WHERE  Kunde.Mailadresse = Buchung.Mailadresse
GROUP  BY Kunde.Mailadresse
HAVING Count(*) > 1;


-- c) Welche Ferienwohnungen in Spanien haben durchschnittlich mehr als 4 Sterne erhalten?
SELECT Ferienwohnung.Wohnungsnummer, Avg(Buchung.Rating) AS Durchschnitt
FROM   Ferienwohnung, Buchung, Adresse
WHERE  Ferienwohnung.AdressID = Adresse.AdressID
AND    Adresse.Landname = 'Spanien'
AND    Buchung.Wohnungsnummer = Ferienwohnung.Wohnungsnummer;

-- d) Welche Ferienwohnung hat die meisten Ausstattungen? Falls mehrere Ferienwohnungen das Maximum an Ausstattungen erreichen, sollen diese alle ausgegeben werden.
SELECT Ferienwohnung.ferienwohnungsname, COUNT(*) AS Anzahl
FROM   Ferienwohnung, Ausstattung, besitzt
WHERE  Ferienwohnung.Wohnungsnummer = besitzt.Wohnungsnummer
AND    Ausstattung.Ausstattungsname = besitzt.Ausstattungsname
GROUP  BY Ferienwohnung.ferienwohnungsname
HAVING COUNT(*) = (SELECT MAX(Anzahl)
                   FROM   (SELECT Ferienwohnung.ferienwohnungsname, COUNT(*) AS Anzahl
                           FROM   Ferienwohnung, Ausstattung, besitzt
                           WHERE  Ferienwohnung.Wohnungsnummer = besitzt.Wohnungsnummer
                           AND    Ausstattung.Ausstattungsname = besitzt.Ausstattungsname
                           GROUP  BY Ferienwohnung.ferienwohnungsname) AS Tabelle);

-- e) Wie viele Reservierungen gibt es für die einzelnen Länder? Länder, in denen keine Reservierungen existieren, sollen mit der Anzahl 0 ebenfalls aufgeführt werden. Das Ergebnis soll nach der Anzahl Reservierungen absteigend sortiert werden.
SELECT l.Landname, COUNT(b.Buchungsnummer) AS BuchungProLand
FROM Buchung b inner join Ferienwohnung f on b.Wohnungsnummer = f.Wohnungsnummer
inner join Adresse a on f.AdressID = a.AdressID
right outer join Land l on a.Landname = l.Landname
GROUP BY l.Landname
ORDER BY BuchungProLand DESC;

-- f) Wie viele Ferienwohnungen sind pro Stadtnamen gespeichert?
SELECT a.Stadt, COUNT(f.Wohnungsnummer) AS FerienwohnungenProStadt
FROM Ferienwohnung f inner join Adresse a on f.AdressID = a.AdressID
GROUP BY a.Stadt;

-- g) Welche Ferienwohnungen mit Sauna sind in Spanien in der Zeit vom 1.11.2022 – 21.11.2022 noch frei? Geben Sie den Ferienwohnungs-Namen und deren durchschnittliche Bewertung an. Ferienwohnungen mit guten Bewertungen sollen zuerst angezeigt werden. Ferienwohnungen ohne Bewertungen sollen am Ende ausgegeben werden.
SELECT f.ferienwohnungsname, AVG(b.Rating) AS Durchschnitt
FROM Ferienwohnung f inner join Adresse a on f.AdressID = a.AdressID
inner join Buchung b on f.Wohnungsnummer = b.Wohnungsnummer
inner join besitzt be on f.Wohnungsnummer = be.Wohnungsnummer
inner join Ausstattung au on be.Ausstattungsname = au.Ausstattungsname
WHERE a.Landname = 'Spanien' AND au.Ausstattungsname = 'Sauna'
AND b.Enddatum > '2022-11-01' AND b.Enddatum < '2022-11-21'
GROUP BY f.ferienwohnungsname
ORDER BY Durchschnitt DESC;