/* La création de la table clients qui a comme clé primaire l'attribut "idcl" */
CREATE TABLE clients(
	idcl INTEGER PRIMARY KEY, 
	nom VARCHAR2(20), 
	prenom VARCHAR2(15), 
	adr VARCHAR2(30), 
	tel VARCHAR2(12) 
	);

CREATE TABLE livres(
	refl VARCHAR2(10) PRIMARY KEY, 
	titre VARCHAR2(20), 
	auteur VARCHAR2(20), 
	genre VARCHAR2(15))
;

CREATE TABLE achats(
	idcl INTEGER REFERENCES clients(idcl) ON DELETE CASCADE , 
	refl VARCHAR2(10) REFERENCES livres(refl) ON DELETE CASCADE , 
	dateachat date , 
	PRIMARY KEY (idcl,  refl, dateachat)
	);

ALTER TABLE achats ADD CONSTRAINT contrainteachat CHECK (dateachat IS NOT NULL AND  dateachat >= to_date('01-JAN-2008', 'DD-MON-YYYY') AND dateachat <= to_date('31-DEC-2013', 'DD-MON-YYYY') );
ALTER TABLE achats ADD prix INTEGER;

CREATE TABLE avis(
	idcl INTEGER REFERENCES clients(idcl) ON DELETE CASCADE , 
	refl VARCHAR2(10) REFERENCES livres(refl) ON DELETE CASCADE , 
	note INTEGER, 
	commentaire VARCHAR2(50),
	PRIMARY KEY (idcl,  refl)
	);

ALTER TABLE avis ADD CONSTRAINT contrainteavis CHECK ( note IS NOT NULL AND note >= 1 AND note <= 20 );
