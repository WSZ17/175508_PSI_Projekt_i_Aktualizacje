CREATE TABLE Pracownik (
    id_pracownik INT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    telefon VARCHAR(20),
    email VARCHAR(100),
    adres_zamieszkania VARCHAR(255),
    konto_bankowe VARCHAR(34)
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
