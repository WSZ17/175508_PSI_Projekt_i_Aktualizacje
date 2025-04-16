CREATE TABLE Klient (
    klient_id INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(100),
    nazwisko VARCHAR(100),
    nr_telefonu VARCHAR(20),
    adres_email VARCHAR(100)
);

CREATE TABLE Pracownik (
    pracownik_id INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(100),
    nazwisko VARCHAR(100),
    nr_telefonu VARCHAR(20),
    adres_email VARCHAR(100),
    adres_zamieszkania VARCHAR(200),
    nr_konta_bankowego VARCHAR(50),
    typ_pracownika ENUM('Sprzedawca', 'Kierownik Sprzedaży', 'Księgowy') NOT NULL
);

CREATE TABLE Produkt (
    produkt_id INT PRIMARY KEY AUTO_INCREMENT,
    nazwa VARCHAR(100),
    cena FLOAT,
    typ_produktu ENUM('Bilet', 'Pamiątka', 'Danie') NOT NULL
);

CREATE TABLE Bilet (
    produkt_id INT PRIMARY KEY,
    dane_kupujacego VARCHAR(200),
    okres_waznosci DATE,
    FOREIGN KEY (produkt_id) REFERENCES Produkt(produkt_id)
);

CREATE TABLE Pamiatka (
    produkt_id INT PRIMARY KEY,
    FOREIGN KEY (produkt_id) REFERENCES Produkt(produkt_id)
);

CREATE TABLE Danie (
    produkt_id INT PRIMARY KEY,
    alergeny VARCHAR(200),
    FOREIGN KEY (produkt_id) REFERENCES Produkt(produkt_id)
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
    FOREIGN KEY (klient_id) REFERENCES Klient(klient_id),
    FOREIGN KEY (produkt_id) REFERENCES Produkt(produkt_id),
    FOREIGN KEY (platnosc_id) REFERENCES Platnosc(platnosc_id),
    FOREIGN KEY (sprzedawca_id) REFERENCES Pracownik(pracownik_id)
);
