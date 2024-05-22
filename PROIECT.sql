DROP TABLE CUMPARA;
DROP TABLE PRODUS_COMANDAT;
DROP TABLE COMANDA;
DROP TABLE STATUS_COMANDA;
DROP TABLE DEPOZIT_PRODUS_ITEM;
DROP TABLE DEPOZIT;
DROP TABLE imagine_produs;
DROP TABLE RECENZIE;
DROP TABLE produs_item;
DROP TABLE CULOARE;
DROP TABLE ADRESA_USER;
DROP TABLE utilizator;
DROP TABLE adresa;
DROP TABLE tara;
DROP TABLE optiune_marime;
DROP TABLE produs;
DROP TABLE produs_marime;
DROP TABLE produs_categorie;
DROP TABLE marime_categorie;
DROP TABLE PROMOTIE;


DROP SEQUENCE promotie_seq;
DROP SEQUENCE produs_cat_seq;
DROP SEQUENCE produs_seq;
DROP SEQUENCE marime_cat_seq;
DROP SEQUENCE optiune_marime_seq;
DROP SEQUENCE imag_prod_seq;
DROP SEQUENCE recenzie_seq;
DROP SEQUENCE produs_item_seq;
DROP SEQUENCE tara_seq;
DROP SEQUENCE adresa_seq;
DROP SEQUENCE user_seq;
DROP SEQUENCE depozit_seq;
DROP SEQUENCE comanda_seq;
DROP SEQUENCE status_comanda_seq;
DROP SEQUENCE culoare_seq;

CREATE SEQUENCE promotie_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE produs_cat_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE produs_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE marime_cat_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE optiune_marime_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE imag_prod_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE recenzie_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE produs_item_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE tara_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE adresa_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE user_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE depozit_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE comanda_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE status_comanda_seq  START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE culoare_seq  START WITH 1 INCREMENT BY 1;

--creez tabelul promotie
CREATE TABLE PROMOTIE (
    id_promotie INT DEFAULT promotie_seq.NEXTVAL PRIMARY KEY,
    nume_promotie VARCHAR(255),
    descriere VARCHAR(255),
    discount VARCHAR(5),
    data_incepere DATE,
    data_incheiere DATE,
    CONSTRAINT discount_check CHECK (REGEXP_LIKE(discount, '^\d{2}%$'))
);

INSERT INTO PROMOTIE (nume_promotie, descriere, discount, data_incepere, data_incheiere)
VALUES ('Reducere de Iarna', 'Reducere de sezon', '10%', TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-12-30', 'YYYY-MM-DD'));

INSERT INTO PROMOTIE (nume_promotie, descriere, discount, data_incepere, data_incheiere)
VALUES ('Black Friday', 'Reduceri de Black Friday', '25%', TO_DATE('2024-11-29', 'YYYY-MM-DD'), TO_DATE('2024-11-30', 'YYYY-MM-DD'));


INSERT INTO PROMOTIE (nume_promotie, descriere, discount, data_incepere, data_incheiere)
VALUES ('Vara Nebun?', 'Reduceri estivale', '15%', TO_DATE( '2024-07-01',  'YYYY-MM-DD'), TO_DATE('2024-08-31',  'YYYY-MM-DD'));

INSERT INTO PROMOTIE (nume_promotie, descriere, discount, data_incepere, data_incheiere)
VALUES ('Reduceri Aniversare', 'Reduceri cu ocazia anivers?rii magazinului', '20%', TO_DATE('2024-09-15',  'YYYY-MM-DD'), TO_DATE('2024-09-30',  'YYYY-MM-DD'));

INSERT INTO PROMOTIE (nume_promotie, descriere, discount, data_incepere, data_incheiere)
VALUES ('Back to School', 'Reduceri pentru începerea ?colii', '30%', TO_DATE('2024-09-01',  'YYYY-MM-DD'), TO_DATE('2024-09-15',  'YYYY-MM-DD'));

SELECT * FROM promotie;

--creez tabelul marime_categorie
CREATE TABLE MARIME_CATEGORIE (
    id_marime_cat INT DEFAULT marime_cat_seq.NEXTVAL PRIMARY KEY,
    nume VARCHAR(100) UNIQUE
);

INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Incaltaminte femei (EU)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Incaltaminte femei (US)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Incaltaminte barbati (EU)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Incaltaminte barbati (US)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Rochii (EU)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Rochii (US)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Tricouri (EU)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Tricouri (US)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Pantaloni (US)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Pantaloni (EU)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Jachete, Paltoane, Cardigane (EU)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Jachete, Paltoane, Cardigane (US)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Dimensiune Universala');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Costume (EU)');
INSERT INTO MARIME_CATEGORIE (nume) VALUES ('Costume (US)');

