
SELECT 
    ROUND(AVG(COALESCE(Capacidade_de_Armazenamento, 0)), 2) AS media_capacidade_kWh
FROM 
    pesquisas;
