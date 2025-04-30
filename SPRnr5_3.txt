CREATE TABLE Pracownik (
    id_pracownik INT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    telefon VARCHAR(20),
    email VARCHAR(100),
    adres_zamieszkania VARCHAR(255),
    konto_bankowe VARCHAR(34)
);

CREATE TABLE Księgowy (
    id_ksiegowy INT PRIMARY KEY,
    dostep_do_ksiegowosci BOOLEAN,
    FOREIGN KEY (id_ksiegowy) REFERENCES Pracownik(id_pracownik)
);

CREATE TABLE Faktura (
    id_faktura INT PRIMARY KEY,
    wartosc_zaplaty DECIMAL(10, 2),
    data_wystawienia DATE,
    data_platnosci DATE,
    zrealizowana BOOLEAN,
    id_ksiegowy INT,
    FOREIGN KEY (id_ksiegowy) REFERENCES Księgowy(id_ksiegowy)
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