SELECT * FROM marime_categorie;

--creez tabelul produs_categorie
CREATE TABLE PRODUS_CATEGORIE (
    id_produs_cat INT DEFAULT produs_cat_seq.NEXTVAL PRIMARY KEY,
    nume_cat VARCHAR(255) NOT NULL,
    imagine_cat VARCHAR(255) NOT NULL,
    id_parinte_cat INT,
    id_promotie INT,
    CONSTRAINT fk_parinte_cat FOREIGN KEY (id_parinte_cat) REFERENCES produs_categorie(id_produs_cat),
    CONSTRAINT fk_promotie FOREIGN KEY (id_promotie) REFERENCES PROMOTIE(id_promotie)
);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat)
 VALUES ('Femei', '/images/femei.png', NULL);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat)
VALUES ('B?rba?i', '/images/barbati.png', NULL);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat)
VALUES ('Sport', '/images/haine_sport_femei.png', 1);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat, id_promotie)
VALUES ('Echipament fitness', '/images/echipament_fitness_femei.png', 3, 5);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat)
VALUES ('Rochii', '/images/rochie_femei.png', 1);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat, id_promotie)
VALUES ('Incaltaminte Femei', '/images/incaltaminte_femei.png', 1, 4);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat, id_promotie)
VALUES ('Jachete', '/images/jachete_barbati.png', 2, 1);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat, id_promotie)
VALUES ('Costume', '/images/costume_barbati.png', 2, 2);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat, id_promotie)
VALUES ('Tricouri', '/images/tricouri_barbati.png', 2, 3);

INSERT INTO produs_categorie(nume_cat, imagine_cat, id_parinte_cat)
VALUES ('Incaltaminte Barbati', '/images/incaltaminte_barbati.png', 2);

SELECT * FROM produs_categorie;

--creez tabelul produs_marime
CREATE TABLE PRODUS_MARIME(
    id_produs_cat INT,
    id_marime_cat INT,
    PRIMARY KEY (id_produs_cat, id_marime_cat),
    CONSTRAINT fk_id_prod_cat FOREIGN KEY (id_produs_cat) REFERENCES PRODUS_CATEGORIE(id_produs_cat),
    CONSTRAINT fk_id_marime_cat FOREIGN KEY (id_marime_cat) REFERENCES MARIME_CATEGORIE(id_marime_cat)
);

INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(4, 7);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(4, 8);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(4, 9);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(4, 10);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(5, 5);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(5, 6);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(6, 1);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(6, 2);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(7, 11);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(7, 12);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(3, 13);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(8, 14);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(8, 15);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(9, 7);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(9, 8);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(10, 3);
INSERT INTO PRODUS_MARIME(id_produs_cat, id_marime_cat) VALUES(10, 4);

SELECT * FROM produs_marime;

-- creez tabelul produs
CREATE TABLE PRODUS (
    id_produs INT DEFAULT produs_seq.NEXTVAL PRIMARY KEY,
    id_categorie INT,
    nume VARCHAR(500) NOT NULL,
    instructiuni_ingrijire VARCHAR(200),
    descriere VARCHAR(200),
    CONSTRAINT fk_id_cat FOREIGN KEY (id_categorie) REFERENCES produs_categorie(id_produs_cat)
);

INSERT INTO PRODUS (id_categorie, nume, instructiuni_ingrijire, descriere) 
VALUES (6, 'Balerini cu vârful ascu?it', '?tergere cu o lavet? umed?. A se feri de umiditate ?i temperaturi extreme.', 'Balerinii cu vârf ascu?it reprezint? o alegere elegant? ?i sofisticat? pentru orice garderob? feminin?.');

INSERT INTO PRODUS (id_categorie, nume, instructiuni_ingrijire, descriere) 
VALUES (10, 'Bocanci de iarn? pentru b?rba?i', '?tergere cu o lavet? umed?. A se feri de umiditate ?i temperaturi extreme.', 'Bocanci rezisten?i ?i c?lduro?i, potrivi?i pentru iarna grea. Design practic ?i materiale durabile.');

INSERT INTO PRODUS (id_categorie, nume, instructiuni_ingrijire, descriere) 
VALUES (5, 'Rochie de var? cu imprimeu floral', 'Se recomand? sp?larea manual? în ap? rece. A se usca la umbr?.', 'Rochie lejer? perfect? pentru zilele c?lduroase de var?. Material confortabil ?i u?or de purtat.');

