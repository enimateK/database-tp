INSERT INTO livres VALUES('94DD78FD12','La licence MIAGE', 'Dan MONUNU', 'Harlequin');
INSERT INTO livres VALUES('94DD78FD13','La licence chimie', 'Dan MONUNU', 'Aventure');
INSERT INTO livres VALUES('94DD78FD14','La licence INFO', 'Jerome ALPHONSE', 'Science fiction');
INSERT INTO livres VALUES('94DD78FD15','La licence DROIT', 'Armand Jean', 'Educatif');
INSERT INTO livres VALUES('94DD78FD16','La licence MEDECINE', 'Dan MERCIER', 'Policier');

DROP SEQUENCE maSequence ;
CREATE SEQUENCE maSequence START WITH 1 INCREMENT BY 1;

INSERT INTO clients VALUES(maSequence.nextval, 'Dupont', 'Pierre', '2 chemin de la houssinière ', '054154541514');
INSERT INTO achats VALUES(maSequence.currval, '94DD78FD12', '25-MAY-2010');
INSERT INTO avis VALUES(maSequence.currval, '94DD78FD12', 17, 'Bon');

INSERT INTO clients VALUES(maSequence.nextval, 'francois', 'Georges', '3 chemin de la houssinière ', '054154541515');
INSERT INTO achats VALUES(maSequence.currval, '94DD78FD12', '05-MAY-2009');
INSERT INTO avis VALUES(maSequence.currval, '94DD78FD12', 07, 'Mauvais');

INSERT INTO clients VALUES(maSequence.nextval, 'Jean', 'Armand', '4 chemin de la houssinière ', '054154541516');
INSERT INTO achats VALUES(maSequence.currval, '94DD78FD14', '14-JUN-2012');
INSERT INTO avis VALUES(maSequence.currval, '94DD78FD15', 11, 'Moyen');

INSERT INTO clients VALUES(maSequence.nextval, 'Mercier', 'Christophe', '5 chemin de la houssinière ', '054154541517');
INSERT INTO achats VALUES(maSequence.currval, '94DD78FD15', '07-SEP-2011');
INSERT INTO avis VALUES(maSequence.currval, '94DD78FD13', 10, 'Moyen');

INSERT INTO clients VALUES(maSequence.nextval, 'Paloma', 'Johanna', '6 chemin de la houssinière ', '054154541518');
INSERT INTO achats VALUES(maSequence.currval, '94DD78FD13', '25-DEC-2013');
INSERT INTO avis VALUES(maSequence.currval, '94DD78FD14', 18, NULL);


