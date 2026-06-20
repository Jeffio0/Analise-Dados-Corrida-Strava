SELECT * 
    FROM atividades_gerais
    WHERE tipo_atividade = 'Corrida';

SELECT distancia, COUNT(*) AS total_corridas
    FROM atividades_gerais
    WHERE tipo_atividade = 'Corrida'
    GROUP BY tipo_atividade;
--- Listagem das distancias
    SELECT DISTINCT distancia --seleciona as distancias distintas
        FROM atividades_gerais
        WHERE tipo_atividade = 'Corrida' 
            AND CAST(distancia AS REAL) >= 4 --converte a distancia em número real (decimal)
        ORDER BY CAST(distancia AS REAL) ASC; --ordena as distancias em ordem crescente e utiliza o valor real (decimal)
--- Nomeando as corridas
SELECT
    DISTINCT distancia,
    'TC ' || CAST(distancia AS REAL) || ' km' As nome_atividade, ganho_elevacao
    FROM atividades_gerais
   WHERE tipo_atividade = 'Corrida' 
            AND CAST(distancia AS REAL) >= 4 --converte a distancia em número real (decimal)
            AND CAST(ganho_elevacao AS REAL) <> 0 --ignora corridas realizadas com zero ganho de elevação (atividade indoor)
        ORDER BY CAST(distancia AS REAL) ASC;
--- Nomeando as Pedaladas    
SELECT
    DISTINCT distancia,
    'TP ' || CAST(distancia AS REAL) || ' km' As nome_atividade, ganho_elevacao
    FROM atividades_gerais
   WHERE tipo_atividade = 'Pedalada' 
            AND CAST(distancia AS REAL) >= 20 --converte a distancia em número real (decimal)
            AND CAST(ganho_elevacao AS REAL) <> 0 --ignora corridas realizadas com zero ganho de elevação (atividade indoor)
        ORDER BY CAST(distancia AS REAL) ASC;

SELECT
    distancia,
        'TC ' || CAST(distancia AS REAL) || ' km' As nome_atividade, ganho_elevacao
    FROM atividades_gerais
    WHERE tipo_atividade = 'Corrida' 
            AND CAST(distancia AS REAL) >= 4 --converte a distancia em número real (decimal)
            AND CAST(ganho_elevacao AS REAL) <> 0 --ignora corridas realizadas com zero ganho de elevação (atividade indoor)
    ORDER BY CAST(distancia AS REAL) ASC;

SELECT
    distancia,
    'TP ' || CAST(distancia AS REAL) || ' km' As nome_atividade, ganho_elevacao
    FROM atividades_gerais
    WHERE tipo_atividade = 'Pedalada' 
            AND CAST(distancia AS REAL) >= 20 --converte a distancia em número real (decimal)
            AND CAST(ganho_elevacao AS REAL) <> 0 --ignora corridas realizadas com zero ganho de elevação (atividade indoor)
    ORDER BY CAST(distancia AS REAL) ASC;