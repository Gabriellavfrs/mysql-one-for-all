SELECT 
CASE
	WHEN user_age <= 30 THEN 'Até 30 anos'
    WHEN user_age > 30 AND user_age <= 60 THEN 'Entre 31 e 60 anos'
    ELSE 'Maior de 60 anos'
END AS faixa_etaria,
	COUNT( DISTINCT U.user_id) AS total_pessoas_usuarias,
    COUNT(FS.user_id) AS total_favoritadas
FROM SpotifyClone.Favorite_Songs AS FS
RIGHT JOIN SpotifyClone.Users AS U ON FS.user_id = U.user_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;