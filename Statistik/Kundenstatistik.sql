-- Task 6 b)

CREATE VIEW KundeZahlung AS
SELECT k.Mailadresse, b.Buchungsnummer, b.Rechnungsbetrag - SUM(a.Geldbetrag) AS Zahlung
FROM Kunde k
INNER JOIN Buchung b ON k.Mailadresse = b.Mailadresse
INNER JOIN Anzahlung a ON b.Buchungsnummer = a.Buchungsnummer
WHERE b.Rechnungsdatum <= CURRENT_DATE
AND (b.Rechnungsbetrag > 0 OR b.Rechnungsdatum > CURRENT_DATE)
GROUP BY k.Mailadresse, b.Buchungsnummer;

CREATE VIEW Kundenstatistik AS
SELECT k.Mailadresse, k.Kundenname, COUNT(b.Buchungsnummer) AS AnzahlBuchungen, COUNT(s.Stornierungsnummer) AS AnzahlStornierungen, ABS(SUM(z.Zahlung)) AS Gesamtzahlung
FROM Kunde k left outer join Buchung b on k.Mailadresse = b.Mailadresse
left outer join StornierteBuchung s on k.Mailadresse = s.Mailadresse
left outer join KundeZahlung z on k.Mailadresse = z.Mailadresse
GROUP BY k.Mailadresse, Kundenname;

SELECT * FROM Kundenstatistik;


drop VIEW Kundenstatistik;
DROP VIEW KundeZahlung;