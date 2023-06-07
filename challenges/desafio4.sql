SELECT u.user_name AS pessoa_usuaria,
CASE
	WHEN MAX(YEAR(h.history_date)) > 2020 THEN 'Ativa'
    ELSE 'Inativa'
END AS status_pessoa_usuaria
FROM SpotifyClone.History AS h
INNER JOIN SpotifyClone.Users AS u ON u.user_id = h.user_id
GROUP BY u.user_id
ORDER BY pessoa_usuaria;