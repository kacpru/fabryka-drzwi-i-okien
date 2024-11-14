## Lista zapytań
1. [CREATE TABLE - Tworzenie nowej tabeli Promocje](#zapytanie-1)
2. [INSERT - Dodanie danych do tabeli Promocje](#zapytanie-2)
3. [UPDATE - Zaktualizowanie rabatu dla jednej z promocj](#zapytanie-3)
4. [DELETE - Usunięcie promocji, która się już zakończyła](#zapytanie-4)
5. [ALTER TABLE, ADD COLUMN - Dodanie kolumny do tabeli informującej,czy promocja jest aktywna](#zapytanie-5)
6. [ALTER TABLE, ALTER COLUMN - modyfikacja kolumny opis na bardziej szczegółowy](#zapytanie-6)
7. [ALTER TABLE, DROP COLUMN - Usunięcie kolumny 'aktywna'](#zapytanie-7)
8. [PRIMARY KEY - Ustawienie kolumny 'promocja_id' jako klucz główny](#zapytanie-8)
9. [NOT NULL- Zmiana kolumny 'nazwa', aby była obowiązkowa i nie akceptowała wartości NULL](#zapytanie-9)
10. [CHECK - Dodanie constraint CHECK, aby zapewnić, że rabat nie może być mniejszy niż 0 i nie większy niż 100.](#zapytanie-10)
11. [UNIQUE - Zmiana kolumny 'nazwa', aby była unikalna. Oznacza to, że każda promocja będzie miała inną nazwę.](#zapytanie-11)
12. [DEFAULT - Ustawienie wartości domyślnej dla kolumny 'data_rozpoczecia', aby była ustawiona na dzisiejszą datę, jeśli użytkownik jej nie poda.](#zapytanie-12)
13. [INDEX - Stworzenie indeksu dla kolumny 'data_rozpoczecia', aby przyspieszyć wyszukiwanie promocji po dacie rozpoczęcia.](#zapytanie-13)
14. [TRUNCATE TABLE - Usunięcie wszystkich danych z tabel](#zapytanie-8)
15. [DROP TABLE - Całkowite usunięcie tabeli z bazy danych](#zapytanie-8)

16. [SELECT,WHERE,LIKE - Wybierz wszystkich klientów z miasta Stalowa Wola](#zapytanie-16)
17. [BETWEEN - Wybór produktów z przedziału 300 do 800 zł](#zapytanie-17)
18. [WHERE IN - wyszukaj pracowników o imieniu Piotr lub Paweł](#zapytanie-18)
19. [ORDER BY - Sortowanie wyników według daty zamówienia](#zapytanie-19)
20. [ORDER BY,TOP - Pobranie pięciu ostatnich wysłąnych zamówień](#zapytanie-20)
21. [DISTINCT - Wyszukaj wszystkie stanowiska w firmie](#zapytanie-21)
22. [GROUP BY,COUNT - Grupowanie zamówień według statusu zamówienia](#zapytanie-22)
23. [GROUP BY, HAVING - Wyszukaj klientów,którzy złożyli więcej niż jedno zamówienie](#zapytanie-23)
24. [GROUP BY,SUM - Obliczenie łącznej wartości zamówień](#zapytanie-24)
25. [GROUP BY,AVG,AS - Grupowanie produktów według typu i wyciąganie średniej ceny](#zapytanie-25)


---
### Zapytanie 1  
CREATE TABLE - Tworzenie nowej tabeli Promocje.(Tworzenie pozostałych tabel w pliku schema.sql tj:Klienci,Produkty,Okna,Drzwi,Pracownicy,Zamówienia,SzczegółyZamówienia)

```sql
CREATE TABLE CREATE TABLE Promocje (
    promocja_id INT IDENTITY(1,1),
    nazwa NVARCHAR(100),
    opis NVARCHAR(MAX),
    data_rozpoczecia DATE,
    data_zakonczenia DATE,
    rabat DECIMAL(5, 2)
);
```
### Zapytanie 2 
INSERT - Dodanie danych do tabeli Promocje
```sql
INSERT INTO Promocje (nazwa, opis, data_rozpoczecia, data_zakonczenia, rabat)
VALUES
('Zimowa Wyprzedaż', 'Rabaty na okna i drzwi do -20%', '2024-12-01', '2024-12-31', 20.00),
('Promocja Wakacyjna', 'Rabaty na okna balkonowe do -15%', '2024-07-01', '2024-07-31', 15.00);
```
### Zapytanie 3 
UPDATE - Zaktualizowanie rabatu dla jednej z promocji
```sql
UPDATE Promocje
SET rabat = 25.00
WHERE nazwa = 'Zimowa Wyprzedaż';
```
### Zapytanie 4 
DELETE - Usunięcie promocji, która się już zakończyła
```sql
DELETE FROM Promocje
WHERE data_zakonczenia < GETDATE();
```
### Zapytanie 5
ALTER TABLE, ADD COLUMN - Dodanie kolumny do tabeli informującej,czy promocja jest aktywna
```sql
ALTER TABLE Promocje
ADD aktywna BIT DEFAULT 1;
```
### Zapytanie 6
ALTER TABLE, ALTER COLUMN - modyfikacja kolumny 'opis' na bardziej szczegółowy
```sql
ALTER TABLE Promocje
ALTER COLUMN opis NVARCHAR(500);
```
### Zapytanie 7
ALTER TABLE, DROP COLUMN - Usunięcie kolumny 'aktywna'
```sql
ALTER TABLE Promocje
ALTER COLUMN opis NVARCHAR(500);
```
### Zapytanie 8
PRIMARY KEY - Ustawienie kolumny 'promocja_id' jako klucz główny
```sql
ALTER TABLE Promocje
ADD CONSTRAINT PK_Promocje PRIMARY KEY (promocja_id);
```
### Zapytanie 9
NOT NULL- Zmiana kolumny 'nazwa', aby była obowiązkowa i nie akceptowała wartości NULL
```sql
ALTER TABLE Promocje
ALTER COLUMN nazwa NVARCHAR(100) NOT NULL;
```
### Zapytanie 10
CHECK - Dodajemy constraint CHECK, aby zapewnić, że rabat nie może być mniejszy niż 0 i nie większy niż 100.
```sql
ALTER TABLE Promocje
ADD CONSTRAINT CHK_Rabat CHECK (rabat >= 0 AND rabat <= 100);
```
### Zapytanie 11
UNIQUE - Zmiana kolumny 'nazwa', aby była unikalna. Oznacza to, że każda promocja będzie miała inną nazwę.
```sql
ALTER TABLE Promocje
ADD CONSTRAINT UQ_Nazwa UNIQUE (nazwa);
```
### Zapytanie 12
DEFAULT - Ustawienie wartości domyślnej dla kolumny 'data_rozpoczecia', aby była ustawiona na dzisiejszą datę, jeśli użytkownik jej nie poda.
```sql
ALTER TABLE Promocje
ADD CONSTRAINT DF_DataRozpoczecia DEFAULT GETDATE() FOR data_rozpoczecia;
```
### Zapytanie 13
INDEX - Stworzenie indeksu dla kolumny 'data_rozpoczecia', aby przyspieszyć wyszukiwanie promocji po dacie rozpoczęcia.
```sql
CREATE INDEX IX_DataRozpoczecia ON Promocje(data_rozpoczecia);
```
### Zapytanie 14
TRUNCATE TABLE - Usunięcie wszystkich danych z tabel
```sql
TRUNCATE TABLE Promocje;
```
### Zapytanie 15
DROP TABLE - Całkowite usunięcie tabeli z bazy danych
```sql
DROP TABLE Promocje;
```




### Zapytanie 1  
SELECT - Wybierz wszystkich klientów z miasta Stalowa Wola
```sql
SELECT *
FROM Klienci
WHERE adres LIKE '%Stalowa Wola%';
```
### Zapytanie 2 
BETWEEN - Wybór produktów z przedziału 300 do 800 zł
```sql
SELECT *
FROM Produkty
WHERE cena BETWEEN 300 AND 800;
```
### Zapytanie 3
WHERE IN - wyszukaj pracowników o imieniu Piotr lub Paweł
```sql
SELECT *
FROM Pracownicy
WHERE imie IN('Piotr','Paweł');
```
```
### Zapytanie 4
ORDER BY - Sortowanie wyników według daty zamówienia
```sql
SELECT zamowienie_id, data_zamowienia, klient_id
FROM Zamowienia
ORDER BY data_zamowienia DESC;
```
### Zapytanie 5
ORDER BY,TOP - Pobranie pięciu ostatnich wysłanych zamówień
```sql
SELECT TOP 5 *
FROM Zamowienia
WHERE status = 'wysłane'
ORDER BY data_zamowienia DESC;
```
### Zapytanie 6
DISTINCT - Wyszukaj wszystkie stanowiska w firmie
```sql
SELECT DISTINCT stanowisko
FROM Pracownicy;
```
### Zapytanie 7
GROUP BY - Grupowanie zamówień według statusu zamówienia
```sql
SELECT status, COUNT(*) AS liczba_zamowien
FROM Zamowienia
GROUP BY status;
```

### Zapytanie 8
GROUP BY, HAVING - Wyszukaj klientów,którzy złożyli więcej niż jedno zamówienie
```sql
SELECT klient_id, COUNT(zamowienie_id) AS liczba_zamowien
FROM Zamowienia
GROUP BY klient_id
HAVING COUNT(zamowienie_id) > 1;

### Zapytanie 9
GROUP BY,SUM - Obliczenie łącznej wartości zamówień
```sql
SELECT zamowienie_id, SUM(ilosc * cena) AS LacznaWartosc
FROM SzczegolyZamowienia
GROUP BY zamowienie_id;

```
### Zapytanie 10
GROUP BY,AVG, AS - Grupowanie produktów według typu i wyciąganie średniej ceny 
```sql
SELECT nazwa, AVG(cena) AS srednia_cena
FROM Produkty
GROUP BY nazwa

```
