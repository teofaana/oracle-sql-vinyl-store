create table categorii_muzicale (
    id_gen number(3) primary key,
    nume_gen varchar2(30) not null,
    id_gen_parinte number(3) references categorii_muzicale(id_gen)
);

create table lista_artisti (
    id_artisti number(3) primary key,
    nume_artist varchar2(60) not null,
    tara_origine varchar2(25),
    an_infiintare number(4)
);

create table catalog_viniluri (
    id_vinil number(4) primary key,
    titlu_album varchar2(60) not null,
    an_lansare number(4),
    pret number(6),
    stoc number(3),
    stare varchar2(20),
    id_artisti number(3),
    id_gen number(3),
    foreign key (id_artisti) references lista_artisti(id_artisti),
    foreign key (id_gen) references categorii_muzicale(id_gen)
);

create table clienti_shop (
    id_client number(4) primary key,
    nume varchar2(30) not null,
    prenume varchar2(30),
    email varchar2(50),
    oras varchar2(25)
);

create table comenzi_shop (
    id_comanda number(5) primary key,
    data_comanda date,
    status varchar2(20),
    id_client number(4),
    foreign key (id_client) references clienti_shop(id_client)
);

create table articole_comanda (
    id_detaliu number(5) primary key,
    id_comanda number(5),
    id_vinil number(4),
    cantitate number(3),
    pret_vanzare number(6),
    foreign key (id_comanda) references comenzi_shop(id_comanda),
    foreign key (id_vinil) references catalog_viniluri(id_vinil)
);

insert into categorii_muzicale values (10, 'Rock', null);
insert into categorii_muzicale values (20, 'Pop', null);
insert into categorii_muzicale values (30, 'Hip Hop', null);
insert into categorii_muzicale values (40, 'RnB', null);
insert into categorii_muzicale values (50, 'Reggae', null);
insert into categorii_muzicale values (11, 'Classic Rock', 10);
insert into categorii_muzicale values (12, 'Alternative Rock', 10);
insert into categorii_muzicale values (21, 'Pop-Rock', 20);
insert into categorii_muzicale values (31, 'Rap', 30);
insert into categorii_muzicale values (41, 'Motown Soul', 40);

insert into lista_artisti values (101, 'The Beatles', 'UK', 1960);
insert into lista_artisti values (102, 'Red Hot Chili Peppers', 'USA', 1983);
insert into lista_artisti values (103, 'Olivia Rodrigo', 'USA', 2021);
insert into lista_artisti values (104, 'Prince', 'USA', 1975);
insert into lista_artisti values (105, 'Kendrick Lamar', 'USA', 2004);
insert into lista_artisti values (106, 'Nicki Minaj', 'USA', 2004);
insert into lista_artisti values (107, 'Marvin Gaye', 'USA', 1950);
insert into lista_artisti values (108, 'Johnny Osbourne', 'Jamaica', 1969);
insert into lista_artisti values (109, 'The Jam', 'UK', 1972);
insert into lista_artisti values (110, 'Ram Jam', 'USA', 1977);

insert into catalog_viniluri values (501, 'Abbey Road', 1969, 130, 5, 'Mint', 101, 11);
insert into catalog_viniluri values (502, 'Stadium Arcadium', 2006, 200, 3, 'Nou', 102, 12);
insert into catalog_viniluri values (503, 'SOUR', 2021, 140, 10, 'Nou', 103, 21);
insert into catalog_viniluri values (504, 'Purple Rain', 1984, 110, 8, 'Nou', 104, 21);
insert into catalog_viniluri values (505, 'Good Kid, M.A.A.D City', 2012, 150, 6, 'Nou', 105, 31);
insert into catalog_viniluri values (506, 'Pink Friday', 2010, 160, 4, 'Nou', 106, 31);
insert into catalog_viniluri values (507, 'United', 1967, 185, 2, 'Second-Hand', 107, 41);
insert into catalog_viniluri values (508, 'Never Stop Fighting', 1980, 120, 5, 'Nou', 108, 50);
insert into catalog_viniluri values (509, 'In The City', 1977, 100, 4, 'Second-Hand', 109, 12);
insert into catalog_viniluri values (510, 'Ram Jam', 1977, 90, 7, 'Second-Hand', 110, 11);

