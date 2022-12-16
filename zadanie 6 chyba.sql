# lab 05 zad 3
# pkt 1
select datapozyskania from zasob;
select datapozyskania
,year(datapozyskania)
,monthe(datapozyskania)
,monthname(datapozyskania)
,day(datapozyskania)
from zasob;

select * from zasob where month(datapozyskania) in (7,8);

select * from zasob where rodzaj is not null order by waga;
#order by wiek ASC, rodzaj DESC;
# by 1 ASC, 2 DESC;

select * from kreatura order by dataUr limit 5;
select * from kreatura order by dataUr limit 5,5;

select rodzaj from kreatura where rodzaj regexp '^wi';

#zadanie 4
#pkt 1
select distinct rodzaj from zasob;
select distinct nazwa, datapozyskania from zasob;

#funkcja concat()
#pkt 2
select concat(nazwa,rodzaj) from kreatura where rodzaj regexp '^wi';

#pkt 3
select nazwa, ilosc *waga, datapozyskania from zasob
where year(datapozyskania) between 2000 and 2007;

#zad 5
#pkt 1

select nazwa
, (ilosc*waga)*0.7 as waga_netto
, (ilosc*waga)*0.3 as odpadki
from zasob where rodzaj='jedzenie';

#pkt 2
select * from zasob where rodzaj is null;

#pkt 3

select distinct rodzaj from zasob where nazwa regexp '^Ba' and where nazwa regexp 'os^';

#lekcja 6 zad 1
#pkt 1

select avg(waga) from kreatura where rodzaj= 'wiking';
#select sum() from kreatura
#select avg() from kreatura
#select max() from kreatura
#select min() from kreatura
#select count() from kreatura

#pkt 2
select rodzaj, avg(waga), count(*) from kreatura group by rodzaj;
#pkt 3
select avg(2022-year(dataUr)) as sredni_wiek from kreatura group by rodzaj;

#zad 2
#pkt 1
select rodzaj, sum(waga*ilosc) from zasob group by rodzaj;
select nazwa, rodzaj, sum(waga*ilosc) from zasob group by nazwa, rodzaj;
#pkt 2
select rodzaj, count(nazwa) from kreatura group by rodzaj having count(nazwa) >1;
select nazwa, avg(waga) from zasob where ilosc >=4 group by nazwa having avg(waga) > 10;

select nazwa, avg(waga) from zasob group by nazwa having avg(waga) > 10 and sum(ilosc)>=4;
#pkt 3
select rodzaj, count(nazwa) from zasob group by rodzaj having sum(ilosc)>1;
#zad 1 pkt 1
select * from kreatura, ekwipunek where kreatura.idkreatury=ekwipunek.idkreatury;


#lab 7
#zad 1 pkt 1
select w.nazwa, u.id_uczestnika, k.nazwa
count(u.id_uczestnika),
group_concat(k.nazwa separator ' | ')
from wyprawa w
join uczestnicy u on i.id_wyprawy=w.id_wyprawy
join kreatura k on k.idKreatury=u.id_uczestnika;

#zad 2 pkt 2
select w.nazwa, k.nazwa as Kierownik, ew.kolejnosc,
s.nazwa
from etapy_wyprawy ew
join sektor s on ew.sektor=s,id_sektora
join wyprawa w on w.id_wyprawy=ew.idWyprawy
join kreatura k on k.idKreatury=w.Kierownik
order by w.data_rozpoczecia desc, ew.kolejnosc asc;

#zad 3 pkt 1
select count(idSektora) from sektor;
select count(sektor) from etapy_wyprawy;

select nazwa, ifnull(waga, ' bez wagi') from kreatura;
select nazwa, if(waga is null, ' bez wagi', waga) from kreatura;

select s.nazwa, count(ew.sektor) ile_odwiedzin
from sektor s
left join etapy_wyprawy ew on s.id_sektora=ew.sektor
group by s.id_sektora;

#zad 3 pkt 2
select k.nazwa, if(count(u.id_uczestnika)>0, 'to bra udzial', 'nie bral udzialu')
from kreatura k
left join uczestnicy u on k.idKreatury=u.id_uczestnika
group by k.idKreatury;