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
    'TP ' || CAST(distancia AS REAL) || ' km' As nome_atividade, 
    ganho_elevacao
    FROM atividades_gerais
   WHERE tipo_atividade = 'Pedalada' 
            AND CAST(distancia AS REAL) >= 20 --converte a distancia em número real (decimal)
            AND CAST(ganho_elevacao AS REAL) <> 0 --ignora corridas realizadas com zero ganho de elevação (atividade indoor)
        ORDER BY CAST(distancia AS REAL) ASC;

SELECT
    distancia,
    'TC ' || CAST(distancia AS REAL) || ' km' As nome_atividade, ---identificação da atividade concatenado com distancia e abreviação km
    ganho_elevacao
    FROM atividades_gerais
    WHERE tipo_atividade = 'Corrida' 
            AND CAST(distancia AS REAL) >= 4 --converte a distancia em número real (decimal)
            AND CAST(ganho_elevacao AS REAL) <> 0 --ignora corridas realizadas com zero ganho de elevação (atividade indoor)
    ORDER BY CAST(distancia AS REAL) ASC;

--- CASE Nomenclatura da atividade (Tipo de atividade + Distacia)

SELECT
    tipo_atividade,
    distancia,
    CASE
        WHEN tipo_atividade = 'Corrida' THEN 'TC ' ---treino Corrida
        WHEN tipo_atividade = 'Pedalada' THEN 'TP ' ---treino Pedalada
        ELSE 'Indefinido' ---treino indefinido
    END
    || CAST(distancia AS REAL)
    || ' km'  AS nome_atividade
FROM atividades_gerais    
  
    --- Definição dos horários
SELECT id_atividade,
    SUBSTR(data_atividade, -8, 5) --extração do horário da atividade
FROM atividades_gerais

SELECT id_atividade, 
    SUBSTR(data_atividade, -8, 5) AS hora_atividade, --extração do horário da atividade
    CASE --Definição do período do dia
        WHEN SUBSTR(data_atividade, -8, 5) BETWEEN '04:00' AND '11:59' THEN 'Manhã'
        WHEN SUBSTR(data_atividade, -8, 5) BETWEEN '12:00' AND '17:59' THEN 'Tarde'
        WHEN SUBSTR(data_atividade, -8, 5) BETWEEN '18:00' AND '23:59' THEN 'Noite'
        ELSE 'Noite'
    END AS horario
    FROM atividades_gerais
    ORDER BY hora_atividade DESC;

--- Identificação como não informado para treinos indoor e treino com peso
    SELECT id_atividade,
    tipo_atividade,
CASE
    WHEN equipamento = '' AND tipo_atividade = 'Corrida' THEN 'Puma Flyer Runner'
    WHEN equipamento = '' AND tipo_atividade = 'Pedalada' THEN 'GTSM1'
    WHEN equipamento = '' AND tipo_atividade = 'Treino' THEN 'Não se Aplica'
    WHEN equipamento = '' AND tipo_atividade = 'Treinamento com peso' THEN 'Não se Aplica'
    WHEN equipamento = '' AND tipo_atividade = 'Caminhada' THEN 'Não se Aplica'
    ELSE equipamento
    END AS equipamentos
FROM atividades_gerais

    
    
    --- Unificando as consultas
    SELECT
        id_atividade,
        CASE
        WHEN tipo_atividade = 'Corrida' THEN 'TC ' ---treino Corrida
        WHEN tipo_atividade = 'Pedalada' THEN 'TP ' ---treino Pedalada
        ELSE 'Indefinido' ---treino indefinido
    END
    || CAST(distancia AS REAL)
    || ' km'  AS nome_atividade,
        tipo_atividade,
        SUBSTR(data_atividade,(INSTR(data_atividade,',')-4),4)||'-'||
CASE
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'jan' THEN '01'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'fev' THEN '02'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'mar' THEN '03'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'abr' THEN '04'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'mai' THEN '05'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'jun' THEN '06'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'jul' THEN '07'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'ago' THEN '08'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'set' THEN '09'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'out' THEN '10'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'nov' THEN '11'
WHEN SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) = 'dez' THEN '12'
END ||'-'||
CASE
    WHEN LENGTH(TRIM(SUBSTR(data_atividade,1,2))) = 1 THEN 0||TRIM(SUBSTR(data_atividade,1,2))
    ELSE TRIM(SUBSTR(data_atividade,1,2))
END
AS data_atividade_DMA,
        CASE --Definição do período do dia
        WHEN SUBSTR(data_atividade, -8, 5) BETWEEN '04:00' AND '11:59' THEN 'Manhã'
        WHEN SUBSTR(data_atividade, -8, 5) BETWEEN '12:00' AND '17:59' THEN 'Tarde'
        WHEN SUBSTR(data_atividade, -8, 5) BETWEEN '18:00' AND '23:59' THEN 'Noite'
        ELSE 'Noite'
    END AS horario,
        CAST(distancia AS REAL) AS distancia_absoluta,
        ganho_elevacao,
       CASE
    WHEN equipamento = '' AND tipo_atividade = 'Corrida' THEN 'Puma Flyer Runner'
    WHEN equipamento = '' AND tipo_atividade = 'Pedalada' THEN 'GTSM1'
    WHEN equipamento = '' AND tipo_atividade = 'Treino' THEN 'Não se Aplica'
    WHEN equipamento = '' AND tipo_atividade = 'Treinamento com peso' THEN 'Não se Aplica'
    WHEN equipamento = '' AND tipo_atividade = 'Caminhada' THEN 'Não se Aplica'
    ELSE equipamento
    END AS equipamentos
        FROM atividades_gerais
       WHERE ganho_elevacao > 0 
            AND
            ((tipo_atividade = 'Corrida' AND CAST(distancia AS REAL) >= 3)
            OR (tipo_atividade = 'Pedalada' AND CAST(distancia AS REAL) >= 20)) --ignora corridas com menos de 3km, pedaladas com menos de 20km e zero ganho de elevação para as mesmas atividade indoor
        ORDER BY CAST(distancia AS REAL) ASC;


