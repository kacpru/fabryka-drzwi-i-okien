## Lista zapytań

1. [Wybierz wszystkich klientów z miasta Stalowa Wola](#zapytanie-1)
2. [Grupowanie zamówień według statusu zamówienia](#zapytanie-2)
3. [Grupowanie i filtrowanie grup przy użyciu HAVING](#zapytanie-3)
4. [Sortowanie wyników według daty zamówienia](#zapytanie-4)
5. [Pobranie pięciu ostatnich zamówień dla klienta](#zapytanie-5)
6. [Wyciąganie unikalnych miast, w których znajdują się klienci](#zapytanie-6)
7. [Wybór produktów droższych niż 100 zł](#zapytanie-7)
8. [Grupowanie pracowników według oddziału](#zapytanie-8)
9. [Znalezienie klientów z co najmniej jednym zamówieniem](#zapytanie-9)
10. [Grupowanie produktów według typu i wyciąganie średniej ceny](#zapytanie-10)

---

### Zapytanie 1  [Wybierz wszystkich klientów z miasta Stalowa Wola]
SELECT * 
FROM Klienci
WHERE miasto = 'Stalowa Wola';

### Zapytanie 2
SELECT status, COUNT(*) AS liczba_zamowien
FROM Zamowienia
GROUP BY status;

### Zapytanie 3: 
SELECT klient_id, COUNT(zamowienie_id) AS liczba_zamowien
FROM Zamowienia
GROUP BY klient_id
HAVING COUNT(zamowienie_id) > 1;

### Zapytanie 4
SELECT zamowienie_id, data_zamowienia, klient_id
FROM Zamowienia
ORDER BY data_zamowienia DESC;

### Zapytanie 5
SELECT TOP 5 zamowienie_id, data_zamowienia, status
FROM Zamowienia
WHERE klient_id = 3
ORDER BY data_zamowienia DESC;

### Zapytanie 6
SELECT DISTINCT miasto
FROM Klienci;

### Zapytanie 7 Wybór produktów droższych niż 100 zł 
SELECT produkt_id, nazwa, cena
FROM Produkty
WHERE cena > 100
ORDER BY cena ASC;

### Zapytanie 8 Grupowanie pracowników według oddziału 
SELECT oddzial_id, COUNT(pracownik_id) AS liczba_pracownikow
FROM Pracownicy
GROUP BY oddzial_id
ORDER BY liczba_pracownikow DESC;

### Zapytanie 9:  Znalezienie klientów z co najmniej jednym zamówieniem 
SELECT DISTINCT k.klient_id, k.imie, k.nazwisko
FROM Klienci k
JOIN Zamowienia z ON k.klient_id = z.klient_id
ORDER BY k.nazwisko ASC;

### Zapytanie 10:  Grupowanie produktów według typu i wyciąganie średniej ceny 
SELECT typ, AVG(cena) AS srednia_cena
FROM Produkty
GROUP BY typ
HAVING AVG(cena) > 50;
