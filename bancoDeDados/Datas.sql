SELECT data_atividade,
SUBSTR(data_atividade, 1, 2)||'/'||SUBSTR(data_atividade, 7, 3)||'/'||SUBSTR(data_atividade, 15, 4) AS data_abreviada
FROM atividades_gerais

SELECT data_atividade,
SUBSTR(REPLACE(data_atividade,' de ','/'),1,) AS data_abreviada
FROM atividades_gerais

--- TRATAR OS DADOS DAS DATAS, CONVERTER PARA DATAS ÚTEIS

SELECT data_atividade,
SUBSTR(data_atividade,(INSTR(data_atividade,',')-4),4) AS ANO
FROM atividades_gerais

SELECT data_atividade,
SUBSTR(data_atividade,(INSTR(data_atividade,'.')-3),3) AS Mes
FROM atividades_gerais

SELECT data_atividade,
TRIM(SUBSTR(data_atividade,1,2)) AS dia
FROM atividades_gerais



--- Tratativas da coluna data da atividade
SELECT data_atividade,
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
AS data_atividade_DMA
FROM atividades_gerais



SELECT data_atividade,
TRIM(SUBSTR(data_atividade,1,2)) AS dia
FROM atividades_gerais

SELECT data_atividade,
CASE
    WHEN LENGTH(TRIM(SUBSTR(data_atividade,1,2))) = 1 THEN 0||TRIM(SUBSTR(data_atividade,1,2))
    ELSE TRIM(SUBSTR(data_atividade,1,2))
    END AS dia
FROM atividades_gerais