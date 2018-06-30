/* Script des requètes d'affichage de la question 2 */
/* Par Dan Monunu et Benjamin Dutriaux */

/* Requète permettant d'afficher les livres ayant été achetés en plus d'un exemplaire. 
 Nous avons changé le chiffre du sujet car cela demandait un jeu d'essai trop important, pour 
être conforme au sujet, il faut changer le 1 par 1000 */

SELECT titre, auteur, genre, COUNT(*) AS nblivres
FROM livres NATURAL JOIN achats
GROUP BY titre, auteur, genre, refl
HAVING COUNT(*) > 1 ;

/* Requète permettant d'afficher les livres ayant obtenu une moyenne de note supérieure à 16 */

SELECT titre, auteur, note
FROM livres NATURAL JOIN avis
GROUP BY titre, auteur, note
HAVING AVG(note) > 16 ;

/* Requète permettant d'afficher les clients n'ayant pas laissé de commentaire sur un livre acheté */

SELECT nom, pren, titre, auteur, note
FROM (clients NATURAL JOIN avis) NATURAL JOIN livres
WHERE commentaire is NULL;