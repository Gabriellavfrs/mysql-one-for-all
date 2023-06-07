SELECT 
	A.artist_name AS artista,
    AL.album_title AS album,
    COUNT(F.user_id) AS pessoas_seguidoras
FROM SpotifyClone.Albums AS AL
INNER JOIN SpotifyClone.Artists AS A ON AL.artist_id = A.artist_id
INNER JOIN SpotifyClone.Following AS F ON AL.artist_id = F.artist_id
GROUP BY album, artista
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;