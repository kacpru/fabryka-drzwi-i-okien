## Lista zapytań

1. [SELECT - Wybierz wszystkich klientów z miasta Stalowa Wola](#zapytanie-1)
2. [GROUP BY - Grupowanie zamówień według statusu zamówienia](#zapytanie-2)
3. [Grupowanie i filtrowanie grup przy użyciu HAVING](#zapytanie-3)
4. [Sortowanie wyników według daty zamówienia](#zapytanie-4)
5. [Pobranie pięciu ostatnich zamówień dla klienta](#zapytanie-5)
6. [Wyciąganie unikalnych miast, w których znajdują się klienci](#zapytanie-6)
7. [Wybór produktów droższych niż 100 zł](#zapytanie-7)
8. [Grupowanie pracowników według oddziału](#zapytanie-8)
9. [Znalezienie klientów z co najmniej jednym zamówieniem](#zapytanie-9)
10. [Grupowanie produktów według typu i wyciąganie średniej ceny](#zapytanie-10)

---

### Zapytanie 1  
SELECT - Wybierz wszystkich klientów z miasta Stalowa Wola
```sql
SELECT * 
FROM Klienci
WHERE miasto = 'Stalowa Wola';
```
### Zapytanie 2
GROUP BY - Grupowanie zamówień według statusu zamówienia
```sql
SELECT status, COUNT(*) AS liczba_zamowien
FROM Zamowienia
GROUP BY status;
```

### Zapytanie 3:
```sql
SELECT klient_id, COUNT(zamowienie_id) AS liczba_zamowien
FROM Zamowienia
GROUP BY klient_id
HAVING COUNT(zamowienie_id) > 1;
```
### Zapytanie 4
```sql
SELECT zamowienie_id, data_zamowienia, klient_id
FROM Zamowienia
ORDER BY data_zamowienia DESC;
```
### Zapytanie 5
```sql
SELECT TOP 5 zamowienie_id, data_zamowienia, status
FROM Zamowienia
WHERE klient_id = 3
ORDER BY data_zamowienia DESC;
```
### Zapytanie 6
```sql
SELECT DISTINCT miasto
FROM Klienci;
```
### Zapytanie 7 Wybór produktów droższych niż 100 zł
```sql
SELECT produkt_id, nazwa, cena
FROM Produkty
WHERE cena > 100
ORDER BY cena ASC;
```
### Zapytanie 8
--Grupowanie pracowników według oddziału
```sql
SELECT oddzial_id, COUNT(pracownik_id) AS liczba_pracownikow
FROM Pracownicy
GROUP BY oddzial_id
ORDER BY liczba_pracownikow DESC;
```

### Zapytanie 9
Znalezienie klientów z co najmniej jednym zamówieniem
```sql
SELECT DISTINCT k.klient_id, k.imie, k.nazwisko
FROM Klienci k
JOIN Zamowienia z ON k.klient_id = z.klient_id
ORDER BY k.nazwisko ASC;
```
### Zapytanie 10:  Grupowanie produktów według typu i wyciąganie średniej ceny 
```sql
SELECT typ, AVG(cena) AS srednia_cena
FROM Produkty
GROUP BY typ
HAVING AVG(cena) > 50;
```
