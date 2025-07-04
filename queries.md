## Lista zapytań
ddl ,uprawnienia i  coinstranty
1. [CREATE TABLE - Tworzenie nowej tabeli Promocje](#zapytanie-1)
2. [INSERT - Dodanie danych do tabeli Promocje](#zapytanie-2)
3. [UPDATE - Zaktualizowanie rabatu dla jednej z promocj](#zapytanie-3)
4. [DELETE - Usunięcie promocji, która się już zakończyła](#zapytanie-4)
5. [ALTER TABLE, ADD COLUMN - Dodanie kolumny do tabeli informującej,czy promocja jest aktywna](#zapytanie-5)
6. [ALTER TABLE, ALTER COLUMN - modyfikacja kolumny opis na bardziej szczegółowy](#zapytanie-6)
7. [ALTER TABLE, DROP COLUMN - Usunięcie kolumny 'aktywna'](#zapytanie-7)
8. [GRANT SELECT, INSERT - przyznanie użytkownikowi uprawnienia do odczytu i wstawiania danych w tabeli Promocje](#zapytanie-8)
9. [GRANT UPDATE - Pozwala użytkownikowi na modyfikację istniejących danych w tabeli Promocje](#zapytanie-9)
10. [GRANT DELETE -Pozwalenie użytkownikowi na usuwanie danych z tabeli Promocje](#zapytanie-10)
11. [REVOKE  - cofnięcie  uprawnień dla użytkownika dla tabeli Promocje](#zapytanie-11)
12. [DENY - zablokowanie uprawnień dla użytkownika do usuwania z tabeli Promocje](#zapytanie-12)
13. [PRIMARY KEY - Ustawienie kolumny 'promocja_id' jako klucz główny](#zapytanie-13)
14. [NOT NULL- Zmiana kolumny 'nazwa', aby była obowiązkowa i nie akceptowała wartości NULL](#zapytanie-14)
15. [CHECK - Dodanie constraint CHECK, aby zapewnić, że rabat nie może być mniejszy niż 0 i nie większy niż 100.](#zapytanie-15)
16. [UNIQUE - Zmiana kolumny 'nazwa', aby była unikalna. Oznacza to, że każda promocja będzie miała inną nazwę.](#zapytanie-16)
17. [DEFAULT - Ustawienie wartości domyślnej dla kolumny 'data_rozpoczecia', aby była ustawiona na dzisiejszą datę, jeśli użytkownik jej nie poda.](#zapytanie-17)
18. [INDEX - Stworzenie indeksu dla kolumny 'data_rozpoczecia', aby przyspieszyć wyszukiwanie promocji po dacie rozpoczęcia.](#zapytanie-18)
19. [TRUNCATE TABLE - Usunięcie wszystkich danych z tabel](#zapytanie-19)
20. [DROP TABLE - Całkowite usunięcie tabeli z bazy danych](#zapytanie-20)


zapytania i grupowanie

21. [SELECT,WHERE,LIKE - Wybierz wszystkich klientów z miasta Stalowa Wola](#zapytanie-21)
22. [BETWEEN - Wybór produktów z przedziału 300 do 800 zł](#zapytanie-22)
23. [WHERE IN - wyszukaj pracowników o imieniu Piotr lub Paweł](#zapytanie-23)
24. [WHERE,OR - wyszukaj pracowników o imieniu Piotr lub Paweł](#zapytanie-24)
25. [NOT EQUALS - wyszukaj wszystkie okna,które nie są z aluminium](#zapytanie-25)
26. [ORDER BY - Sortowanie wyników według daty zamówienia](#zapytanie-26)
27. [ORDER BY,TOP - Pobranie pięciu ostatnich wysłąnych zamówień](#zapytanie-27)
28. [DISTINCT - Wyszukaj wszystkie stanowiska w firmie](#zapytanie-26)
29. [GROUP BY,COUNT - Grupowanie zamówień według statusu zamówienia](#zapytanie-27)
30. [GROUP BY, HAVING - Wyszukaj klientów,którzy złożyli więcej niż jedno zamówienie](#zapytanie-28)
31. [GROUP BY,SUM - Obliczenie łącznej wartości zamówień](#zapytanie-29)
32. [GROUP BY,AVG,AS - Grupowanie produktów według typu i wyciąganie średniej ceny](#zapytanie-30)
33. [CASE - Dodanie kolumny, która kategoryzuje rabaty na "Wysoki" lub "Niski"](#zapytanie-31)
34. [MIN,MAX - Wybranie najwcześniejszej i najpóźniejszje daty zamówienia w tabeli](#zapytanie-32)

łączenie tabel

35. [INNER JOIN -pobranie listy klientów](#zapytanie-41)
36. [LEFT JOIN - pobranie listy klientów](#zapytanie-42)
37. [RIGHT JOIN nowe](#zapytanie-43)
38. [FULL JOIN - pobranie listy klientów i zamówień](#zapytanie-44)
39. [CROSS JOIN - iloczyń kartezjański klientów i produktów](#zapytanie-45)
40. [SELF JOIN - lista produktów z tej samej kategorii](#zapytanie-46)
41. [NATURAL JOIN - automatyczne połączenie tabel](#zapytanie-47)
42. [LEFT JOIN,WHERE](#zapytanie-48)
---
### Zapytanie 1  
CREATE TABLE - Tworzenie nowej tabeli Promocje.(Tworzenie pozostałych tabel w pliku schema.sql tj:Klienci,Produkty,Okna,Drzwi,Pracownicy,Zamówienia,SzczegółyZamówienia)

```sql
CREATE TABLE Promocje (
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
GRANT SELECT, INSERT - przyznanie użytkownikowi uprawnienia do odczytu i wstawiania danych w tabeli Promocje 
```sql
GRANT SELECT, INSERT ON Promocje TO Uzytkownik;
```
### Zapytanie 9
GRANT UPDATE - Pozwala użytkownikowi na modyfikację istniejących danych w tabeli Promocje
```sql
GRANT UPDATE ON Promocje TO Uzytkownik;
```
### Zapytanie 10
GRANT DELETE -Pozwala użytkownikowi na usuwanie danych z tabeli Promocje 
```sql
GRANT DELETE ON Promocje TO Uzytkownik;
```

### Zapytanie 11
REVOKE  - cofnięcie  uprawnień dla użytkownika dla tabeli Promocje
 
```sql
REVOKE SELECT ON Promocje FROM Uzytkownik;

### Zapytanie 12
 DENY - zablokowanie uprawnień dla użytkownika do usuwania z tabeli Promocje
 
```sql
DENY DELETE ON dbo.Promocje TO user2;

```


### Zapytanie 13
PRIMARY KEY - Ustawienie kolumny 'promocja_id' jako klucz główny
```sql
ALTER TABLE Promocje
ADD CONSTRAINT PK_Promocje PRIMARY KEY (promocja_id);
```
### Zapytanie 14
NOT NULL- Zmiana kolumny 'nazwa', aby była obowiązkowa i nie akceptowała wartości NULL
```sql
ALTER TABLE Promocje
ALTER COLUMN nazwa NVARCHAR(100) NOT NULL;
```
### Zapytanie 15
CHECK - Dodajemy constraint CHECK, aby zapewnić, że rabat nie może być mniejszy niż 0 i nie większy niż 100.
```sql
ALTER TABLE Promocje
ADD CONSTRAINT CHK_Rabat CHECK (rabat >= 0 AND rabat <= 100);
```
### Zapytanie 16
UNIQUE - Zmiana kolumny 'nazwa', aby była unikalna. Oznacza to, że każda promocja będzie miała inną nazwę.
```sql
ALTER TABLE Promocje
ADD CONSTRAINT UQ_Nazwa UNIQUE (nazwa);
```
### Zapytanie 17
DEFAULT - Ustawienie wartości domyślnej dla kolumny 'data_rozpoczecia', aby była ustawiona na dzisiejszą datę, jeśli użytkownik jej nie poda.
```sql
ALTER TABLE Promocje
ADD CONSTRAINT DF_DataRozpoczecia DEFAULT GETDATE() FOR data_rozpoczecia;
```
### Zapytanie 18
INDEX - Stworzenie indeksu dla kolumny 'data_rozpoczecia', aby przyspieszyć wyszukiwanie promocji po dacie rozpoczęcia.
```sql
CREATE INDEX IX_DataRozpoczecia ON Promocje(data_rozpoczecia);
```
### Zapytanie 19
TRUNCATE TABLE - Usunięcie wszystkich danych z tabel
```sql
TRUNCATE TABLE Promocje;
```
### Zapytanie 20
DROP TABLE - Całkowite usunięcie tabeli z bazy danych
```sql
DROP TABLE Promocje;
```
### Zapytanie 21  
SELECT - Wybierz wszystkich klientów z miasta Stalowa Wola
```sql
SELECT *
FROM Klienci
WHERE adres LIKE '%Stalowa Wola%';
```
### Zapytanie 22 
BETWEEN - Wybór produktów z przedziału 300 do 800 zł
```sql
SELECT *
FROM Produkty
WHERE cena BETWEEN 300 AND 800;
```
### Zapytanie 23
WHERE IN - wyszukaj pracowników o imieniu Piotr lub Paweł
```sql
SELECT *
FROM Pracownicy
WHERE imie IN('Piotr','Paweł');
```
### Zapytanie 24
WHERE,OR - wyszukaj pracowników o imieniu Piotr lub Paweł
```sql
SELECT *
FROM Pracownicy
WHERE imie ='Piotr' OR imie='Paweł';
```

### Zapytanie 25
NOT EQUALS - 
```sql
SELECT *
FROM Okna WHERE material<>'aluminium'
```

### Zapytanie 26
ORDER BY - Sortowanie wyników według daty zamówienia
```sql
SELECT zamowienie_id, data_zamowienia, klient_id
FROM Zamowienia
ORDER BY data_zamowienia DESC;
```
### Zapytanie 27
ORDER BY,TOP - Pobranie pięciu ostatnich wysłanych zamówień
```sql
SELECT TOP 5 *
FROM Zamowienia
WHERE status = 'wysłane'
ORDER BY data_zamowienia DESC;
```
### Zapytanie 28
DISTINCT - Wyszukaj wszystkie stanowiska w firmie
```sql
SELECT DISTINCT stanowisko
FROM Pracownicy;
```
### Zapytanie 29
GROUP BY,COUNT - Grupowanie zamówień według statusu zamówienia
```sql
SELECT status, COUNT(*) AS liczba_zamowien
FROM Zamowienia
GROUP BY status;
```

### Zapytanie 30
GROUP BY, HAVING - Wyszukaj klientów,którzy złożyli więcej niż jedno zamówienie
```sql
SELECT klient_id, COUNT(zamowienie_id) AS liczba_zamowien
FROM Zamowienia
GROUP BY klient_id
HAVING COUNT(zamowienie_id) > 1;
```
### Zapytanie 31
GROUP BY,SUM - Obliczenie łącznej wartości zamówień
```sql
SELECT zamowienie_id, SUM(ilosc * cena) AS LacznaWartosc
FROM SzczegolyZamowienia
GROUP BY zamowienie_id;

```
### Zapytanie 32
GROUP BY,AVG, AS - Grupowanie produktów według typu i wyciąganie średniej ceny 
```sql
SELECT nazwa, AVG(cena) AS srednia_cena
FROM Produkty
GROUP BY nazwa
```
### Zapytanie 33
CASE - Dodanie kolumny, która kategoryzuje rabaty na "Wysoki" lub "Niski"
```sql
SELECT nazwa, 
       CASE 
           WHEN rabat >= 50 THEN 'Wysoki rabat'
           ELSE 'Niski rabat'
       END AS KategoriaRabatu
FROM Promocje;
```


### Zapytanie 34
MIN,MAX - Wybranie najwcześniejszej i najpóźniejszej daty zamówienia w tabeli
```sql
SELECT MIN(data_zamowienia) AS NajwczesniejszeZamowienie, MAX(data_zamowienia) AS NajpóźniejszeZamowienie
FROM Zamowienia;
```

### Zapytanie 35
INNER JOIN - Pobranie wierszy, które mają dopasowanie w obu tabelach.
Otrzymamy listę klientów wraz z datami ich zamówień. Pojawią się tylko ci klienci, którzy mają złożone zamówienia.
```sql
SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_zamowienia
FROM Klienci
INNER JOIN Zamowienia ON Klienci.klient_id = Zamowienia.klient_id;
```

### Zapytanie 36
LEFT JOIN -Pobranie wszystkich wierszy z lewej tabeli i dopasowanych z prawej.
Pobiera wszystkie wiersze z tabeli po lewej stronie, a dane z prawej tabeli tylko wtedy, gdy istnieje dopasowanie. W przeciwnym razie zwraca NULL.
Otrzymamy listę wszystkich klientów. Jeśli dany klient nie ma zamówień, kolumna data_zamowienia będzie zawierała wartość NULL
```sql
SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_zamowienia
FROM Klienci
LEFT JOIN Zamowienia ON Klienci.klient_id = Zamowienia.klient_id;
```
### Zapytanie 37
RIGHT JOIN - Pobranie wszystkich wierszy z prawej tabeli i dopasowanych z lewej.
Pobiera wszystkie wiersze z tabeli po prawej stronie, a dane z lewej tabeli tylko wtedy, gdy istnieje dopasowanie. W przeciwnym razie zwraca NULL.
Wynik: Otrzymasz listę wszystkich szczegółów zamówień. Jeśli w zamówieniu użyto produktu, którego nie ma w tabeli Produkty, kolumna nazwa zwróci NULL.
```sql
SELECT Produkty.nazwa, SzczegolyZamowienia.ilosc
FROM Produkty
RIGHT JOIN SzczegolyZamowienia ON Produkty.produkt_id = SzczegolyZamowienia.produkt_id;
```

### Zapytanie 38
FULL JOIN-Pobranie wszystkich wierszy z obu tabel, łącznie z niedopasowanymi.
Pobiera wszystkie wiersze z obu tabel. Jeśli wiersz nie ma dopasowania, zwraca NULL dla brakujących danych.
Otrzymamy listę wszystkich klientów i wszystkich zamówień. Klienci bez zamówień i zamówienia bez klientów będą miały NULL w brakujących kolumnach.
```sql
SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_zamowienia
FROM Klienci
FULL JOIN Zamowienia ON Klienci.klient_id = Zamowienia.klient_id;
```

### Zapytanie 39
CROSS JOIN-pobieranie każdej możliwej kombinacji klientów i produktów
Tworzy iloczyn kartezjański obu tabel – łączy każdy wiersz z każdej tabeli ze sobą.
Otrzymasz każdą możliwą kombinację klientów i produktów. Jeśli masz 10 klientów i 5 produktów, wynik zawiera 50 wierszy
```sql
SELECT Klienci.imie, Produkty.nazwa
FROM Klienci
CROSS JOIN Produkty;
```

### Zapytanie 40
SELF JOIN
Opis: Łączy tabelę z samą sobą.
Wynik: Otrzymasz listę produktów z tej samej kategorii (ale różnych), sparowanych ze sobą.

```sql
SELECT p1.nazwa AS Produkt, p2.nazwa AS PowiazanyProdukt
FROM Produkty p1
INNER JOIN Produkty p2 ON p1.kategoria = p2.kategoria AND p1.produkt_id <> p2.produkt_id;
```
### Zapytanie 41
NATURAL JOIN Automatycznie łączy tabele po kolumnach o takich samych nazwach.
Opis: Automatycznie łączy tabele na podstawie wspólnych kolumn o tej samej nazwie i typie danych.
Wynik: Zwraca wiersze z obu tabel, które mają wspólną kolumnę produkt_id. Jeśli nie ma wspólnych danych, wynik będzie pusty.

```sql
SELECT *
FROM Produkty
NATURAL JOIN SzczegolyZamowienia;
```
### Zapytanie 42
LEFT JOIN z filtrem - Pobranie wszystkich wierszy z lewej tabeli i filtrowanie tylko tych bez dopasowania.
Pobiera wiersze z lewej tabeli, ale ogranicza wyniki do tych, które nie mają dopasowania w prawej tabeli.
Otrzymamy liste klientów, którzy nie złożyli zamówień.
```sql
SELECT Klienci.imie, Klienci.nazwisko
FROM Klienci
LEFT JOIN Zamowienia ON Klienci.klient_id = Zamowienia.klient_id
WHERE Zamowienia.zamowienie_id IS NULL;
```

### Zapytanie 43 
INNER JOIN - Łączenie wielu tabel w jednym zapytaniu.
Otrzymamy listę zamówień z nazwami klientów i produktów, które zostały zamówione.
```sql
SELECT Zamowienia.zamowienie_id, Klienci.imie, Klienci.nazwisko, Produkty.nazwa
FROM Zamowienia
INNER JOIN Klienci ON Zamowienia.klient_id = Klienci.klient_id
INNER JOIN SzczegolyZamowienia ON Zamowienia.zamowienie_id = SzczegolyZamowienia.zamowienie_id
INNER JOIN Produkty ON SzczegolyZamowienia.produkt_id = Produkty.produkt_id;
```

### Zapytanie 44
ANTI JOIN (wykorzystanie NOT IN) Pobranie wierszy, które nie mają dopasowania w innej tabeli
Otrzymamy wiersze z jednej tabeli, które nie mają dopasowania w drugiej tabeli.
czyli np. liste produktów, które nigdy nie zostały sprzedane.

```sql
SELECT Produkty.nazwa
FROM Produkty
WHERE produkt_id NOT IN (SELECT produkt_id FROM SzczegolyZamowienia);
```
### Zapytanie 45
SELF JOIN - Używane do połączenia tabeli z samą sobą.
np. do analizy hierarchii,pobieramy pary promocji, gdzie jedna kończy się przed rozpoczęciem drugiej.
```sql
SELECT P1.promocja_id, P1.nazwa AS Nazwa1, P2.nazwa AS Nazwa2
FROM Promocje P1
JOIN Promocje P2
ON P1.data_zakonczenia < P2.data_rozpoczecia;

```
### Zapytanie 46
JOIN z warunkiem nierówności – Łączenie tabel na podstawie warunku „mniejszy niż”.
Łączy rekordy na podstawie warunku nierówności,łączymy promocje z zamówieniami, gdzie cena zamówienia jest mniejsza niż wartość rabatu pomnożona przez 100 
```sql
SELECT P.promocja_id, P.nazwa, Z.zamowienie_id, Z.cena
FROM Promocje P
JOIN Zamowienia Z
ON Z.cena < P.rabat * 100;

```

