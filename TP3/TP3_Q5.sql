-- Question 1 partie 3 du TP3 par Benjamin Dutriaux et Dan Monunu


-- Création de la procédure qui inscrit un client à un parcours
-- et qui l'inscrit automatiquement aux evenements de ce parcours
CREATE OR REPLACE PROCEDURE inscrip_parcours_evt (
	idclient NUMBER,
	idparcours VARCHAR2
	)
IS
	idevenement VARCHAR2(100);
	idparc VARCHAR2(100);
	-- Déclaration du curseur de la boucle qui parcours les evenements d'un parcours
	Cursor moncur IS (SELECT id_evt FROM compo_parcours WHERE idp = idparcours); 
BEGIN
	-- Insertion de l'inscription au parcours
	INSERT INTO inscrip_parcours VALUES(idclient, idparcours);

	open moncur;
	LOOP 
		FETCH moncur INTO idevenement; -- On recupere l'id evenement à chaque tour de boucle
		
		EXIT WHEN moncur % NOTFOUND;
		-- On inscrit le client à chaque evenements 
		INSERT INTO inscrip_evt 
		VALUES(idclient, idparcours, idevenement);


		
	END LOOP;
	Close moncur;

END;
/