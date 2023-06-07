SELECT u.user_name AS pessoa_usuaria, COUNT(h.song_id) AS musicas_ouvidas, ROUND(SUM(s.song_duration_sec) / 60, 2) AS total_minutos
FROM SpotifyClone.History AS h
INNER JOIN SpotifyClone.Songs AS s ON s.song_id = h.song_id
INNER JOIN SpotifyClone.Users AS u ON u.user_id = h.user_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;