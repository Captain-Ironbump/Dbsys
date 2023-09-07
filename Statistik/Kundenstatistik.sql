-- Task 6 b)

CREATE VIEW KundeZahlung AS
SELECT k.Mailadresse, b.Buchungsnummer, b.Rechnungsbetrag - SUM(a.Geldbetrag) AS Zahlung
FROM Kunde k inner join Buchung b on k.Mailadresse = b.Mailadresse
inner join Anzahlung a on b.Buchungsnummer = a.Buchungsnummer
GROUP BY k.Mailadresse, b.Buchungsnummer;

CREATE VIEW Kundenstatistik AS
SELECT k.Mailadresse, k.Kundenname, COUNT(b.Buchungsnummer) AS AnzahlBuchungen, COUNT(s.Stornierungsnummer) AS AnzahlStornierungen, SUM(z.Zahlung) AS Gesamtzahlung
FROM Kunde k left outer join Buchung b on k.Mailadresse = b.Mailadresse
left outer join StornierteBuchung s on k.Mailadresse = s.Mailadresse
left outer join KundeZahlung z on k.Mailadresse = z.Mailadresse
GROUP BY k.Mailadresse, Kundenname;

SELECT * FROM Kundenstatistik;


drop VIEW Kundenstatistik;
DROP VIEW KundeZahlung;