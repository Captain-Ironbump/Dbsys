/*
Values are inserted into the Database
*/

insert into Land(Landname)
values('Deutschland');
insert into Land(Landname)
values('America');
/* F�r Aufgabe 5c) */
insert into Land(Landname)
values('Spanien');


insert into Ausstattung(Ausstattungsname)
values('Sauna');
insert into Ausstattung(Ausstattungsname)
values('Kueche');
insert into Ausstattung(Ausstattungsname)
values('Whirpool');
insert into Ausstattung(Ausstattungsname)
values('Balkon');


insert into Attraktion(Attraktionsname, Beschreibung)
values('Riesenrad', 'Des is einfach ein Riesenrad');
insert into Attraktion(Attraktionsname, Beschreibung)
values('Kino', 'sehr bequem');
insert into Attraktion(Attraktionsname, Beschreibung)
values('McDonalds', 'ungesundes futter, nur f�r Sie, kommen Sie sofort!');


insert into Adresse(Hausnummer, Stadt, PLZ, Strasse, Landname)
values(14, 'Stuttgart', '77666', 'Berliner-Strasse', 'Deutschland');
insert into Adresse(Hausnummer, Stadt, PLZ, Strasse, Landname)
values(10, 'Konstanz', '78467', 'Heilbronner-Strasse', 'Deutschland');
insert into Adresse(Hausnummer, Stadt, PLZ, Strasse, Landname)
values(9, 'Bietigheim-Bissingen', '74321', 'Berliner-Strasse', 'Deutschland');
insert into Adresse(Hausnummer, Stadt, PLZ, Strasse, Landname)
values(8, 'St.Louis', '44455', 'ST.Louis-Street', 'America');
insert into Adresse(Hausnummer, Stadt, PLZ, Strasse, Landname)
values(3, 'Konstanz', '78467', 'Max-Stromeyer-Str', 'Deutschland');
/* f�r Aufgabe 5c) */
insert into Adresse(Hausnummer, Stadt, PLZ, Strasse, Landname)
values(23, 'Madrid', '11111', 'West-Hood', 'Spanien');


insert into Ferienwohnung(Groesse, Zimmerzahl, 
ferienwohnungsname, Preis, AdressID)
values(35.00, 2, 'WG_SOMETHING', 20.00, 1);
insert into Ferienwohnung(Groesse, Zimmerzahl, 
ferienwohnungsname, Preis, AdressID)
values(36.00, 2, 'Krass', 21.00, 2);
insert into Ferienwohnung(Groesse, Zimmerzahl, 
ferienwohnungsname, Preis, AdressID)
values(46.00, 2, 'WasWeisIch', 18.00, 3);
insert into Ferienwohnung(Groesse, Zimmerzahl, 
ferienwohnungsname, Preis, AdressID)
values(36.00, 2, 'Krass', 21.00, 4);
insert into Ferienwohnung(Groesse, Zimmerzahl, 
ferienwohnungsname, Preis, AdressID)
values(60.00, 5, 'SchimmelWG', 40.00, 5);
insert into Ferienwohnung(Groesse, Zimmerzahl, 
ferienwohnungsname, Preis, AdressID)
values(60.00, 5, 'HII', 40.00, 5); /*WohnungsID 6*/
/* F�r Aufgabe 5c) */
insert into Ferienwohnung(Groesse, Zimmerzahl, 
ferienwohnungsname, Preis, AdressID)
values(10.00, 1, 'Rock-Studio', 600.00, 6); /*WohnungsID 9*/


/* BLOB Datatype needs to be casted to raw with function:
    utl_raw.cast_to_raw() */
insert into Bild(Bild, Wohnungsnummer)
values(LOAD_FILE('https:\\something.pdf'), 1);
insert into Bild(Bild, Wohnungsnummer)
values(LOAD_FILE('https:\\something.pdf'), 2);
insert into Bild(Bild, Wohnungsnummer)
values(LOAD_FILE('https:\\something.pdf'), 3);
insert into Bild(Bild, Wohnungsnummer)
values(LOAD_FILE('https:\\something.pdf'), 4);
/* F�r Aufgabe 5c) */
insert into Bild(Bild, Wohnungsnummer)
values(LOAD_FILE('https:\\something.pdf'), 7);


insert into Kunde(Mailadresse, Kundenname, IBAN, 
HashPasswort, Newsletter, AdressID)
values('something@gmail.com', 'Max Mustermann', 'DE11111111111111111112',
'12A45', 'Y', 1);
insert into Kunde(Mailadresse, Kundenname, IBAN,
HashPasswort, Newsletter, AdressID)
values('somethingtwo@gmail.com', 'Peter Griffin', 
'DE11111151111111111112', '1EA65', 'N', 2);
insert into Kunde(Mailadresse, Kundenname, IBAN,
HashPasswort, Newsletter, AdressID)
values('somethingwowo@gmail.com', 'Bart Simpson', 
'DE11111161111111111112', '1E345', 'Y', 3);
insert into Kunde(Mailadresse, Kundenname, IBAN,
HashPasswort, Newsletter, AdressID)
values('somethingtwowiwo@gmail.com', 'Max Mustermann', 
'DE11111171111111111112', '1ASD5', 'N', 4);
insert into Kunde(Mailadresse, Kundenname, IBAN,
HashPasswort, Newsletter, AdressID)
values('HUU@gmail.com', 'Rick Morty', 
'DE11111181111111111112', 'DE1NE', 'N', 5);



-- STR_TO_DATE('07-25-2012','%m-%d-%Y')

insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer,
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values(STR_TO_DATE('20-05-2005', '%d-%m-%Y'), STR_TO_DATE('08-05-2005', '%d-%m-%Y'), 3, 65, 
'Das war so coooool jaaaaa', STR_TO_DATE('19-05-2005', '%d-%m-%Y'), 400.00, 1, 'somethingtwo@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values(STR_TO_DATE('12-05-2005', '%d-%m-%Y'), STR_TO_DATE('09-05-2005', '%d-%m-%Y'), 4, 45, 
'Das war so coooool', STR_TO_DATE('19-05-2005', '%d-%m-%Y'), 300.00, 2, 'something@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values(STR_TO_DATE('12-05-2005', '%d-%m-%Y'), STR_TO_DATE('09-05-2005', '%d-%m-%Y'), 5, 40, 
'Das war so coooool echt jetzt', STR_TO_DATE('19-05-2005', '%d-%m-%Y'), 300.00, 3, 'somethingtwowiwo@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values(STR_TO_DATE('12-05-2005', '%d-%m-%Y'), STR_TO_DATE('09-05-2005', '%d-%m-%Y'), 3, 23, 
'Das war so solala', STR_TO_DATE('19-05-2005', '%d-%m-%Y'), 300.00, 4, 'somethingwowo@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values(STR_TO_DATE('12-05-2005', '%d-%m-%Y'), STR_TO_DATE('09-05-2005', '%d-%m-%Y'), 2, 20, 
'viel zu teuer', STR_TO_DATE('19-05-2005', '%d-%m-%Y'), 400.00, 5, 'HUU@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values(STR_TO_DATE('15-05-2005', '%d-%m-%Y'), STR_TO_DATE('10-05-2005', '%d-%m-%Y'), 2, 100, 
'viel zu teuer', STR_TO_DATE('30-05-2005', '%d-%m-%Y'), 400.00, 5, 'HUU@gmail.com');
/* F�r Aufgabe 5c) */
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer,
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values(STR_TO_DATE('15-07-2005', '%d-%m-%Y'), STR_TO_DATE('10-07-2005', '%d-%m-%Y'), 5, 456,
'OOOOH Junge', STR_TO_DATE('26-07-2005', '%d-%m-%Y'), 1400.00, 7, 'HUU@gmail.com');

/*
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer,
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values('20-05-2005', '08-05-2005', 3, 65, 
'Das war so coooool jaaaaa', '19-05-2005', 400.00, 1, 'somethingtwo@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values('12-05-2005', '09-05-2005', 4, 45, 
'Das war so coooool', '19-05-2005', 300.00, 2, 'something@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values('12-05-2005', '09-05-2005', 5, 40, 
'Das war so coooool echt jetzt', '19-05-2005', 300.00, 3, 'somethingtwowiwo@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values('12-05-2005', '09-05-2005', 3, 23, 
'Das war so solala', '19-05-2005', 300.00, 4, 'somethingwowo@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values('12-05-2005', '09-05-2005', 2, 20, 
'viel zu teuer', '19-05-2005', 400.00, 5, 'HUU@gmail.com');
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer, 
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values('15-05-2005', '10-05-2005', 2, 100, 
'viel zu teuer', '30-05-2005', 400.00, 5, 'HUU@gmail.com');
/* F�r Aufgabe 5c) */
/*
insert into Buchung(Enddatum, Anfangsdatum, Rating, Rechnumgsnummer,
Beschreibung, Rechnungsdatum, Rechnungsbetrag, Wohnungsnummer, Mailadresse)
values('15-07-2005', '10-07-2005', 5, 456,
'OOOOH Junge', '26-07-2005', 1400.00, 7, 'HUU@gmail.com');*/



insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(302, 30.00, STR_TO_DATE('10-05-2005', '%d-%m-%Y'), 1);
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(301, 40.00, STR_TO_DATE('09-05-2005', '%d-%m-%Y'), 2);
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(303, 30.00, STR_TO_DATE('09-05-2005', '%d-%m-%Y'), 3);
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(304, 20.00, STR_TO_DATE('09-05-2005', '%d-%m-%Y'), 4);
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(305, 10.00, STR_TO_DATE('09-05-2005', '%d-%m-%Y'), 5);
/* F�r Aufgabe 5c) */
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(306, 5.00, STR_TO_DATE('09-06-2005', '%d-%m-%Y'), 6);

/*
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(302, 30.00, '10-05-2005', 1);
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(301, 40.00, '09-05-2005', 2);
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(303, 30.00, '09-05-2005', 3);
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(304, 20.00, '09-05-2005', 4);
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(305, 10.00, '09-05-2005', 5);
/* F�r Aufgabe 5c) */
/*
insert into Anzahlung(AnzahlungsID, Geldbetrag, Zahlungsdatum, Buchungsnummer)
values(306, 5.00, '09-06-2005', 6);*/



insert into entfernt_von(Wohnungsnummer, Attraktionsname, Entfernung)
values(1, 'Riesenrad', 40.00);
insert into entfernt_von(Wohnungsnummer, Attraktionsname, Entfernung)
values(5, 'McDonalds', 10.00);
insert into entfernt_von(Wohnungsnummer, Attraktionsname, Entfernung)
values(2, 'Kino', 30.00);
insert into besitzt(Ausstattungsname, Wohnungsnummer)
values('Sauna', 1);
insert into besitzt(Ausstattungsname, Wohnungsnummer)
values('Balkon', 5);
insert into besitzt(Ausstattungsname, Wohnungsnummer)
values('Balkon', 1);