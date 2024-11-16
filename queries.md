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
24. [ORDER BY - Sortowanie wyników według daty zamówienia](#zapytanie-24)
25. [ORDER BY,TOP - Pobranie pięciu ostatnich wysłąnych zamówień](#zapytanie-25)
26. [DISTINCT - Wyszukaj wszystkie stanowiska w firmie](#zapytanie-26)
27. [GROUP BY,COUNT - Grupowanie zamówień według statusu zamówienia](#zapytanie-27)
28. [GROUP BY, HAVING - Wyszukaj klientów,którzy złożyli więcej niż jedno zamówienie](#zapytanie-28)
29. [GROUP BY,SUM - Obliczenie łącznej wartości zamówień](#zapytanie-29)
30. [GROUP BY,AVG,AS - Grupowanie produktów według typu i wyciąganie średniej ceny](#zapytanie-30)
31. [CASE - Dodanie kolumny, która kategoryzuje rabaty na "Wysoki" lub "Niski"](#zapytanie-31)
32. [MIN,MAX - Wybranie najwcześniejszej i najpóźniejszje daty zamówienia w tabeli](#zapytanie-32)
33. [](#zapytanie-33)
34. [](#zapytanie-34)
35. [](#zapytanie-35)
36. [](#zapytanie-36)
37. [](#zapytanie-37)
38. [](#zapytanie-38)
39. [](#zapytanie-39)
40. [](#zapytanie-40)

łączenie tabel

41. [INNER JOIN -pobranie listy klientów](#zapytanie-41)
42. [LEFT JOIN - pobranie listy klientów](#zapytanie-42)
43. [RIGHT JOIN nowe](#zapytanie-43)
44. [FULL JOIN - pobranie listy klientów i zamówień](#zapytanie-44)
45. [CROSS JOIN - iloczyń kartezjański klientów i produktów](#zapytanie-45)
46. [SELF JOIN - lista produktów z tej samej kategorii](#zapytanie-46)
47. [NATURAL JOIN - automatyczne połączenie tabel](#zapytanie-47)
48. [LEFT JOIN,WHERE](#zapytanie-48)
49. [](#zapytanie-49)
50. [](#zapytanie-50)
51. [](#zapytanie-51)
52. [](#zapytanie-52)
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

### Zapytanie 16  
SELECT - Wybierz wszystkich klientów z miasta Stalowa Wola
```sql
SELECT *
FROM Klienci
WHERE adres LIKE '%Stalowa Wola%';
```
### Zapytanie 17 
BETWEEN - Wybór produktów z przedziału 300 do 800 zł
```sql
SELECT *
FROM Produkty
WHERE cena BETWEEN 300 AND 800;
```
### Zapytanie 18
WHERE IN - wyszukaj pracowników o imieniu Piotr lub Paweł
```sql
SELECT *
FROM Pracownicy
WHERE imie IN('Piotr','Paweł');
```
```
### Zapytanie 19
ORDER BY - Sortowanie wyników według daty zamówienia
```sql
SELECT zamowienie_id, data_zamowienia, klient_id
FROM Zamowienia
ORDER BY data_zamowienia DESC;
```
### Zapytanie 20
ORDER BY,TOP - Pobranie pięciu ostatnich wysłanych zamówień
```sql
SELECT TOP 5 *
FROM Zamowienia
WHERE status = 'wysłane'
ORDER BY data_zamowienia DESC;
```
### Zapytanie 21
DISTINCT - Wyszukaj wszystkie stanowiska w firmie
```sql
SELECT DISTINCT stanowisko
FROM Pracownicy;
```
### Zapytanie 22
GROUP BY - Grupowanie zamówień według statusu zamówienia
```sql
SELECT status, COUNT(*) AS liczba_zamowien
FROM Zamowienia
GROUP BY status;
```

### Zapytanie 23
GROUP BY, HAVING - Wyszukaj klientów,którzy złożyli więcej niż jedno zamówienie
```sql
SELECT klient_id, COUNT(zamowienie_id) AS liczba_zamowien
FROM Zamowienia
GROUP BY klient_id
HAVING COUNT(zamowienie_id) > 1;

### Zapytanie 24
GROUP BY,SUM - Obliczenie łącznej wartości zamówień
```sql
SELECT zamowienie_id, SUM(ilosc * cena) AS LacznaWartosc
FROM SzczegolyZamowienia
GROUP BY zamowienie_id;

```
### Zapytanie 25
GROUP BY,AVG, AS - Grupowanie produktów według typu i wyciąganie średniej ceny 
```sql
SELECT nazwa, AVG(cena) AS srednia_cena
FROM Produkty
GROUP BY nazwa
```
### Zapytanie 25
CASE - Dodanie kolumny, która kategoryzuje rabaty na "Wysoki" lub "Niski"
```sql
SELECT nazwa, 
       CASE 
           WHEN rabat >= 50 THEN 'Wysoki rabat'
           ELSE 'Niski rabat'
       END AS KategoriaRabatu
FROM Promocje;

```
MIN,MAX - Wybranie najwcześniejszej i najpóźniejszje daty zamówienia w tabeli
### Zapytanie 25
MIN,MAX - Wybranie najwcześniejszej i najpóźniejszje daty zamówienia w tabeli
```sql
SELECT MIN(data_zamowienia) AS NajwczesniejszeZamowienie, MAX(data_zamowienia) AS NajpóźniejszeZamowienie
FROM Zamowienia;

```






### Zapytanie 26
INNER JOIN - Pobranie wierszy, które mają dopasowanie w obu tabelach.
Otrzymamy listę klientów wraz z datami ich zamówień. Pojawią się tylko ci klienci, którzy mają złożone zamówienia.
```sql
SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_zamowienia
FROM Klienci
INNER JOIN Zamowienia ON Klienci.klient_id = Zamowienia.klient_id;
```
### Zapytanie 27
LEFT JOIN (LEFT OUTER JOIN)
Pobiera wszystkie wiersze z tabeli po lewej stronie, a dane z prawej tabeli tylko wtedy, gdy istnieje dopasowanie. W przeciwnym razie zwraca NULL.
Otrzymasz listę wszystkich klientów. Jeśli dany klient nie ma zamówień, kolumna data_zamowienia będzie zawierała wartość NULL
```sql
SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_zamowienia
FROM Klienci
LEFT JOIN Zamowienia ON Klienci.klient_id = Zamowienia.klient_id;
```
### Zapytanie 28
RIGHT JOIN (RIGHT OUTER JOIN)
Opis: Pobiera wszystkie wiersze z tabeli po prawej stronie, a dane z lewej tabeli tylko wtedy, gdy istnieje dopasowanie. W przeciwnym razie zwraca NULL.
Wynik: Otrzymasz listę wszystkich szczegółów zamówień. Jeśli w zamówieniu użyto produktu, którego nie ma w tabeli Produkty, kolumna nazwa zwróci NULL.

```sql
SELECT Produkty.nazwa, SzczegolyZamowienia.ilosc
FROM Produkty
RIGHT JOIN SzczegolyZamowienia ON Produkty.produkt_id = SzczegolyZamowienia.produkt_id;
```
### Zapytanie 29
FULL JOIN (FULL OUTER JOIN)
Opis: Pobiera wszystkie wiersze z obu tabel. Jeśli wiersz nie ma dopasowania, zwraca NULL dla brakujących danych.
Wynik: Otrzymasz listę wszystkich klientów i wszystkich zamówień. Klienci bez zamówień i zamówienia bez klientów będą miały NULL w brakujących kolumnach.

```sql
SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_zamowienia
FROM Klienci
FULL JOIN Zamowienia ON Klienci.klient_id = Zamowienia.klient_id;
```
### Zapytanie 30
CROSS JOIN
Opis: Tworzy iloczyn kartezjański obu tabel – łączy każdy wiersz z każdej tabeli ze sobą.
Wynik: Otrzymasz każdą możliwą kombinację klientów i produktów. Jeśli masz 10 klientów i 5 produktów, wynik zawiera 50 wierszy

```sql
SELECT Klienci.imie, Produkty.nazwa
FROM Klienci
CROSS JOIN Produkty;
```
### Zapytanie 30
SELF JOIN
Opis: Łączy tabelę z samą sobą.
Wynik: Otrzymasz listę produktów z tej samej kategorii (ale różnych), sparowanych ze sobą.

```sql
SELECT p1.nazwa AS Produkt, p2.nazwa AS PowiazanyProdukt
FROM Produkty p1
INNER JOIN Produkty p2 ON p1.kategoria = p2.kategoria AND p1.produkt_id <> p2.produkt_id;
```
### Zapytanie 31
NATURAL JOIN
Opis: Automatycznie łączy tabele na podstawie wspólnych kolumn o tej samej nazwie i typie danych.
Wynik: Zwraca wiersze z obu tabel, które mają wspólną kolumnę produkt_id. Jeśli nie ma wspólnych danych, wynik będzie pusty.

```sql
SELECT *
FROM Produkty
NATURAL JOIN SzczegolyZamowienia;
```
### Zapytanie 32
LEFT JOIN z filtrem
Opis: Pobiera wiersze z lewej tabeli, ale ogranicza wyniki do tych, które nie mają dopasowania w prawej tabeli.
Wynik: Lista klientów, którzy nie złożyli zamówień.

```sql

SELECT Klienci.imie, Klienci.nazwisko
FROM Klienci
LEFT JOIN Zamowienia ON Klienci.klient_id = Zamowienia.klient_id
WHERE Zamowienia.zamowienie_id IS NULL;
```
### Zapytanie 33
INNER JOIN z wieloma tabelami
Opis: Łączy trzy lub więcej tabel w jednym zapytaniu.
Wynik: Lista zamówień z nazwami klientów i produktów, które zostały zamówione.

```sql
SELECT Zamowienia.zamowienie_id, Klienci.imie, Klienci.nazwisko, Produkty.nazwa
FROM Zamowienia
INNER JOIN Klienci ON Zamowienia.klient_id = Klienci.klient_id
INNER JOIN SzczegolyZamowienia ON Zamowienia.zamowienie_id = SzczegolyZamowienia.zamowienie_id
INNER JOIN Produkty ON SzczegolyZamowienia.produkt_id = Produkty.produkt_id;
```
### Zapytanie 34
ANTI JOIN (wykorzystanie NOT IN)
Opis: Wyświetla wiersze z jednej tabeli, które nie mają dopasowania w drugiej tabeli.
Wynik: Lista produktów, które nigdy nie zostały sprzedane.

```sql
SELECT Produkty.nazwa
FROM Produkty
WHERE produkt_id NOT IN (SELECT produkt_id FROM SzczegolyZamowienia);
```
### Zapytanie 
SELF JOIN - Używane do połączenia tabeli z samą sobą, np. do analizy hierarchii,pobieramy pary promocji, gdzie jedna kończy się przed rozpoczęciem drugiej.
```sql
SELECT P1.promocja_id, P1.nazwa AS Nazwa1, P2.nazwa AS Nazwa2
FROM Promocje P1
JOIN Promocje P2
ON P1.data_zakonczenia < P2.data_rozpoczecia;

```
### Zapytanie 
Łączy rekordy na podstawie warunku nierówności,Łączymy promocje z zamówieniami, gdzie cena zamówienia jest mniejsza niż wartość rabatu pomnożona przez 100 
```sql
SELECT P.promocja_id, P.nazwa, Z.zamowienie_id, Z.cena
FROM Promocje P
JOIN Zamowienia Z
ON Z.cena < P.rabat * 100;

```
### Zapytanie 9
1. Podzapytanie jednokolumnowe
Podzapytanie, które zwraca pojedynczą kolumnę i jest używane w klauzuli WHERE:
Wyjaśnienie: To zapytanie używa podzapytania jednokolumnowego w klauzuli WHERE, aby porównać rabat w tabeli Zamowienia z średnim rabatem przypisanym do klienta o klient_id = 1.
```sql
-- Znajdź zamówienia, których rabat jest większy niż średni rabat dla zamówień klienta o ID = 1
SELECT zamowienie_id, rabat
FROM Zamowienia
WHERE rabat > (SELECT AVG(rabat) FROM Zamowienia WHERE klient_id = 1);
```
### Zapytanie 10
2. Podzapytanie wielokolumnowe
Podzapytanie, które zwraca więcej niż jedną kolumnę i może być używane z operatorem IN:
Wyjaśnienie: Podzapytanie zwraca dwie kolumny (rabat i data_zamowienia), a zapytanie główne filtruje wyniki na podstawie tej kombinacji
```sql


```
### Zapytanie 9

```sql

```
### Zapytanie 10

```sql

```
### Zapytanie 9

```sql

```
### Zapytanie 10

```sql

```
### Zapytanie 9

```sql

```
### Zapytanie 10

```sql

```
### Zapytanie 9

```sql

```
### Zapytanie 10

```sql

```
### Zapytanie 9

```sql

```
### Zapytanie 10

```sql

```
### Zapytanie 9

```sql

```
### Zapytanie 10

```sql

```
### Zapytanie 9

```sql

```
### Zapytanie 10

```sql

```
