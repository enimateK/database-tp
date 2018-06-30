-- Question 1

CREATE SEQUENCE maSequence START WITH 1 INCREMENT BY 1;

INSERT INTO clients VALUES(maSequence.nextval, 'Dupont', 'Pierre', '2 chemin de la houssinière ', '054154541514');
INSERT INTO clients VALUES(maSequence.nextval, 'francois', 'Georges', '3 chemin de la houssinière ', '054154541515');
INSERT INTO clients VALUES(maSequence.nextval, 'Jean', 'Armand', '4 chemin de la houssinière ', '054154541516');
INSERT INTO clients VALUES(maSequence.nextval, 'Mercier', 'Christophe', '5 chemin de la houssinière ', '054154541517');
INSERT INTO clients VALUES(maSequence.nextval, 'Paloma', 'Johanna', '6 chemin de la houssinière ', '054154541518');


-- Question 2

SELECT 'DELETE FROM ' || table_name || ';'
FROM USER_TABLES ;


-- Question 3

SET ECHO OFF
SPOOL effacer.sql
SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF
SET PAGESIZE 0
SELECT 'DELETE FROM ' || table_name || ';'
FROM USER_TABLES ;
SPOOL OFF
SET ECHO ON

-- Question 4



-- Question 6

SET ECHO OFF
SPOOL 2013-01-28-achats.lst
SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF
SET PAGESIZE 0
SELECT 'DELETE FROM ' || table_name || ';'
FROM USER_TABLES ;
SPOOL OFF
SET ECHO ON