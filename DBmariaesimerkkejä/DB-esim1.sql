CREATE USER python@localhost
 IDENTIFIED BY 'python'

-- Poistetaan tietokanta, jos se on jo olemassa
       DROP DATABASE IF EXISTS ankkalinna;

 -- Luodaan paikallinen käyttäjä "python"
 CREATE USER patrivar@localhost IDENTIFIED BY 'python';

 -- Luodaan ankkalinnatietokanta
create database ankkalinna;
use ankkalinna;

create table ankkalinnalainen(
ID int not null auto_increment,
etunimi varchar(40),
sukunimi varchar(40),
primary key (id)
);

create table lemmikki(
ID int not null auto_increment,
nimi varchar(40),
primary key (id)
);

create table omistaa(
lemmikki_ID int,
ankkalinnalainen_ID int,
primary key (lemmikki_ID,ankkalinnalainen_ID),
foreign key (lemmikki_ID) references lemmikki(ID),
foreign key (ankkalinnalainen_ID) references ankkalinnalainen(ID)
);

insert into ankkalinnalainen(etunimi, sukunimi)
values("Aku", "Ankka"),("Roope", "Ankka"),
("Tupu", "Ankka"), ("Milla", "Magia"), ("Mikki", "Hiiri");

insert into lemmikki(nimi)
values ("Pulivari"), ("Pluto"), ("Korri");

insert into omistaa(lemmikki_ID, ankkalinnalainen_ID)
values(1,1),(1,3),(2,5),(3,4);

 -- Annetaan käyttäjälle luku- ja päivitysoikeudet tietokantaan ankkalinna
 GRAN SELECT, INSERT, UPDATE ON ankkalinna.* TO patrivar@localhost;
-- Kirjautuminen käyttäjällä (terminaali): mysql -u käyttäjänimi -p (-psalasana yhteen)

-- Hae lemmikki-taulun kaikki sisältö
SELECT * FROM lemmikki;