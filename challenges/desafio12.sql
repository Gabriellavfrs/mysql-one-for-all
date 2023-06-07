SELECT
	A.artist_name AS artista,
CASE
	WHEN COUNT(FS.user_id) >= 5 THEN 'A'
    WHEN COUNT(FS.user_id) >= 3 AND COUNT(FS.user_id) < 5 THEN 'B'
    WHEN COUNT(FS.user_id) >= 1 AND COUNT(FS.user_id) < 3 THEN 'C'
    ELSE '-'
END AS ranking
FROM SpotifyClone.Favorite_Songs AS FS
INNER JOIN SpotifyClone.Songs AS S ON FS.song_id = S.song_id
RIGHT JOIN SpotifyClone.Artists AS A ON S.artist_id = A.artist_id
GROUP BY artista
ORDER BY COUNT(FS.user_id) DESC, artista ASC;