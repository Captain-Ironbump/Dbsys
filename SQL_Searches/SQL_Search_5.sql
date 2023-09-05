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


