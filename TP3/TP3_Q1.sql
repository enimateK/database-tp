-- Question 1 partie 1 du TP3 par Benjamin Dutriaux et Dan Monunu

/* Bloc PL/SQL qui met à jour un attribut à partir de la relation Avis, pour un livre passé en paramètre */
DECLARE 
	r VARCHAR2(100); -- Prend la référence du livre passé en paramètre
	moy NUMBER; -- Variable dans lequel est stocké 
BEGIN
	
	
	DBMS_OUTPUT.put_line('Donnez la ref du livre : ');
	r:='&reference';
/* Selection de la moyenne d'un livre en fonction d'une référence passé en paramètre */
	SELECT AVG(note) into moy
	FROM avis
	WHERE refl = r;

/* Mise à jour de la moyenne du livre en fonction d'une référence passé en paramètre */
	UPDATE livres               
	SET note_moy = moy
	WHERE refl = r;

END;
/








	