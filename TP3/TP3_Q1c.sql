-- Question 1c partie 1 du TP3 par Benjamin Dutriaux et Dan Monunu


/* Procédure qui met à jour un attribut pour tous les livres en partant de la question précédente */
CREATE OR REPLACE PROCEDURE occurence 

IS
	Cursor moncur IS (SELECT refl FROM livres);
	ref varchar(100);
	moy NUMBER;


BEGIN
	open moncur;
	LOOP 
		FETCH moncur into ref;
		

		SELECT AVG(note) into moy
		FROM avis
		WHERE refl = ref;

		UPDATE livres
		SET note_moy = moy
		WHERE refl = ref;


		EXIT WHEN moncur % NOTFOUND;
	END LOOP;
	Close moncur;
END;
/