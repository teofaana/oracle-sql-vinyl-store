

## Despre Proiect

Acest proiect consta in proiectarea si implementarea unei baze de date relationale in Oracle SQL pentru gestionarea activitatii unui magazin de discuri de vinil. Sistemul acopera intregul flux operational al magazinului: organizarea ierarhica a genurilor muzicale, evidenta artistilor si a catalogului de albume, gestionarea stocurilor si a preturilor, precum si inregistrarea clientilor si a comenzilor plasate.

---

## Arhitectura Bazei de Date

Baza de date este alcatuita din 6 tabele interconectate prin chei primare si externe, fiecare fiind populata cu seturi de date relevante:

1. **CATEGORII_MUZICALE**  
   Gestioneaza genurile si subgenurile muzicale (Rock, Classic Rock, Alternative Rock, Pop, Pop-Rock, Hip Hop, Rap, RnB, Motown Soul, Reggae). Tabela utilizeaza o relatie de auto-referentiere (`id_gen_parinte`) pentru a modela ierarhia dintre genurile principale si subgenuri.

2. **LISTA_ARTISTI**  
   Stocheaza informatii despre artisti si trupe (precum The Beatles, Red Hot Chili Peppers, Olivia Rodrigo, Prince, Kendrick Lamar, Marvin Gaye etc.), incluzand tara de origine si anul infiintarii.

3. **CATALOG_VINILURI**  
   Reprezinta tabela centrala a produselor si contine detalii despre fiecare album pe vinil: titlul albumului, anul lansarii, pretul, stocul disponibil, starea fizica a discului (`Mint`, `Nou`, `Second-Hand`), precum si legaturile catre artist si genul muzical.

4. **CLIENTI_SHOP**  
   Pastreaza baza de date a clientilor magazinului (nume, prenume, adresa de email, oras de provenienta si numar de telefon).

5. **COMENZI_SHOP**  
   Monitorizeaza comenzile plasate de clienti, data efectuarii tranzactiei si statusul curent al livrarii (`In procesare`, `Expediata`, `Livrata`, `Anulata`).

6. **ARTICOLE_COMANDA**  
   Tabela asociativa care detaliaza continutul fiecarei comenzi, facand legatura intre comenzi si vinilurile achizitionate, cantitatea comandata si pretul de vanzare.

---

## Functionalitati si Interogari Implementate

Proiectul include peste 30 de interogari si operatii SQL, impartite pe categorii de complexitate:

### 1. Operatii DDL si DML (12 operatii)
- **Definirea si modificarea structurii:** Crearea tabelelor cu constrangeri de integritate (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`) si extinderea structurii cu `ALTER TABLE` (adaugarea coloanei `telefon` in tabela clientilor).
- **Actualizarea si stergerea datelor (`UPDATE` & `DELETE`):** Scumpirea automata a vinilurilor noi, actualizarea datelor de contact si a orasului pentru clienti, eliminarea inregistrarilor din detalii comenzi sau clienti.
- **Filtrari si prelucrari (`SELECT`):** Filtrarea vinilurilor pe intervale de pret (`BETWEEN`), cautarea clientilor dupa sabloane de email (`LIKE`) si locatii (`IN`), aplicarea de reduceri procentuale calculate dinamic si formatarea textului prin concatenare (`||`).

### 2. Jonctiuni Relationale - JOINs (8 interogari)
- **INNER JOIN:** Asocierea albumelor cu artistii, corelarea comenzilor cu datele clientilor si realizarea unei jonctiuni complexe pe 4 tabele (`lista_artisti` -> `catalog_viniluri` -> `articole_comanda` -> `comenzi_shop`) pentru a identifica ce artisti au fost cumparati in fiecare comanda.
- **LEFT JOIN & RIGHT JOIN:** Identificarea artistilor fara albume in stoc, afisarea tuturor clientilor (inclusiv a celor care nu au plasat inca nicio comanda) si evidentierea vinilurilor din catalog care nu au fost vandute niciodata.
- **FULL OUTER JOIN:** Generarea unor rapoarte complete intre genurile muzicale si viniluri, respectiv intre baza de clienti si istoricul comenzilor.

### 3. Functii de Grup si Agregare (6 interogari)
- Analiza stocurilor si a vanzarilor folosind `COUNT`, `AVG`, `SUM`, `MIN`, `MAX` impreuna cu clauza `GROUP BY`:
  - Numarul total de viniluri grupate dupa stare (`Mint`, `Nou`, `Second-Hand`).
  - Pretul mediu al albumelor in functie de anul lansarii.
  - Valoarea financiara totala a stocului disponibil pentru fiecare artist (`SUM(pret * stoc)`).
  - Cel mai ieftin si cel mai scump produs din fiecare comanda.
  - Identificarea clientilor fideli (care au plasat cel putin 2 comenzi) folosind filtrarea agregata cu `HAVING`.
  - Determinarea celui mai vechi an de infiintare a unei trupe pentru fiecare tara de origine.

### 4. Interogari Ierarhice in Oracle SQL (6 interogari)
- Exploatarea structurii arborescente din tabela `categorii_muzicale` cu ajutorul clauzelor `START WITH` si `CONNECT BY PRIOR`:
  - Parcurgerea ierarhiei de sus in jos (de la genurile radacina catre subgenuri) si afisarea nivelului ierarhic (`LEVEL`).
  - Construirea caii complete a subgenurilor (ex: `/Rock/Classic Rock`) utilizand functia `SYS_CONNECT_BY_PATH`.
  - Parcurgerea inversa a arborelui (de jos in sus) pentru determinarea genului parinte.
  - Filtrarea subarborilor si excluderea conditionata a anumitor ramuri din ierarhie.

### 5. Expresii Conditionale - CASE si DECODE (4 interogari)
- Segmentarea catalogului de viniluri in categorii de pret (`Ieftin`, `Mediu`, `Scump/Premium`) prin expresia `CASE`.
- Traducerea codurilor tarilor de origine (`USA`, `UK`) in limba romana folosind functia `DECODE`.
- Aplicarea unui discount promotional de 20% exclusiv pentru albumele lansate inainte de anul 2000.
- Transformarea statusului comenzilor intr-un sistem numeric de prioritati pentru procesare.

### 6. Operatori pe Multimi (3 interogari)
- **UNION:** Crearea unei cronologii unice care reuneste anii de infiintare ai trupelor cu anii de lansare ai albumelor.
- **INTERSECT:** Identificarea clientilor din Bucuresti care au plasat efectiv comenzi in magazin.
- **MINUS:** Extragerea artistilor din baza de date care nu au albume cu preturi din categoria peste 180 lei.

