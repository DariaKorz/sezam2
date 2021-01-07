USE Dziennik_Hogwartu;

CREATE TABLE spis_uczniów_up (
id_ucznia int(20) NOT NULL,
imię varchar(50) NOT NULL,
drugie_imię varchar(50) DEFAULT NULL,
nazwisko varchar(50) NOT NULL,
płeć varchar(20) NOT NULL,
data_urodzenia date DEFAULT NULL,
dom varchar(10) NOT NULL,
ststus_krwi varchar(10) NOT NULL,
kolor_włosów varchar(10) DEFAULT NULL,
kolor_oczu varchar(10) DEFAULT NULL,
rozpoczęcie_nauki date NOT NULL,
PRIMARY KEY (id_ucznia)
);

CREATE TRIGGER przed_uczeń_up
BEFORE UPDATE ON spis_uczniów
FOR EACH ROW
INSERT INTO spis_uczniów_up
SET action = 'update', nazwisko = dawne_nazwisko,
changedat = NOW();

CREATE TABLE spis_profesorów_up (
id_profesora int(20) NOT NULL,
imię varchar(50) NOT NULL,
drugie_imię varchar(50) DEFAULT NULL,
nazwisko varchar(50) NOT NULL,
płeć varchar(20) NOT NULL,
dawny_dom varchar(10) NOT NULL,
ststus_krwi varchar(10) NOT NULL,
kolor_włosów varchar(10) DEFAULT NULL,
kolor_oczu varchar(10) DEFAULT NULL,
funkcja varchar(40) NOT NULL,
opiekun_domu varchar(12) DEFAULT NULL,
PRIMARY KEY (id_profesora)
);


CREATE TRIGGER przed_profesor_up
BEFORE UPDATE ON spis_profesorów
FOR EACH ROW
INSERT INTO spis_profesorów_up
SET action = 'update', nazwisko = dawne_nazwisko,
changedat = NOW();


DELIMITER //
CREATE PROCEDURE wszystkie_bagarze()
BEGIN
SELECT * FROM bagarze;
END //
CALL wszystkie_bagarze(); //


SELECT waga_walizki_kg,
IF(waga_walizki_kg>10, "ciężka walizka", "lekka walizka")
FROM bagarze;