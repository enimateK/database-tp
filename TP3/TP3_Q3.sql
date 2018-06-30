-- Question 1 partie 2 du TP3 par Benjamin Dutriaux et Dan Monunu


/* Trigger de mise à jour de la table Avis qui assure qu'un client ne peut modifier que les tuples qu'il a insérés*/
CREATE OR REPLACE TRIGGER insere_client
BEFORE INSERT 
ON AVIS 
FOR EACH ROW 

DECLARE 
	nb NUMBER;  			-- Variable dans laquelle est stocké le nombre de livre acheté
	avis_error EXCEPTION;   -- Variable qui va retourner l'erreur si le trigger n'est pas respecté
BEGIN

/* Selection les livres achetés en fonction de l'id du client et de la référence du livre passé en exécution du trigger*/
	SELECT COUNT(*) INTO nb
	FROM achats
	WHERE idcl = :new.idcl
	AND refl = :new.refl; 

	IF (nb  = 0) THEN     -- On vérifie S'il n'y a pas de livre acheté
		RAISE avis_error;     -- On initialise l'erreur 
	END IF;
	EXCEPTION
		WHEN avis_error THEN  -- Su l'erreur est initialisé, on l'affiche
			RAISE_APPLICATION_ERROR (-20002, 'Le client n a pas acheté ce livre');
		



END;
 /
