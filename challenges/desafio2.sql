SELECT COUNT(DISTINCT s.song_id) AS cancoes, COUNT(DISTINCT s.artist_id) AS artistas, COUNT(DISTINCT s.album_id) AS albuns
FROM SpotifyClone.Songs AS s;