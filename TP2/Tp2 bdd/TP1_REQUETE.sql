

SELECT titre, auteur, genre, COUNT(*) AS nblivres
FROM livres NATURAL JOIN achats
GROUP BY titre, auteur, genre, refl
HAVING COUNT(*) > 1 ;


SELECT titre, auteur, note
FROM livres NATURAL JOIN avis
GROUP BY titre, auteur, note
HAVING AVG(note) > 16 ;


SELECT nom, pren, titre, auteur, note
FROM (clients NATURAL JOIN avis) NATURAL JOIN livres
WHERE commentaire is NULL;