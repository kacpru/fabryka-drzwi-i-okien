-- Tabela klientów (z dodanym kluczem głównym)
CREATE TABLE Klienci (
    klient_id INT IDENTITY(1,1) PRIMARY KEY,  -- Automatycznie generowany ID
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefon VARCHAR(15),
    adres VARCHAR(150)
);

-- Tabela produktów
CREATE TABLE Produkty (
    produkt_id INT IDENTITY(1,1) PRIMARY KEY,  -- Automatycznie generowany ID
    nazwa VARCHAR(100) NOT NULL,
    cena DECIMAL(10, 2) NOT NULL,
    kategoria VARCHAR(50)
);

-- Tabela okien, powiązana z produktami
CREATE TABLE Okna (
    okno_id INT IDENTITY(1,1) PRIMARY KEY,  -- Automatycznie generowany ID
    produkt_id INT,
    szerokosc INT NOT NULL,
    wysokosc INT NOT NULL,
    material VARCHAR(50) NOT NULL,
    FOREIGN KEY (produkt_id) REFERENCES Produkty(produkt_id) ON DELETE CASCADE
);

-- Tabela drzwi, powiązana z produktami
CREATE TABLE Drzwi (
    drzwi_id INT IDENTITY(1,1) PRIMARY KEY,  -- Automatycznie generowany ID
    produkt_id INT,
    szerokosc INT NOT NULL,
    wysokosc INT NOT NULL,
    material VARCHAR(50) NOT NULL,
    typ_otwierania VARCHAR(20),
    FOREIGN KEY (produkt_id) REFERENCES Produkty(produkt_id) ON DELETE CASCADE
);

-- Tabela oddziałów
CREATE TABLE Oddzialy (
    oddzial_id INT IDENTITY(1,1) PRIMARY KEY,  -- Automatycznie generowany ID
    nazwa VARCHAR(100) NOT NULL,
    adres VARCHAR(150),
    telefon VARCHAR(15)
);

-- Tabela pracowników, powiązana z oddziałami
CREATE TABLE Pracownicy (
    pracownik_id INT IDENTITY(1,1) PRIMARY KEY,  -- Automatycznie generowany ID
    oddzial_id INT,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    stanowisko VARCHAR(50),
    data_zatrudnienia DATE,
    FOREIGN KEY (oddzial_id) REFERENCES Oddzialy(oddzial_id) ON DELETE SET NULL
);

-- Tabela zamówień, powiązana z klientami
CREATE TABLE Zamowienia (
    zamowienie_id INT IDENTITY(1,1) PRIMARY KEY,  -- Automatycznie generowany ID
    klient_id INT,
    data_zamowienia DATE DEFAULT GETDATE(),
    status VARCHAR(20) DEFAULT 'przyjęte',
    FOREIGN KEY (klient_id) REFERENCES Klienci(klient_id) ON DELETE SET NULL
);

-- Tabela szczegółów zamówienia, powiązana z zamówieniami i produktami
CREATE TABLE SzczegolyZamowienia (
    szczegol_id INT IDENTITY(1,1) PRIMARY KEY,  -- Automatycznie generowany ID
    zamowienie_id INT,
    produkt_id INT,
    ilosc INT NOT NULL,
    cena DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (zamowienie_id) REFERENCES Zamowienia(zamowienie_id) ON DELETE CASCADE,
    FOREIGN KEY (produkt_id) REFERENCES Produkty(produkt_id) ON DELETE CASCADE
);
