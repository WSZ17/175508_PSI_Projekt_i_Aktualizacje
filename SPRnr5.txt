CREATE TABLE Klient (
    id_klient INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(100),
    nazwisko VARCHAR(100),
    nr_telefonu VARCHAR(20),
    adres_email VARCHAR(100)
);

CREATE TABLE Pracownik (
    id_pracownik INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(100),
    nazwisko VARCHAR(100),
    nr_telefonu VARCHAR(20),
    adres_email VARCHAR(100),
    adres_zamieszkania VARCHAR(200),
    nr_konta_bankowego VARCHAR(50),
    FOREIGN KEY (id_szef) REFERENCES Wlasciciel(id_wlasciciel)
);


CREATE TABLE Sprzedawca (
    id_sprzedawca INT PRIMARY KEY,
    dostep_do_systemu_sprzedazy BOOLEAN,
    FOREIGN KEY (id_sprzedawca) REFERENCES Pracownik(id_pracownik)
);


CREATE TABLE Kierownik (
    id_kierownik INT PRIMARY KEY,
    dostep_do_bazy_danych BOOLEAN,
    FOREIGN KEY (id_kierownik) REFERENCES Pracownik(id_pracownik)
);

CREATE TABLE Ksiegowy (
    id_ksiegowy INT PRIMARY KEY,
    dostep_do_ksiegowosci BOOLEAN,
    FOREIGN KEY (id_ksiegowy) REFERENCES Pracownik(id_pracownik)
);

CREATE TABLE Produkt (
    produkt_id INT PRIMARY KEY AUTO_INCREMENT,
    nazwa VARCHAR(100),
    cena FLOAT
);

CREATE TABLE Bilet (
    bilet_id INT PRIMARY KEY,
    dane_kupujacego VARCHAR(200),
    okres_waznosci DATE,
    FOREIGN KEY (bilet_id) REFERENCES Produkt(produkt_id)
);

CREATE TABLE Pamiatka (
    pamiatka_id INT PRIMARY KEY,
    FOREIGN KEY (pamiatka_id) REFERENCES Produkt(produkt_id)
);

CREATE TABLE Danie (
    danie_id INT PRIMARY KEY,
    alergeny VARCHAR(200),
    FOREIGN KEY (danie_id) REFERENCES Produkt(produkt_id)
);

CREATE TABLE Platnosc (
    platnosc_id INT PRIMARY KEY AUTO_INCREMENT,
    nr_platnosci VARCHAR(50)
);

CREATE TABLE Sprzedaz (
    sprzedaz_id INT PRIMARY KEY AUTO_INCREMENT,
    klient_id INT,
    produkt_id INT,
    platnosc_id INT,
    sprzedawca_id INT,
    FOREIGN KEY (klient_id) REFERENCES Klient(id_klient),
    FOREIGN KEY (produkt_id) REFERENCES Produkt(produkt_id),
    FOREIGN KEY (platnosc_id) REFERENCES Platnosc(platnosc_id),
    FOREIGN KEY (sprzedawca_id) REFERENCES Sprzedawca(id_sprzedawca)
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
    FOREIGN KEY (kierownik_id) REFERENCES Kierownik(id_kierownik)
);

CREATE TABLE Faktura (
    id_faktura INT PRIMARY KEY AUTO_INCREMENT,
    wartosc_zaplaty FLOAT,
    data_wystawienia DATE,
    data_platnosci DATE,
    czy_zrealizowana BOOLEAN,
    zamowienie_id INT,
    ksiegowy_id INT,
    FOREIGN KEY (zamowienie_id) REFERENCES Zamowienie(zamowienie_id),
    FOREIGN KEY (ksiegowy_id) REFERENCES Ksiegowy(id_ksiegowy)
);

CREATE TABLE Bank (
    id_bank INT PRIMARY KEY,
    nazwa VARCHAR(100),
    kontakt VARCHAR(50),
    adres VARCHAR(255),
    adres_biura_glownego VARCHAR(255)
);

CREATE TABLE Przelew (
    id_przelew INT PRIMARY KEY,
    id_faktura INT,
    id_bank INT,
    data_przelewu DATE,
    kwota DECIMAL(10, 2),
    FOREIGN KEY (id_faktura) REFERENCES Faktura(id_faktura),
    FOREIGN KEY (id_bank) REFERENCES Bank(id_bank)
);

CREATE TABLE Wlasciciel (
    id_wlasciciel INT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    kontakt VARCHAR(50),
    adres_zamieszkania VARCHAR(255)
);


CREATE TABLE Szkolenie (
    id_szkolenie INT PRIMARY KEY,
    opis TEXT,
    data_rozpoczecia DATE,
    data_zakonczenia DATE,
    prowadzacy VARCHAR(100)
);

CREATE TABLE UdzialWSzkoleniu (
    id_pracownik INT,
    id_szkolenie INT,
    PRIMARY KEY (id_pracownik, id_szkolenie),
    FOREIGN KEY (id_pracownik) REFERENCES Pracownik(id_pracownik),
    FOREIGN KEY (id_szkolenie) REFERENCES Szkolenie(id_szkolenie)
);