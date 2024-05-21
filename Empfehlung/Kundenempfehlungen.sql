-- Task 6 c)

CREATE VIEW Kundenempfehlungen AS
SELECT k.Mailadresse, f.Wohnungsnummer, b.Rating
FROM Kunde k
INNER JOIN Buchung b ON k.Mailadresse = b.Mailadresse
INNER JOIN Ferienwohnung f ON b.Wohnungsnummer = f.Wohnungsnummer
WHERE b.Rating >= 4
GROUP BY k.Mailadresse, f.Wohnungsnummer, b.Rating;

SELECT K1.Mailadresse AS Kunde1, K2.Mailadresse AS Kunde2, K2.Wohnungsnummer AS EmpfohleneWohnung
FROM Kundenempfehlungen K1
INNER JOIN Kundenempfehlungen K2 ON K1.Wohnungsnummer = K2.Wohnungsnummer AND K1.Rating = K2.Rating
WHERE K1.Rating = 5 AND K1.Mailadresse != K2.Mailadresse