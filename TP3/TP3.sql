/* Script de création des tables et des tuples */
/* Par Dan Monunu et Benjamin Dutriaux */


/* Création de la table clients qui a comme clé primaire l'attribut "idcl" */

CREATE TABLE clients(
	idcl INTEGER PRIMARY KEY, 
	nom VARCHAR2(20), 
	prenom VARCHAR2(15), 
	adr VARCHAR2(30), 
	tel VARCHAR2(12) 
	);
/* Création de la table livres qui a comme clé primaire l'attribut "refl" */
CREATE TABLE livres(
	refl VARCHAR2(10) PRIMARY KEY, 
	titre VARCHAR2(20), 
	auteur VARCHAR2(20), 
	genre VARCHAR2(15))
;

-- Question du TP 2
ALTER TABLE livres ADD note_moy NUMBER;


/* Création de la table achats qui a comme clé primaire les attributs "idcl, relf, dateachats" */
/* L'attribut "idcl" est une clé étrangère de la table clients, "refl", une clé étrangère de la table livres */

CREATE TABLE achats(
	idcl INTEGER REFERENCES clients(idcl) ON DELETE CASCADE , 
	refl VARCHAR2(10) REFERENCES livres(refl) ON DELETE CASCADE , 
	dateachat date , 
	PRIMARY KEY (idcl,  refl, dateachat)
	);
	
/* Détermination des contraintes de date sur la table achats (du 1er Janvier 2008 au 31 Décembre 2013) */

ALTER TABLE achats ADD CONSTRAINT contrainteachat CHECK (dateachat IS NOT NULL AND  dateachat >= to_date('01-JAN-2008', 'DD-MON-YYYY') AND dateachat <= to_date('31-DEC-2013', 'DD-MON-YYYY') );

/* Création de la table avis qui a comme clé primaire les attributs "idcl, relf" */
/* L'attribut "idcl" est une clé étrangère de la table clients, "refl", une clé étrangère de la table livres */

CREATE TABLE avis(
	idcl INTEGER REFERENCES clients(idcl) ON DELETE CASCADE , 
	refl VARCHAR2(10) REFERENCES livres(refl) ON DELETE CASCADE , 
	note INTEGER, 
	commentaire VARCHAR2(50),
	PRIMARY KEY (idcl,  refl)
	);

/* Détermination des contraintes de notes sur la table avis (entre 1 et 20) */
	
ALTER TABLE avis ADD CONSTRAINT contrainteavis CHECK ( note IS NOT NULL AND note >= 1 AND note <= 20 );



/* Script d'insertion d'un jeu d'essai dans la base de données */
/* Par Dan Monunu et Benjamin Dutriaux */

/* Insertion de clients */

INSERT INTO clients VALUES(01, 'Dupont', 'Pierre', '2 chemin de la houssinière ', '054154541514');
INSERT INTO clients VALUES(02, 'francois', 'Georges', '3 chemin de la houssinière ', '054154541515');
INSERT INTO clients VALUES(03, 'Jean', 'Armand', '4 chemin de la houssinière ', '054154541516');
INSERT INTO clients VALUES(04, 'Mercier', 'Christophe', '5 chemin de la houssinière ', '054154541517');
INSERT INTO clients VALUES(05, 'Paloma', 'Johanna', '6 chemin de la houssinière ', '054154541518');

/* Insertion de livres */

INSERT INTO livres VALUES('94DD78FD12','La licence MIAGE', 'Dan MONUNU', 'Harlequin');
INSERT INTO livres VALUES('94DD78FD13','La licence chimie', 'Dan MONUNU', 'Aventure');
INSERT INTO livres VALUES('94DD78FD14','La licence INFO', 'Jerome ALPHONSE', 'Science fiction');
INSERT INTO livres VALUES('94DD78FD15','La licence DROIT', 'Armand Jean', 'Educatif');
INSERT INTO livres VALUES('94DD78FD16','La licence MEDECINE', 'Dan MERCIER', 'Policier');

/* Insertion d'achats de livres */

INSERT INTO achats VALUES(01, '94DD78FD12', '25-MAY-2010');
INSERT INTO achats VALUES(02, '94DD78FD12', '05-MAY-2009');
INSERT INTO achats VALUES(01, '94DD78FD14', '14-JUN-2012');
INSERT INTO achats VALUES(03, '94DD78FD15', '07-SEP-2011');
INSERT INTO achats VALUES(04, '94DD78FD13', '25-DEC-2013');

/* Insertion d'avis */

INSERT INTO avis VALUES(01, '94DD78FD12', 17, 'Bon');
INSERT INTO avis VALUES(02, '94DD78FD12', 07, 'Mauvais');
INSERT INTO avis VALUES(03, '94DD78FD15', 11, 'Moyen');
INSERT INTO avis VALUES(04, '94DD78FD13', 10, 'Moyen');
INSERT INTO avis VALUES(05, '94DD78FD14', 18, NULL);


-- Création des tables du TP3


CREATE TABLE parcours (
	idp VARCHAR2(10) PRIMARY KEY,
	intitulep VARCHAR2(15),
	genre VARCHAR2(15),
	date_deb date
	);

CREATE TABLE inscrip_parcours(
	idcl INTEGER REFERENCES clients (idcl),
	idp VARCHAR2(10) REFERENCES parcours(idp),
	PRIMARY KEY (idcl, idp)
	);

CREATE TABLE inscrip_evt(
	idcl INTEGER REFERENCES clients (idcl),
	idp VARCHAR2(10) REFERENCES parcours (idp),
	id_evt VARCHAR2(10),
	PRIMARY KEY (idcl, idp, id_evt)
	);

CREATE TABLE compo_parcours(
	idp VARCHAR2(10) REFERENCES parcours(idp),
	id_evt VARCHAR2(10), -- REFERENCES inscrip_evt (id_evt), 
	PRIMARY KEY(idp, id_evt)
	);
	
-- Insertion des tuples du TP3

INSERT INTO parcours VALUES('facile', 'facile', 'Policier', '14-JUN-2012');
INSERT INTO parcours VALUES('moyen', 'moyen', 'Aventure', '15-JUN-2017');
INSERT INTO parcours VALUES('difficile', 'difficile', 'Science-fiction', '16-JUN-2017');
INSERT INTO compo_parcours VALUES('facile', 'facile_1');
INSERT INTO compo_parcours VALUES('facile', 'facile_2');
INSERT INTO compo_parcours VALUES('facile', 'facile_3');
INSERT INTO compo_parcours VALUES('moyen', 'moyen_1');
INSERT INTO compo_parcours VALUES('moyen', 'moyen_2');
INSERT INTO compo_parcours VALUES('moyen', 'moyen_3');
INSERT INTO compo_parcours VALUES('difficile', 'diff_1');
INSERT INTO compo_parcours VALUES('difficile', 'diff_2');
INSERT INTO compo_parcours VALUES('difficile', 'diff_3');