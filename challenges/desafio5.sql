SELECT s.song_title AS cancao, COUNT(h.user_id) AS reproducoes
FROM SpotifyClone.History AS h
INNER JOIN SpotifyClone.Songs AS s ON s.song_id = h.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC LIMIT 2;