INSERT INTO PRODUS (id_categorie, nume, instructiuni_ingrijire, descriere) 
VALUES (4, 'Pantaloni sport', 'Sp?lare la ma?in? cu ap? rece. A se c?lca la temperatur? sc?zut?.', 'Pantalonii sport sunt ideali pentru activit??ile fizice, oferind confort ?i libertate de mi?care.');

INSERT INTO PRODUS (id_categorie, nume, instructiuni_ingrijire, descriere) 
VALUES (3, 'Benzi de rezisten??', 'Po?i folosi o lavet? umed? sau ?erve?ele de cur??are pentru a ?terge suprafa?a benzii.', 'Benzi de rezisten?? sunt accesorii versatile pentru antrenamentul fizic, potrivite pentru o varietate de exerci?ii ?i activit??i sportive.');

INSERT INTO PRODUS (id_categorie, nume, instructiuni_ingrijire, descriere) 
VALUES (9, 'Tricou casual pentru b?rba?i', 'Sp?lare la ma?in? cu ap? rece. A se usca la umbr?.', 'Tricou confortabil ?i versatil, ideal pentru outfiturile de zi cu zi. Design clasic ?i materiale rezistente.');

INSERT INTO PRODUS (id_categorie, nume, instructiuni_ingrijire, descriere) 
VALUES (8, 'Costum elegant', 'În majoritatea cazurilor, costumul elegant trebuie cur??at la uscat pentru a men?ine forma ?i calitatea materialului.', 'Costumul elegant este o alegere clasic? ?i rafinat? pentru o varietate de evenimente formale ?i profesionale.');

INSERT INTO PRODUS (id_categorie, nume, instructiuni_ingrijire, descriere) 
VALUES (7, 'Jacheta de piele', 'Pentru a p?stra aspectul ?i calitatea jachetei de piele, este recomandat? cur??area regulat? folosind produse specializate pentru cur??area ?i îngrijirea pielii.', 'Jacheta de piele este o pies? vestimentar? iconic? ?i versatil?, potrivit? pentru a completa orice outfit casual sau urban.');

SELECT * FROM PRODUS;

--creez tabelul optiune_marime
CREATE TABLE OPTIUNE_MARIME (
    id_optiune_marime INT DEFAULT optiune_marime_seq.NEXTVAL PRIMARY KEY,
    id_marime_cat INT,
    marime_nume VARCHAR(50),
    ordonare INT,
    CONSTRAINT fk_marime_cat FOREIGN KEY (id_marime_cat) REFERENCES MARIME_CATEGORIE(id_marime_cat)
);

