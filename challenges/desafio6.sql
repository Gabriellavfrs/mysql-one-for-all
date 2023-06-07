SELECT 
  FORMAT(MIN(S.signature_value), 2) AS faturamento_minimo,  
  FORMAT(MAX(S.signature_value), 2) AS faturamento_maximo, 
  FORMAT(AVG(S.signature_value), 2) AS faturamento_medio, 
  FORMAT(SUM(S.signature_value), 2) AS faturamento_total
FROM SpotifyClone.Users AS U
INNER JOIN SpotifyClone.Signature_Types AS S ON U.signature_id = S.signature_id;