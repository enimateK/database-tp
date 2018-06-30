-- Question 2 partie 1 du TP3 par Benjamin Dutriaux et Dan Monunu


/* Trigger qui à l'ajout ou à la modification d'un avis, met à jour l'attribut note_moy de la référence du livre concerné  */
CREATE OR REPLACE TRIGGER ajout_avis_update_moy
BEFORE INSERT OR UPDATE
ON AVIS
FOR EACH ROW

DECLARE
	moy NUMBER;       -- Variable qui stocke la moyenne  
	nbnotes NUMBER;   -- Variable qui stocke le nombre de notes  
BEGIN

/* Compte le nombre de notes qu'il y a dans la table avis pour une référence passé en exécutant le trigger */
	SELECT COUNT (*) into nbnotes
	FROM avis
	WHERE refl = :new.refl;

/* Retourne la moyenne des notes qu'il y a dans la table avis pour une référence passée en paramètre */
	SELECT AVG(note) into moy
	FROM avis
	WHERE refl = :new.refl;

	moy := (moy + :new.note) / (nbnotes + 1);

/* Fait la mise à jour de la moyenne pour une référence donnée */
	UPDATE livres
	SET note_moy = moy
	WHERE refl = :new.refl;


END;
/

/* On constate si l'on essaye de modifier la table livre en faisant un AFTER INSERT comme il serait plus logique,
que cela déclenche une erreur de 'tables mutantes' il a donc fallu modifier le trigger pour que celui ci 
se déclenche avant l'insertion. */