insert into clienti_shop values (1, 'Popescu', 'Andrei', 'andrei.pop@email.com', 'Bucuresti');
insert into clienti_shop values (2, 'Ionescu', 'Maria', 'maria.ion@email.com', 'Cluj-Napoca');
insert into clienti_shop values (3, 'Georgescu', 'Vlad', 'vlad.g@email.com', 'Timisoara');
insert into clienti_shop values (4, 'Dumitrescu', 'Elena', 'elena.d@email.com', 'Bucuresti');
insert into clienti_shop values (5, 'Radu', 'Mihai', 'mihai.radu@email.com', 'Brasov');
insert into clienti_shop values (6, 'Stancu', 'Ioana', 'ioana.st@email.com', 'Iasi');
insert into clienti_shop values (7, 'Munteanu', 'Alex', 'alex.m@email.com', 'Constanta');
insert into clienti_shop values (8, 'Vasilescu', 'Dan', 'dan.v@email.com', 'Bucuresti');
insert into clienti_shop values (9, 'Nistor', 'Diana', 'diana.n@email.com', 'Cluj-Napoca');
insert into clienti_shop values (10, 'Kovacs', 'Istvan', 'istvan.k@email.com', 'Oradea');

insert into comenzi_shop values (1001, to_date('01-10-2025', 'dd-mm-yyyy'), 'Livrata', 1);
insert into comenzi_shop values (1002, to_date('05-12-2025', 'dd-mm-yyyy'), 'Livrata', 2);
insert into comenzi_shop values (1003, to_date('10-06-2025', 'dd-mm-yyyy'), 'Expediata', 1);
insert into comenzi_shop values (1004, to_date('12-07-2025', 'dd-mm-yyyy'), 'In procesare', 3);
insert into comenzi_shop values (1005, to_date('15-08-2025', 'dd-mm-yyyy'), 'Anulata', 4);
insert into comenzi_shop values (1006, to_date('20-11-2025', 'dd-mm-yyyy'), 'Livrata', 5);
insert into comenzi_shop values (1007, to_date('21-10-2025', 'dd-mm-yyyy'), 'Livrata', 2);
insert into comenzi_shop values (1008, to_date('25-01-2025', 'dd-mm-yyyy'), 'In procesare', 6);
insert into comenzi_shop values (1009, to_date('28-03-2025', 'dd-mm-yyyy'), 'Expediata', 1);
insert into comenzi_shop values (1010, to_date('30-04-2025', 'dd-mm-yyyy'), 'Livrata', 7);

insert into articole_comanda values (1, 1001, 501, 1, 130);
insert into articole_comanda values (2, 1002, 503, 1, 140);
insert into articole_comanda values (3, 1003, 505, 1, 150);
insert into articole_comanda values (4, 1004, 506, 1, 160);
insert into articole_comanda values (5, 1005, 508, 1, 120);
insert into articole_comanda values (6, 1006, 504, 2, 110);
insert into articole_comanda values (7, 1007, 502, 1, 200);
insert into articole_comanda values (8, 1008, 510, 1, 90);
insert into articole_comanda values (9, 1009, 507, 1, 185);
insert into articole_comanda values (10, 1010, 509, 1, 100);

commit;

select id_vinil, titlu_album, pret 
from catalog_viniluri 
where pret between 100 and 150 
order by pret desc;

select nume, prenume, email 
from clienti_shop 
where upper(email) like 'A%';

select id_client, nume, oras 
from clienti_shop 
where oras in ('Bucuresti', 'Cluj-Napoca');

update catalog_viniluri 
set pret = pret + 5 
where stare = 'Nou';

alter table clienti_shop add telefon varchar2(15);

delete from articole_comanda 
where id_detaliu = 10;

select titlu_album, stare, pret 
from catalog_viniluri 
where stare = 'Second-Hand' and pret < 100;

select titlu_album, pret as pret_vechi, pret * 0.9 as pret_promotional 
from catalog_viniluri;

select 'Artistul ' || nume_artist || ' este din ' || tara_origine as info_artist 
from lista_artisti;

update clienti_shop 
set oras = 'Bucuresti' 
where id_client = 10;

delete from clienti_shop 
where id_client = 9;

update clienti_shop 
set email = 'contact@email.com' 
where id_client = 8;

select v.titlu_album, a.nume_artist, v.pret 
from catalog_viniluri v 
inner join lista_artisti a on v.id_artisti = a.id_artisti;

select c.id_comanda, c.data_comanda, cl.nume, cl.prenume 
from comenzi_shop c 
inner join clienti_shop cl on c.id_client = cl.id_client;

