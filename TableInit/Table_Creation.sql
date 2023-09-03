/* 
This file creates all the Tables
*/

CREATE TABLE Land
(   Landname  varchar(20)   not null,
    CONSTRAINT Land_pk PRIMARY KEY (Landname)    
);
    
CREATE TABLE Ausstattung 
(   Ausstattungsname    varchar(40),
    CONSTRAINT Ausstattung_pk PRIMARY KEY (Ausstattungsname) 
);

CREATE TABLE Attraktion
(   Attraktionsname varchar(20),
    Beschreibung    varchar(200),
    CONSTRAINT  Attraktion_pk PRIMARY KEY (Attraktionsname)
);
    
CREATE TABLE Adresse
(   Hausnummer  varchar(4),
    Stadt       varchar(30),
    PLZ         varchar(5),
    Strasse     varchar(30),
    AdressID    INT not NULL AUTO_INCREMENT, --generated always as identity
    Landname    varchar(20),
    CONSTRAINT  Adresse_pk PRIMARY KEY (AdressID),
    CONSTRAINT  Adresse_fk FOREIGN KEY (Landname)
                REFERENCES Land(Landname)
);
                
CREATE TABLE Ferienwohnung
(   Wohnungsnummer      INT  not NULL AUTO_INCREMENT,
    Groesse             INT,
    Zimmerzahl          INT,
    ferienwohnungsname  varchar(20),
    Preis               DECIMAL(10,2),
    AdressID            INT,
    CONSTRAINT  Ferienwohnung_pk PRIMARY KEY (Wohnungsnummer),
    CONSTRAINT  Ferienwohnung_fk FOREIGN KEY (AdressID)
                REFERENCES Adresse(AdressID),
    CONSTRAINT  groesse_check   check(Groesse > 0),
    CONSTRAINT  zimmerzahl_check    check(Zimmerzahl >= 1),
    CONSTRAINT  preis_check    check(Preis > 0.0)
);

CREATE TABLE Bild
(   Bild            blob,
    BildID          INT  not NULL AUTO_INCREMENT,
    Wohnungsnummer  INT,
    CONSTRAINT  Bild_pk PRIMARY KEY (BildID),
    CONSTRAINT  Bild_fk FOREIGN KEY (Wohnungsnummer)
                REFERENCES Ferienwohnung(Wohnungsnummer)
);

CREATE TABLE Kunde
(   Mailadresse     varchar(40),
    Kundenname      varchar(20),
    IBAN            char(22),
    HashPasswort    varchar(40),
    Newsletter      char(1) check(Newsletter in ('Y', 'N')),
    AdressID        INT,
    CONSTRAINT  Kunde_pk PRIMARY KEY (Mailadresse),
    CONSTRAINT  Kunde_fk FOREIGN KEY (AdressID)
                REFERENCES Adresse(AdressID)
);

CREATE TABLE Buchung
(   Buchungsnummer  INT not NULL AUTO_INCREMENT,
    Enddatum        DATE    not null,
    Anfangsdatum    DATE    not null,
    Rating          INT,
    Rechnumgsnummer INT UNIQUE,
    Beschreibung    varchar(400),
    Rechnungsdatum  DATE,
    Rechnungsbetrag DECIMAL(10,2),
    Wohnungsnummer  INT     not null,
    Mailadresse     varchar(40) not null,
    CONSTRAINT  Buchung_pk PRIMARY KEY (Buchungsnummer),
    CONSTRAINT  Buchung_fk_Wohnung FOREIGN KEY (Wohnungsnummer)
                REFERENCES Ferienwohnung(Wohnungsnummer),
    CONSTRAINT  Buchung_fk_Kunde FOREIGN KEY (Mailadresse)
                REFERENCES Kunde(Mailadresse),
    CONSTRAINT  enddatum_check  check(Enddatum >= Anfangsdatum + 3),
    CONSTRAINT  Rating_ckeck    check(Rating >= 0 and Rating <= 5),
    CONSTRAINT  Rechnungsnummer_check   check(Rechnumgsnummer > 0)
);
    
CREATE TABLE Anzahlung
(   AnzahlungsID    INT not null,
    Geldbetrag      DECIMAL(10,2) not null,
    Zahlungsdatum   DATE,
    Buchungsnummer  INT not null,
    CONSTRAINT  Anzahlung_pk PRIMARY KEY (AnzahlungsID),
    CONSTRAINT  Anzahlung_fk FOREIGN KEY (Buchungsnummer)
                REFERENCES Buchung(Buchungsnummer)
);

CREATE TABLE entfernt_von
(   Wohnungsnummer      INT,
    Attraktionsname     varchar(20),
    Entfernung          DECIMAL(4,2),
    CONSTRAINT  entfernt_von_pk PRIMARY KEY (Wohnungsnummer, Attraktionsname),
    CONSTRAINT  entfernt_von_fk_WI FOREIGN KEY (Wohnungsnummer)
                REFERENCES Ferienwohnung(Wohnungsnummer),
    CONSTRAINT  entfernt_von_fk_AN FOREIGN KEY (Attraktionsname)
                REFERENCES Attraktion(Attraktionsname) ON DELETE cascade,
    CONSTRAINT  entfernung_check    check(Entfernung <= 50.00) 
);

CREATE TABLE besitzt
(   Ausstattungsname    varchar(20),
    Wohnungsnummer      INT,
    CONSTRAINT  besitzt_pk PRIMARY KEY (Ausstattungsname, Wohnungsnummer),
    CONSTRAINT  besitzt_fk_AS FOREIGN KEY (Ausstattungsname)
                REFERENCES Ausstattung(Ausstattungsname),
    CONSTRAINT  besitzt_fk_WI FOREIGN KEY (Wohnungsnummer)
                REFERENCES Ferienwohnung(Wohnungsnummer)
);

/* datenqualit�t, Atribute auf not null setzen */
/* On delete cascade bei constraint (fremdschl�ssel) */