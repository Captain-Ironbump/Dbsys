-- Task 6 . a) 

CREATE TRIGGER storniere_buchung
BEFORE DELETE
ON Buchung FOR EACH ROW
BEGIN
    DELETE FROM Anzahlung WHERE Buchungsnummer = OLD.Buchungsnummer;
    INSERT INTO StornierteBuchung(Mailadresse,Buchungsnummer,Stornierungsdatum)
    VALUES(OLD.Mailadresse,OLD.Buchungsnummer,CURDATE());
END;

SELECT * FROM StornierteBuchung;
SELECT * FROM Buchung;
DROP TRIGGER storniere_buchung;
DELETE FROM Buchung WHERE Buchungsnummer = 6;
