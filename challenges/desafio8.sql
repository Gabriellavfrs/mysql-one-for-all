SELECT
	A.artist_name AS artista, 
    AL.album_title AS album
FROM SpotifyClone.Artists AS A
INNER JOIN SpotifyClone.Albums AS AL ON A.artist_id = AL.artist_id
WHERE A.artist_name = 'Elis Regina'
ORDER BY album;