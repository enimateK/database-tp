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


