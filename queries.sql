## Lista zapytań

1. [Wybierz wszystkich klientów z miasta Stalowa Wola](#zapytanie-1-wybierz-wszystkich-klientów-z-miasta-stalowa-wola)
2. [Grupowanie zamówień według statusu zamówienia](#zapytanie-2-grupowanie-zamówień-według-statusu-zamówienia)
3. [Grupowanie i filtrowanie grup przy użyciu HAVING](#zapytanie-3-grupowanie-i-filtrowanie-grup-przy-użyciu-having)
4. [Sortowanie wyników według daty zamówienia](#zapytanie-4-sortowanie-wyników-według-daty-zamówienia)
5. [Pobranie pięciu ostatnich zamówień dla klienta](#zapytanie-5-pobranie-pięciu-ostatnich-zamówień-dla-klienta)
6. [Wyciąganie unikalnych miast, w których znajdują się klienci](#zapytanie-6-wyciąganie-unikalnych-miast-w-których-znajdują-się-klienci)
7. [Wybór produktów droższych niż 100 zł](#zapytanie-7-wybór-produktów-droższych-niż-100-zł)
8. [Grupowanie pracowników według oddziału](#zapytanie-8-grupowanie-pracowników-według-oddziału)
9. [Znalezienie klientów z co najmniej jednym zamówieniem](#zapytanie-9-znalezienie-klientów-z-co-najmniej-jednym-zamówieniem)
10. [Grupowanie produktów według typu i wyciąganie średniej ceny](#zapytanie-10-grupowanie-produktów-według-typu-i-wyciąganie-średniej-ceny)

### Zapytanie 1: Wybierz wszystkich klientów z miasta Stalowa Wola

SELECT * 
FROM Klienci
WHERE miasto = 'Stalowa Wola';
