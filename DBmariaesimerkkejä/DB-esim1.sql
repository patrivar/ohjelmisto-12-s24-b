CREATE USER patrivar@localhost
 IDENTIFIED BY 'python'

-- Poistetaan tietokanta, jos se on jo olemassa
       DROP DATABASE IF EXISTS ankkalinna;

 -- Luodaan paikallinen käyttäjä "python"
 CREATE USER patrivar@localhost IDENTIFIED BY 'python';

 -- Luodaan ankkalinnatietokanta
 CREATE DATABASE ankkalinna;

 -- Annetaan käyttäjälle luku- ja päivitysoikeudet tietokantaan ankkalinna
 GRAN SELECT, INSERT, UPDATE ON ankkalinna.* TO patrivar@localhost;