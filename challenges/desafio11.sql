SELECT
	A.album_title AS album,
    COUNT(FS.user_id) AS favoritadas
FROM SpotifyClone.Favorite_Songs AS FS
INNER JOIN SpotifyClone.Songs AS S ON FS.song_id = S.song_id
INNER JOIN SpotifyClone.Albums AS A ON S.album_id = A.album_id
GROUP BY album
ORDER BY favoritadas DESC, album ASC LIMIT 3;