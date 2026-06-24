--- CRIAÇÃO DE VIEWS PARA ATIVIDADES GERAIS DE CORRIDA E PEDALADA
--- VIEW PARA ATIVIDADES GERAIS DE CORRIDA E PEDALADA

DROP VIEW IF EXISTS vmAtividadesGerais;
CREATE VIEW vmAtividadesGeraisCorrida AS
SELECT
     id_da_atividade,
    data_da_atividad AS data_da_atividade,
    tipo_de_atividad AS tipo_de_atividade,
    tempo_de_movimen AS tempo_de_movimento,
    dist_ncia_17 AS distancia,
    ganho_de_eleva_o AS ganho_de_elevacao,
    equipamento_da_a AS equipamento_da_atividade,
    calorias
    FROM dadosAtividadesStrava
--- VIEW PARA ATIVIDADES GERAIS DE PEDALADA

DROP VIEW IF EXISTS vmAtividadesGeraisCorrida;
CREATE VIEW vmAtividadesGeraisCorrida AS
SELECT
      id_da_atividade,
    data_da_atividad AS data_da_atividade,
    tipo_de_atividad AS tipo_de_atividade,
    tempo_de_movimen AS tempo_de_movimento,
    dist_ncia_17 AS distancia,
    ganho_de_eleva_o AS ganho_de_elevacao,
    equipamento_da_a AS equipamento_da_atividade,
    calorias
    FROM dadosAtividadesStrava
    WHERE tipo_de_atividad = 'Corrida';

---VIEW PARA ATIVIDADES GERAIS DE PEDALADA
    DROP VIEW IF EXISTS vmAtividadesGeraisPedalada;
    CREATE VIEW vmAtividadesGeraisPedalada AS
SELECT
    id_da_atividade,
    data_da_atividad AS data_da_atividade,
    tipo_de_atividad AS tipo_de_atividade,
    tempo_de_movimen AS tempo_de_movimento,
    dist_ncia_17 AS distancia,
    ganho_de_eleva_o AS ganho_de_elevacao,
    equipamento_da_a AS equipamento_da_atividade,
    calorias
    FROM dadosAtividadesStrava
    WHERE tipo_de_atividad = 'Pedalada';

--- CONSULTA PARA VER AS VIEWS CRIADAS
    Select * from vmAtividadesGeraisCorrida;
    Select * from vmAtividadesGeraisPedalada;
    SELECT * FROM dadosAtividadesStrava;
    SELECT * FROM vm_Atividades_ETL;

DROP VIEW IF EXISTS vm_Atividades_ETL;
CREATE VIEW vm_Atividades_ETL AS
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
CAST(distancia AS REAL) AS distancia_percorrida,
time(tempo_movimentacao, 'unixepoch') AS Tempo_total,
 time((tempo_movimentacao/
                    CAST(REPLACE(distancia,',','.') AS REAL)),'unixepoch')
                    AS pace,
         ROUND((CAST(REPLACE(distancia,',','.')AS REAL)*3600.00)/              tempo_movimentacao,2) AS ritmo_medio, ---Cálculo do pace de corrida ( e velocidade média da pedalada
    ganho_elevacao,
        CASE
            WHEN equipamento = '' AND tipo_atividade = 'Corrida' THEN 'Puma Flyer Runner'
            WHEN equipamento = '' AND tipo_atividade = 'Pedalada' THEN 'GTSM1'
            WHEN equipamento = '' AND tipo_atividade = 'Treino' THEN 'Não se Aplica'
            WHEN equipamento = '' AND tipo_atividade = 'Treinamento com peso' THEN 'Não se Aplica'
            WHEN equipamento = '' AND tipo_atividade = 'Caminhada' THEN 'Não se Aplica'
            ELSE equipamento
        END 
    AS equipamentos --- Identificação dos equipamentos em celulas vazias para corrida e Pedalada
FROM atividades_gerais
WHERE ganho_elevacao > 0 
    AND
        ((tipo_atividade = 'Corrida' AND CAST(distancia AS REAL) >= 3)
    OR 
        (tipo_atividade = 'Pedalada' AND CAST(distancia AS REAL) >= 20)) --ignora corridas com menos de 3km, pedaladas com menos de 20km
ORDER BY id_atividade ASC;
---ignora corridas com menos de 3km, pedaladas com menos de 20km
