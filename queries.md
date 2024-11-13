## Lista zapytań

1. [SELECT,WHERE,LIKE - Wybierz wszystkich klientów z miasta Stalowa Wola](#zapytanie-1)
2. [BETWEEN - Wybór produktów z przedziału 300 do 800 zł](#zapytanie-2)
3. [WHERE IN - wyszukaj pracowników o imieniu Piotr lub Paweł](#zapytanie-3)
4. [ORDER BY - Sortowanie wyników według daty zamówienia](#zapytanie-4)
5. [ORDER BY,TOP - Pobranie pięciu ostatnich wysłąnych zamówień](#zapytanie-5)
6. [DISTINCT - Wyszukaj wszystkie stanowiska w firmie](#zapytanie-6)
7. [GROUP BY,COUNT - Grupowanie zamówień według statusu zamówienia](#zapytanie-7)
8. [GROUP BY, HAVING - Wyszukaj klientów,którzy złożyli więcej niż jedno zamówienie](#zapytanie-8)
9. [GROUP BY,SUM - Obliczenie łącznej wartości zamówień](#zapytanie-9)
10. [GROUP BY,AVG,AS - Grupowanie produktów według typu i wyciąganie średniej ceny](#zapytanie-10)


---

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