select a.nume_artist, v.titlu_album 
from lista_artisti a 
left join catalog_viniluri v on a.id_artisti = v.id_artisti;

select g.nume_gen, v.titlu_album 
from categorii_muzicale g 
full outer join catalog_viniluri v on g.id_gen = v.id_gen;

select c.id_comanda, cl.nume, cl.prenume 
from comenzi_shop c 
right join clienti_shop cl on c.id_client = cl.id_client;

select ac.id_comanda, ac.cantitate, v.titlu_album 
from articole_comanda ac 
right join catalog_viniluri v on ac.id_vinil = v.id_vinil;

select cl.nume, cl.email, c.id_comanda, c.status 
from clienti_shop cl 
full outer join comenzi_shop c on cl.id_client = c.id_client;

select a.nume_artist, c.id_comanda 
from lista_artisti a 
inner join catalog_viniluri v on a.id_artisti = v.id_artisti 
inner join articole_comanda ac on v.id_vinil = ac.id_vinil 
inner join comenzi_shop c on ac.id_comanda = c.id_comanda;

select stare, count(*) as numar_total_viniluri 
from catalog_viniluri 
group by stare;

select an_lansare, avg(pret) as pret_mediu 
from catalog_viniluri 
group by an_lansare 
order by an_lansare desc;

select id_artisti, sum(pret * stoc) as valoare_totala_stoc 
from catalog_viniluri 
group by id_artisti;

select id_comanda, min(pret_vanzare) as cel_mai_ieftin, max(pret_vanzare) as cel_mai_scump 
from articole_comanda 
group by id_comanda;

select id_client, count(*) as numar_comenzi 
from comenzi_shop 
group by id_client 
having count(*) >= 2;

select tara_origine, min(an_infiintare) as cel_mai_vechi_an 
from lista_artisti 
group by tara_origine;

select nume_gen, id_gen, id_gen_parinte, level 
from categorii_muzicale 
start with id_gen_parinte is null 
connect by prior id_gen = id_gen_parinte;

select id_gen, nume_gen, level-1 as numar_superiori, sys_connect_by_path(nume_gen, '/') as cale_ierarhica 
from categorii_muzicale 
connect by prior id_gen = id_gen_parinte 
start with id_gen = 10;

select id_gen, nume_gen, id_gen_parinte, level 
from categorii_muzicale 
where id_gen in (11, 12) 
connect by prior id_gen = id_gen_parinte 
start with id_gen = 10;

select id_gen, nume_gen, id_gen_parinte, level 
from categorii_muzicale 
connect by id_gen = prior id_gen_parinte 
start with upper(nume_gen) like 'CLASSIC ROCK';

select id_gen, nume_gen, id_gen_parinte, level 
from categorii_muzicale 
where id_gen_parinte = (select id_gen_parinte from categorii_muzicale where upper(nume_gen) like 'CLASSIC ROCK') 
connect by prior id_gen = id_gen_parinte 
start with upper(nume_gen) like 'ROCK' 
order by level;

select id_gen, nume_gen, id_gen_parinte, level 
from categorii_muzicale 
where id_gen <> 11 
connect by prior id_gen = id_gen_parinte 
start with upper(nume_gen) like 'ROCK' 
order by level;

select titlu_album, pret, 
  case 
    when pret < 100 then 'Ieftin' 
    when pret between 100 and 150 then 'Mediu' 
    else 'Scump/Premium' 
  end as categorie_pret 
from catalog_viniluri;

select nume_artist, tara_origine, 
  decode(tara_origine, 
         'USA', 'Statele Unite', 
         'UK', 'Marea Britanie', 
         'Jamaica', 'Jamaica', 
         'International') as tara_ro 
from lista_artisti;

select titlu_album, an_lansare, pret, 
  case 
    when an_lansare < 2000 then pret * 0.8 
    else pret 
  end as pret_promotional 
from catalog_viniluri;

select id_comanda, status, 
  decode(status, 
         'In procesare', 1, 
         'Expediata', 2, 
         'Livrata', 3, 
         'Anulata', 0, 
         99) as cod_prioritate 
from comenzi_shop;

select an_lansare as an_eveniment from catalog_viniluri 
union 
select an_infiintare from lista_artisti;

select id_client from clienti_shop where oras = 'Bucuresti' 
intersect 
select id_client from comenzi_shop;

select id_artisti from lista_artisti 
minus 
select id_artisti from catalog_viniluri where pret > 180;