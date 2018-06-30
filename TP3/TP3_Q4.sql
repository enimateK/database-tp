-- Question 2 partie 2 du TP3 par Benjamin Dutriaux et Dan Monunu


-- Création de la procédure permettant de modifier un avis qu'il a déposé
-- et qui vérifie si l'avis existe déjà avant de faire l'update

-- Nous avons eu un problème ici et avons du passer en paramètres le nouveau commentaire et la nouvelle note car
-- quand on essayait de faire passer des valeurs à l'intérieur de la procedure en demandant à l'utilisateur,
-- la demande s'éxecutait au moment de la compilation de la procédure et non durant l'éxécution
CREATE OR REPLACE PROCEDURE update_avis (
			idclient IN NUMBER,
			reference IN VARCHAR2,
			new_commentaire IN VARCHAR2, 
			new_note IN NUMBER
 )
IS
	modif_error EXCEPTION; 
	nb NUMBER;
BEGIN
	-- Requète permettant de retourner 0 si l'avis n'existe pas 
	SELECT COUNT(*) INTO nb
	FROM avis
	WHERE idcl = idclient AND refl =  reference; 

	IF (nb  = 0) THEN -- Si l'avis n'existe pas, l'erreur se déclenche empechant l'update qui n'aurait pas fonctionné
		RAISE modif_error;
	ELSE
		UPDATE avis -- Requete Update sur l'avis existant 
		SET note = new_note, commentaire = new_commentaire
		WHERE idcl = idclient AND refl = reference;
	END IF;
	EXCEPTION
		WHEN modif_error THEN -- Création de l'exception
			RAISE_APPLICATION_ERROR (-20003, 'L avis existe déjà.');
		


END update_avis;
/

