SELECT data_atividade,
SUBSTR(data_atividade, 1, 2)||'/'||SUBSTR(data_atividade, 7, 3)||'/'||SUBSTR(data_atividade, 15, 4) AS data_abreviada
FROM atividades_gerais

SELECT data_atividade,
SUBSTR(REPLACE(data_atividade,' de ','/'),1,) AS data_abreviada
FROM atividades_gerais

--- TRATAR OS DADOS DAS DATAS, CONVERTER PARA DATAS ÚTEIS