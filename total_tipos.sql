SELECT 
    tipo_das_baterias AS tipo_bateria,
    COUNT(*) AS quantidade_produzida
FROM 
    pesquisas
WHERE 
    LOWER(TRIM(tipo_das_baterias)) IN ('li-ion', 'lfp')
GROUP BY 
    tipo_das_baterias;