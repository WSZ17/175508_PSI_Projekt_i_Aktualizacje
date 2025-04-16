CREATE TABLE Pracownik (
    pracownik_id INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(100),
    nazwisko VARCHAR(100),
    nr_telefonu VARCHAR(20),
    adres_email VARCHAR(100),
    adres_zamieszkania VARCHAR(200),
    nr_konta_bankowego VARCHAR(50),
    typ_pracownika ENUM('Księgowy', 'Kierownik Sprzedaży') NOT NULL
);

CREATE TABLE Hurtownia (
    hurtownia_id INT PRIMARY KEY AUTO_INCREMENT,
    nr_nip VARCHAR(20),
    nr_kontaktowy VARCHAR(20),
    imie_nazwisko_wlasciciela VARCHAR(100),
    adres_rozliczeniowy VARCHAR(200),
    adres_biura VARCHAR(200)
);

CREATE TABLE FirmaTworzacaAtrakcje (
    firma_id INT PRIMARY KEY AUTO_INCREMENT,
    nr_nip VARCHAR(20),
    nr_kontaktowy VARCHAR(20),
    imie_nazwisko_wlasciciela VARCHAR(100),
    adres_rozliczeniowy VARCHAR(200),
    adres_biura VARCHAR(200)
);

CREATE TABLE Zamowienie (
    zamowienie_id INT PRIMARY KEY AUTO_INCREMENT,
    opis TEXT,
    data_zamowienia DATE,
    forma_zaplaty VARCHAR(50),
    status VARCHAR(50),
    hurtownia_id INT,
    firma_id INT,
    kierownik_id INT,
    FOREIGN KEY (hurtownia_id) REFERENCES Hurtownia(hurtownia_id),
    FOREIGN KEY (firma_id) REFERENCES FirmaTworzacaAtrakcje(firma_id),
    FOREIGN KEY (kierownik_id) REFERENCES Pracownik(pracownik_id)
);

CREATE TABLE Faktura (
    faktura_id INT PRIMARY KEY AUTO_INCREMENT,
    wartosc_zaplaty FLOAT,
    data_wystawienia DATE,
    data_platnosci DATE,
    czy_zrealizowana BOOLEAN,
    zamowienie_id INT,
    ksiegowy_id INT,
    FOREIGN KEY (zamowienie_id) REFERENCES Zamowienie(zamowienie_id),
    FOREIGN KEY (ksiegowy_id) REFERENCES Pracownik(pracownik_id)
);
