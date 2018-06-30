/* Script de création des tables */
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

/* Création de la table achats qui a comme clé primaire les attributs "idcl, relf, dateachats" */
/* L'attribut "idcl" est une clé étrangère de la table clients, "refl", une clé étrangère de la table livres */

CREATE TABLE achats(
	idcl INTEGER REFERENCES clients(idcl) , 
	refl VARCHAR2(10) REFERENCES livres(refl) , 
	dateachat date , 
	PRIMARY KEY (idcl,  refl, dateachat)
	);

/* Détermination des contraintes de date sur la table achats (du 1er Janvier 2008 au 31 Décembre 2013) */
	
ALTER TABLE achats ADD CONSTRAINT contrainteachat CHECK (dateachat IS NOT NULL AND  dateachat >= to_date('01-JAN-2008', 'DD-MON-YYYY') AND dateachat <= to_date('31-DEC-2013', 'DD-MON-YYYY') );

/* Création de la table avis qui a comme clé primaire les attributs "idcl, relf" */
/* L'attribut "idcl" est une clé étrangère de la table clients, "refl", une clé étrangère de la table livres */

CREATE TABLE avis(
	idcl INTEGER REFERENCES clients(idcl) , 
	refl VARCHAR2(10) REFERENCES livres(refl) , 
	note INTEGER, 
	commentaire VARCHAR2(50),
	PRIMARY KEY (idcl,  refl)
	);
	
/* Détermination des contraintes de notes sur la table avis (entre 1 et 20) */

ALTER TABLE avis ADD CONSTRAINT contrainteavis CHECK ( note IS NOT NULL AND note >= 1 AND note <= 20 );
