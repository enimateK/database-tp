-- Question 1b partie 1 du TP3 par Benjamin Dutriaux et Dan Monunu


/*bloc PL/SQL qui à jour un attribut pour tous les livres */
DECLARE
	Cursor moncur IS (SELECT refl FROM livres); -- ON positionne le curseur sur la référence des livres 
	ref varchar(100); -- La référence du livre --
	moy NUMBER; -- La variable qui récupère la moyenne 
BEGIN
	open moncur; -- Ouvre le curseur 
	LOOP 
		FETCH moncur into ref; -- Met la valeur du curseur dans ref pour pouvoir comparer avec la référence 
		
/* Retourne la moyenne du livre dont la référence est dans le curseur */
		SELECT AVG(note) into moy
		FROM avis
		WHERE refl = ref;

/* Met à jour la moyenne pour tous les livres contenus dans ref */
		UPDATE livres
		SET note_moy = moy
		WHERE refl = ref;


		EXIT WHEN moncur % NOTFOUND;
	END LOOP;
	Close moncur;
END;
/