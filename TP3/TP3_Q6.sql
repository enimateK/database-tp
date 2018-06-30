-- Question 2 partie 2 du TP3 par Benjamin Dutriaux et Dan Monunu

-- Création d'un déclencheur qui affiche à l'écran des parcours similaires à chaque fois qu'un livre est acheté
-- les parcours ne doivent pas être passés
CREATE OR REPLACE TRIGGER achats_propose_parcours
AFTER INSERT 
ON ACHATS
FOR EACH ROW

DECLARE
	nouv_genre VARCHAR(100);
	parc VARCHAR(100);
	-- Declaration du curseur qui parcour les parcours qui correspondent au genre du livre et qui ne sont pas encore passés
	Cursor moncur IS (SELECT intitulep INTO parc FROM PARCOURS WHERE genre = nouv_genre AND date_deb >= sysdate);

BEGIN
	-- On séléctionne le genre du livre qui vient d'être acheté
	SELECT genre INTO nouv_genre
	FROM livres 
	WHERE refl = :new.refl;

	open moncur;
		LOOP 
		FETCH moncur INTO parc; -- On recupere l'intitulé du parcours à afficher
			

		EXIT WHEN moncur % NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(parc); -- On affiche le nom du parcours
	END LOOP;
	Close moncur;

END;
/
