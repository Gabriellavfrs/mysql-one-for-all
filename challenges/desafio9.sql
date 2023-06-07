SELECT COUNT(H.song_id) AS musicas_no_historico
FROM SpotifyClone.Users AS U
INNER JOIN SpotifyClone.History AS H ON U.user_id = H.user_id
WHERE U.user_name = 'Barbara Liskov';