--Tricouri
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (7, '40', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (7, '44', 2);

INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (8, '30', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (8, '34', 2);

--Rochii
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (5, '32', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (5, '36', 2);

INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (6, '2', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (6, '6', 2); 

-- Pentru categorie "Incaltaminte barbati"
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (3, '38', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (3, '40', 2);

INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (4, '8', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (4, '10', 2);

-- Pentru categorie "Incaltaminte femei"
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (1, '36', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (1, '38', 2);

INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (2, '6', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (2, '8', 2);

--Pentru pantaloni
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (9, 'S', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (9, 'M', 2);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (2, 'L', 3);

INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (9, '36', 1);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (9, '40', 2);
INSERT INTO OPTIUNE_MARIME (id_marime_cat, marime_nume, ordonare) VALUES (2, '44', 3);

SELECT * FROM optiune_marime;

--creez tabelul tara
CREATE TABLE tara(
    id_tara INT DEFAULT tara_seq.NEXTVAL PRIMARY KEY,
    nume_tara VARCHAR(50) UNIQUE
);

INSERT INTO tara (nume_tara) VALUES ('România');
INSERT INTO tara (nume_tara) VALUES ('Statele Unite ale Americii');
INSERT INTO tara (nume_tara) VALUES ('Fran?a');
INSERT INTO tara (nume_tara) VALUES ('Germania');
INSERT INTO tara (nume_tara) VALUES ('Japonia');

SELECT * FROM tara;

-- creez tabelul adresa
CREATE TABLE adresa (
    id_adresa INT DEFAULT adresa_seq.NEXTVAL PRIMARY KEY,
    cod_postal VARCHAR(10) NOT NULL,
    oras VARCHAR(50) NOT NULL,
    adresa_linie1 VARCHAR(100) NOT NULL,
    adresa_linie2 VARCHAR(255),
    id_tara INT NOT NULL,
    CONSTRAINT fk_tara FOREIGN KEY (id_tara) REFERENCES tara(id_tara)
);

INSERT INTO adresa (cod_postal, oras, adresa_linie1, adresa_linie2, id_tara) 
VALUES ('061622', 'Bucure?ti', 'Sector 6, strada Orhideea', 'bloc 24, scara C', 1);

INSERT INTO adresa (cod_postal, oras, adresa_linie1, adresa_linie2, id_tara) 
VALUES ('12601', 'New York', '5 Taylor Street Poughkeepsie', NULL, 2);

INSERT INTO adresa (cod_postal, oras, adresa_linie1, adresa_linie2, id_tara) 
VALUES ('75010', 'Paris', '174 Quai de Jemmapes', NULL, 3);

INSERT INTO adresa (cod_postal, oras, adresa_linie1, adresa_linie2, id_tara) 
VALUES ('13629', 'Berlin', '95 Nonnendammallee', 'Spandau', 4);

INSERT INTO adresa (cod_postal, oras, adresa_linie1, adresa_linie2, id_tara) 
VALUES ('179-0072', 'Tokyo', 'Tagara High School, 1 Toshimaen-dori', NULL, 5);

INSERT INTO adresa (cod_postal, oras, adresa_linie1, adresa_linie2, id_tara) 
VALUES ('2077', 'New York', '11 Mildred Avenue, Hookhams Corner, cil of the Shire of Hornsby', NULL, 2);

INSERT INTO adresa (cod_postal, oras, adresa_linie1, adresa_linie2, id_tara) 
VALUES ('700036', 'Ia?i', 'Strada 14 Decembrie 1989 nr. 7', NULL, 1);

SELECT * FROM adresa;


--creez tabelul utilizator
CREATE TABLE utilizator (
    id_user INT DEFAULT user_seq.NEXTVAL PRIMARY KEY,
    adresa_email VARCHAR(255) UNIQUE,
    nr_telefon VARCHAR(20) UNIQUE,
    parola_hash VARCHAR(128) NOT NULL,
    CONSTRAINT check_nr_telefon_format CHECK (REGEXP_LIKE(nr_telefon, '^\+?[0-9]{1,3}[-. ]?[0-9]{1,4}([- .]?[0-9]{1,4}){1,4}$'))
);

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('john.doe@example.com', '+40700000000', '5f4dcc3b5aa765d61d8327deb882cf99');

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('jane_doe123@example.com', '+1 202-555-0165', '098f6bcd4621d373cade4e832627b4f6');

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('maria@gmail.com', '+44 20 7123 4567', 'c4ca4238a0b923820dcc509a6f75849b');

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('doina123@gmail.com', '+33 1 23 45 67 89', 'eccbc87e4b5ce2fe28308fd9f2a7baf3');

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('ELena.234@yahoo.com', '+49 30 12345678', 'a87ff679a2f3e71d9181a67b7542122c');

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('florina.alex@outlook.com', '+7 495 123-45-67', 'e4da3b7fbbce2345d7772b0674a318d5');

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('mihai.alex@yahoo.com', '+52 55 1234 5678', '1679091c5a880faf6fb5e6087eb1b2dc');

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('andrei234@outlook.com', '+61-2-12345678', '8f14e45fceea167a5a36dedd4bea2543');

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('bianca.vlad@gmail.com', '+91 11 2345 6789', 'c9f0f895fb98ab9159f51fd0297e236d');

INSERT INTO utilizator (adresa_email, nr_telefon, parola_hash)
VALUES ('paul.mihai99@yahoo.com', '+407023752676778', '45c48cce2e2d7fbdea1afc51c7c6ad26');

SELECT * FROM utilizator;

--creez tabelul adresa_user
CREATE TABLE ADRESA_USER (
    id_user INT,
    id_adresa INT,
    e_default CHAR(1),
    PRIMARY KEY (id_user, id_adresa),
    CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES utilizator(id_user),
    CONSTRAINT fk_adresa FOREIGN KEY (id_adresa) REFERENCES adresa(id_adresa),
    CONSTRAINT default_check CHECK (e_default IN ('Y', 'N'))
);

INSERT INTO ADRESA_USER(id_user, id_adresa, e_default)
SELECT u.id_user, a.id_adresa, 'N'
FROM utilizator u
JOIN adresa a ON u.id_user = a.id_adresa;

INSERT INTO ADRESA_USER VALUES (8, 3, 'N');
INSERT INTO ADRESA_USER VALUES (9, 5, 'N');
INSERT INTO ADRESA_USER VALUES (10, 1, 'N');

UPDATE ADRESA_USER
SET e_default = 'Y'
WHERE id_user = 5;
UPDATE ADRESA_USER
SET e_default = 'Y'
WHERE id_user = 6;
UPDATE ADRESA_USER
SET e_default = 'Y'
WHERE id_user = 2;
UPDATE ADRESA_USER
SET e_default = 'Y'
WHERE id_user = 3;

SELECT * FROM ADRESA_USER;

--creez tabelul culoare
CREATE TABLE CULOARE (
    id_culoare INT DEFAULT culoare_seq.NEXTVAL PRIMARY KEY,
    nume_culoare VARCHAR(50) UNIQUE
);	

INSERT INTO CULOARE (nume_culoare) VALUES ('Negru');
INSERT INTO CULOARE (nume_culoare) VALUES ('Alb');
INSERT INTO CULOARE (nume_culoare) VALUES ('Albastru');
INSERT INTO CULOARE (nume_culoare) VALUES ('Ro?u');
INSERT INTO CULOARE (nume_culoare) VALUES ('Verde');

SELECT * FROM CULOARE;

-- creez tabelul produs_item
CREATE TABLE PRODUS_ITEM (
    id_produs_item INT DEFAULT produs_item_seq.NEXTVAL PRIMARY KEY,
    id_produs INT,
    cantitate_in_stoc INT,
    pret_original DECIMAL(10, 2) NOT NULL CHECK (pret_original >= 0),
    pret_dupa_reducere DECIMAL(10, 2) CHECK (pret_dupa_reducere >= 0),
    id_culoare INT NOT NULL,
    CONSTRAINT fk_produs FOREIGN KEY (id_produs) REFERENCES PRODUS(id_produs),
    CONSTRAINT fk_culoare FOREIGN KEY (id_culoare) REFERENCES CULOARE(id_culoare),
    CONSTRAINT cantitate_in_stoc_check CHECK (cantitate_in_stoc >= 0)
);

INSERT INTO PRODUS_ITEM (id_produs, cantitate_in_stoc, pret_original, id_culoare)
--Balerini cu varf ascutit, 50 in stoc, pret original: 99.99, pret redus: 79.99
VALUES (1, 50, 99.99, 1);

INSERT INTO PRODUS_ITEM (id_produs, cantitate_in_stoc, pret_original, id_culoare)
-- Bocanci de iarna, 30 in stoc, nu are recenzie, albastrii
VALUES (2, 30, 129.99, 3);

INSERT INTO PRODUS_ITEM (id_produs, cantitate_in_stoc, pret_original, id_culoare)
--Rochie cu imprimeu floral, 20 in stoc
VALUES (3, 20, 149.99, 2);

INSERT INTO PRODUS_ITEM (id_produs, cantitate_in_stoc, pret_original, id_culoare)
--Pantaloni sport, 20 in stoc,
VALUES (4, 40, 59.99, 4);

INSERT INTO PRODUS_ITEM (id_produs, cantitate_in_stoc, pret_original, id_culoare)
--Tricou casual, 40 in stoc, verde
VALUES (6, 40, 99.99, 5);

INSERT INTO PRODUS_ITEM (id_produs, cantitate_in_stoc, pret_original, id_culoare)
--Tricou casual, 20 in stoc, rosu
VALUES (6, 20, 199.99, 4);

INSERT INTO PRODUS_ITEM (id_produs, cantitate_in_stoc, pret_original, id_culoare)
--Tricou casual, 20 in stoc, albastru
VALUES (6, 20, 70, 3);

SELECT * FROM produs_item;

UPDATE PRODUS_ITEM pi
SET pret_dupa_reducere = pret_original - (
    pret_original * (
        SELECT CAST(SUBSTR(p.discount, 1, LENGTH(p.discount) - 1) AS DECIMAL(4, 2)) / 100
        FROM PROMOTIE p
        JOIN PRODUS pr ON pi.id_produs = pr.id_produs
        JOIN PRODUS_CATEGORIE pc ON pr.id_categorie = pc.id_produs_cat
        WHERE pc.id_promotie = p.id_promotie
    )
);

--creez tabelul recenzie
CREATE TABLE RECENZIE (
    id_recenzie INT DEFAULT recenzie_seq.NEXTVAL PRIMARY KEY,
    id_produs_item INT NOT NULL,
    rating INT,
    comentariu VARCHAR2(255),
    CONSTRAINT fk_rating CHECK(rating BETWEEN 1 AND 5),
    CONSTRAINT fk_produs_item FOREIGN KEY (id_produs_item) REFERENCES PRODUS_ITEM(id_produs_item)
);	

INSERT INTO RECENZIE (id_produs_item, rating, comentariu) 
VALUES (1, 5, 'Produsul este excelent, sunt foarte mul?umit de calitate ?i design.');

INSERT INTO RECENZIE (id_produs_item, rating, comentariu) 
VALUES (2, 4, 'Foarte mul?umit? de produs, livrare rapid? ?i calitate excelent?.');

INSERT INTO RECENZIE (id_produs_item, rating, comentariu) 
VALUES (3, 3, 'Produsul a fost ok, dar m? a?teptam la ceva mai mult în acest pre?.');

INSERT INTO RECENZIE (id_produs_item, rating, comentariu) 
VALUES (4, 5, 'Produsul a dep??it toate a?tept?rile, serviciul clien?i excelent!');

INSERT INTO RECENZIE (id_produs_item, rating, comentariu) 
VALUES (5, 1, 'Nu sunt mul?umit? de produs, calitatea este sub a?tept?ri.');

INSERT INTO RECENZIE (id_produs_item, rating, comentariu) 
VALUES (6, 1, 'Nu recomand produsul! Am fost profund dezamagit.');

SELECT * FROM recenzie;

--creez tabela imagine_produs
CREATE TABLE IMAGINE_PRODUS (
    id_imagine INT DEFAULT imag_prod_seq.NEXTVAL PRIMARY KEY,
    id_produs_item INT,
    nume_fisier VARCHAR(255),
    CONSTRAINT fk_id_prod_item FOREIGN KEY (id_produs_item) REFERENCES PRODUS_ITEM(id_produs_item)
);

INSERT INTO IMAGINE_PRODUS (id_produs_item, nume_fisier) 
VALUES (1, '/images/balerini_cu_varf_ascutit.jpg');

INSERT INTO IMAGINE_PRODUS (id_produs_item, nume_fisier) 
VALUES (2, '/images/bocanci_barbati.jpg');

INSERT INTO IMAGINE_PRODUS (id_produs_item, nume_fisier) 
VALUES (3, '/images/rochie_florala.jpg');

INSERT INTO IMAGINE_PRODUS (id_produs_item, nume_fisier) 
VALUES (4, '/images/pantaloni_sport.jpg');

INSERT INTO IMAGINE_PRODUS (id_produs_item, nume_fisier) 
VALUES (6, '/images/tricou_casual_rosu.jpg');

INSERT INTO IMAGINE_PRODUS (id_produs_item, nume_fisier) 
VALUES (6, '/images/tricou_casual_albastru.jpg');

INSERT INTO IMAGINE_PRODUS (id_produs_item, nume_fisier) 
VALUES (6, '/images/tricou_casual_verde.jpg');

SELECT * FROM IMAGINE_PRODUS;

--creez tabelul depozit
CREATE TABLE DEPOZIT (
    id_depozit INT DEFAULT depozit_seq.NEXTVAL PRIMARY KEY,
    nume_depozit VARCHAR(2),
    locatie VARCHAR(50) UNIQUE NOT NULL,
    capacitate_max INT,
    CONSTRAINT nume_depozit_check CHECK (REGEXP_LIKE(nume_depozit, '^[A-Z]{1}[0-9]{1}$')),
    CONSTRAINT capacitate_check CHECK (capacitate_max > 0 AND capacitate_max <= 5000)
);

INSERT INTO DEPOZIT (nume_depozit, locatie, capacitate_max)
VALUES ('T1', 'Bucuresti', 3000);

INSERT INTO DEPOZIT (nume_depozit, locatie, capacitate_max)
VALUES ('H2', 'New York', 4000);

INSERT INTO DEPOZIT (nume_depozit, locatie, capacitate_max)
VALUES ('F4', 'Paris', 2500);

INSERT INTO DEPOZIT (nume_depozit, locatie, capacitate_max)
VALUES ('K3', 'Berlin', 5000);

INSERT INTO DEPOZIT (nume_depozit, locatie, capacitate_max)
VALUES ('R1', 'Tokyo', 4500);

SELECT * FROM DEPOZIT;

--creez tabelul DEPOZIT_PRODUS
CREATE TABLE DEPOZIT_PRODUS_ITEM(
    id_produs_item INT,
    id_depozit INT,
    PRIMARY KEY (id_produs_item, id_depozit),
    CONSTRAINT fk_id_produs_item FOREIGN KEY (id_produs_item) REFERENCES PRODUS_ITEM(id_produs_item),
    CONSTRAINT fk_depozit FOREIGN KEY (id_depozit) REFERENCES DEPOZIT(id_depozit)
);

INSERT INTO DEPOZIT_PRODUS_ITEM (id_produs_item, id_depozit)
SELECT p.id_produs_item, d.id_depozit
FROM PRODUS_ITEM p
CROSS JOIN DEPOZIT d
WHERE d.id_depozit = 1
AND p.id_produs_item IN (1, 2, 3);

INSERT INTO DEPOZIT_PRODUS_ITEM (id_produs_item, id_depozit)
SELECT p.id_produs_item, d.id_depozit
FROM PRODUS_ITEM p
CROSS JOIN DEPOZIT d
WHERE d.id_depozit = 2
AND p.id_produs_item IN (1, 2, 3, 4, 5, 6, 7);


INSERT INTO DEPOZIT_PRODUS_ITEM (id_produs_item, id_depozit)
SELECT p.id_produs_item, d.id_depozit
FROM PRODUS_ITEM p
CROSS JOIN DEPOZIT d
WHERE d.id_depozit = 3
AND p.id_produs_item IN (1, 4, 5, 6);

INSERT INTO DEPOZIT_PRODUS_ITEM (id_produs_item, id_depozit)
SELECT p.id_produs_item, d.id_depozit
FROM PRODUS_ITEM p
CROSS JOIN DEPOZIT d
WHERE d.id_depozit = 4
AND p.id_produs_item IN (1, 7, 8);

INSERT INTO DEPOZIT_PRODUS_ITEM (id_produs_item, id_depozit)
SELECT p.id_produs_item, d.id_depozit
FROM PRODUS_ITEM p
CROSS JOIN DEPOZIT d
WHERE d.id_depozit = 5
AND p.id_produs_item IN (4, 5, 6, 7);

SELECT * FROM DEPOZIT_PRODUS_ITEM;

--creez tabelul status_comanda
CREATE TABLE status_comanda (
    id_status INT DEFAULT status_comanda_seq.NEXTVAL PRIMARY KEY,
    status VARCHAR(50)
);

INSERT INTO status_comanda (id_status, status) 
VALUES (1, 'În a?teptare');
INSERT INTO status_comanda (id_status, status) 
VALUES (2, 'În procesare');
INSERT INTO status_comanda (id_status, status) 
VALUES (3, 'Expediat?');
INSERT INTO status_comanda (id_status, status) 
VALUES (4, 'Livrare în curs');
INSERT INTO status_comanda (id_status, status) 
VALUES (5, 'Livrare finalizat?');

SELECT * FROM status_comanda;

--creez tabelul comanda
CREATE TABLE comanda (
    id_comanda INT DEFAULT comanda_seq.NEXTVAL PRIMARY KEY,
    data_comanda TIMESTAMP DEFAULT (SYSTIMESTAMP + INTERVAL '7' DAY),
    total_plata DECIMAL(10, 2) DEFAULT 0.00 NOT NULL,
    metoda_plata VARCHAR(50),  --NOT NULL,
    status_comanda INT,
    CONSTRAINT fk_status FOREIGN KEY (status_comanda) REFERENCES status_comanda(id_status),
    CONSTRAINT total_plata_check CHECK (total_plata >= 0)
);

INSERT INTO comanda (data_comanda, metoda_plata, status_comanda) 
VALUES (TIMESTAMP '2024-05-20 10:00:00', 'Plata cu cardul', 1);

INSERT INTO comanda (metoda_plata, status_comanda) 
VALUES ('Plata curier', 2);

INSERT INTO comanda (data_comanda, metoda_plata, status_comanda) 
VALUES (TIMESTAMP '2024-10-17 17:00:00', 'Plata cu cardul', 3);

INSERT INTO comanda (metoda_plata, status_comanda) 
VALUES ('Plata curier', 1);

INSERT INTO comanda (data_comanda, metoda_plata, status_comanda) 
VALUES (TIMESTAMP '2024-9-29 18:30:00', 'Plata cu cardul', 4);

INSERT INTO comanda (data_comanda, metoda_plata, status_comanda) 
VALUES (TIMESTAMP '2024-1-10 10:45:00', 'Plata curier', 3);

INSERT INTO comanda (data_comanda, metoda_plata ,status_comanda) 
VALUES (NULL,'plata curier' ,3);

INSERT INTO comanda (data_comanda, metoda_plata) 
VALUES (TIMESTAMP '2023-1-10 10:45:00', 'Plata curier');

INSERT INTO comanda (data_comanda, metoda_plata ,status_comanda) 
VALUES (TIMESTAMP '2020-1-10 10:45:00','plata curier' ,5);

INSERT INTO comanda (data_comanda, metoda_plata ,status_comanda) 
VALUES (TIMESTAMP '2020-1-10 10:45:00', NULL ,5);

SELECT * FROM comanda;

--creez tabelul PRODUS_COMANDAT
CREATE TABLE PRODUS_COMANDAT(
    id_produs_item INT,
    id_comanda INT,
    id_optiune_marime INT,
    cantitate_comandata INT,
    PRIMARY KEY(id_produs_item, id_comanda, id_optiune_marime),
    FOREIGN KEY (id_produs_item) REFERENCES PRODUS_ITEM(id_produs_item),
    FOREIGN KEY (id_comanda) REFERENCES COMANDA(id_comanda),
    FOREIGN KEY (id_optiune_marime) REFERENCES OPTIUNE_MARIME(id_optiune_marime)
);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--cumpara balerini femei
VALUES(1, 14, 1, 3);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--cumpara bocanci barbati
VALUES(2, 9, 1, 5);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--rochie de vara
VALUES(3, 7, 1, 4);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--tricou barbati
VALUES(6, 7, 2, 1);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--tricou barbati
VALUES(5, 7, 3, 2);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--tricou barbati
VALUES(6, 7, 4, 7);
INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--rochie de vara
VALUES(3, 7, 4, 4);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--tricou barbati
VALUES(6, 7, 5, 1);
INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--cumpara balerini femei
VALUES(1, 14, 5, 1);
INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--cumpara bocanci barbati
VALUES(2, 9, 5, 3);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--cumpara balerini femei
VALUES(1, 14, 6, 1);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--cumpara balerini femei
VALUES(1, 14, 7, 10);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--cumpara bocanci barbati
VALUES(2, 9, 8, 1);
INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--tricou barbati
VALUES(6, 7, 8, 1);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--tricou barbati
VALUES(6, 7, 9, 1);

INSERT INTO PRODUS_COMANDAT(id_produs_item, id_optiune_marime, id_comanda, cantitate_comandata)
--tricou barbati
VALUES(6, 7, 10, 3);

SELECT * FROM PRODUS_COMANDAT;

UPDATE comanda c
SET total_plata = (
    SELECT SUM(
            CASE
                WHEN pi.pret_dupa_reducere IS NOT NULL THEN pc.cantitate_comandata * pi.pret_dupa_reducere
                ELSE pc.cantitate_comandata * pi.pret_original
            END
        )
    FROM produs_comandat pc
    JOIN produs_item pi ON pc.id_produs_item =pi.id_produs_item
    WHERE pc.id_comanda = c.id_comanda
    GROUP BY pc.id_comanda
)
WHERE EXISTS (
    SELECT 1
    FROM produs_comandat pc
    WHERE pc.id_comanda = c.id_comanda
);

--creez tabelul cumpara
CREATE TABLE CUMPARA(
    id_user INT,
    id_comanda INT,
    id_depozit INT,
    PRIMARY KEY(id_user, id_comanda, id_depozit),
    FOREIGN KEY (id_user) REFERENCES UTILIZATOR(id_user),
    FOREIGN KEY (id_comanda) REFERENCES COMANDA(id_comanda),
    FOREIGN KEY (id_depozit) REFERENCES DEPOZIT(id_depozit)
);

INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(1, 1, 1);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(1, 2, 1);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(2, 3, 2);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(3, 6, 3);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(4, 1, 4);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(5, 4, 5);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(6, 5, 5);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(7, 6, 4);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(8, 7, 3);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(9, 5, 2);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(10, 3, 3);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(10, 9, 3);
INSERT INTO CUMPARA(id_user, id_comanda, id_depozit) VALUES(10, 10, 1);

SELECT * FROM promotie;
SELECT * FROM MARIME_CATEGORIE;
SELECT * FROM produs_categorie;
SELECT * FROM produs_marime;
SELECT * FROM produs;
SELECT * FROM optiune_marime;
SELECT * FROM tara;
SELECT * FROM adresa;
SELECT * FROM utilizator;
SELECT * FROM adresa_user;
SELECT * FROM recenzie;
SELECT * FROM culoare;
SELECT * FROM produs_item;
SELECT * FROM imagine_produs;
SELECT * FROM depozit;
SELECT * FROM DEPOZIT_PRODUS_ITEM;
SELECT * FROM status_comanda; 
SELECT * FROM comanda;
SELECT * FROM produs_comandat;
SELECT * FROM cumpara;
