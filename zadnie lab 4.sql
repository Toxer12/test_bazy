select * from postac;
# zadanie 1
# Ctrl +/ dodanie kometarz
-- komentarz...
/* komnterz */
# Ctrl + d duplikacja lini

# lab 4 zad 1a
select * from postac 
where nazwa != 'Bjorn'
and rodzaj='wiking'
order by data_ur ASC
limit 2;
delete from postac 
where id_postaci=4;
delete from postac 
where id_postaci=5;

# lab 4 zad 1b
alter table postac drop primary key;
# pornlem 1 - istnieja klucze obce
# tabela walizka i statek
#usuwanie kluczy obcych
#alter table walizka drop foreign key
#walizka_ibfk_1;
#aby sprawdzic nazwy kluczy obcyh
show create table walizka;
alter table walizka drop foreign key
walizka_ibfk_1;
#problem 2 atrybut auto increment
alter table postac modify id_postaci int;
#drop primary key dziala

# lab zad 2a
# first wstawiamy kolumne jako pierwsza w tabeli
alter table postac add pesel char(11) first;
update postac set pesel=0;
alter table postac add primary key(pesel);
update postac set pesel='72819283718' + id_postaci;
select * from postac;

#lab4 zad 2b
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena');
insert into postac values ('12345678901','7','Gertruda NIesczera','syrena','0932-03-09','764',default,default);

#lab 4 zadanie 3a
update postac set statek='wodnik'
where nazwa like '%a%';
select * from statek;

#lab 4 zad 3b
update statek set max_ladownosc= max_ladownosc*0.7
where data_wodowania >= '0001-01-01'
and data_wodowania <= '0100-12-31';
#albo
where year(data_wodowania) between 0001 and 0100;
#lab 4 zad 4
#(a
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena','waz');
insert into postac values ('23456789012',3, 'loko', 'waz', '1520-04-09', '108',default,default);
#(b
show create table postac;
#opcja1 - like przenosi klucz glowny tylko struktura
create table marynarz like postac;
#dodanie danych
insert into marynarz select * from postac ;
#opcja2 - create as select struktura + dane bez klucza glownego
create table marynarz select * from postac;
select statek from postac;
select * from marynarz;
select * from postac;
#cw 5
create table kreatura select* from wikingowie.kreatura;
create table zasob select* from wikingowie.zasob;
create table ekwipunek select* from wikingowie.ekwipunek;
select * from kreatura;
select * from zasob where rodzaj ='jedzenie';
select * from ekwipunek;
# rep 5 zad 2 a
select * from kreatura where rodzaj !='wiedzma' and udzwig >='50';

#operator "rozny od"
# != lub <>
