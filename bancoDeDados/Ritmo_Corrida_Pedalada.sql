SELECT tipo_atividade,
ROUND(REPLACE(distancia,',','.'),2)*1000 AS distacia2,
(tempo_movimentacao/60) AS minuto,
(tempo_movimentacao%60) AS segundo,
(tempo_movimentacao/60)||'.'||(tempo_movimentacao%60) AS minutoSegundo,
((tempo_movimentacao/60)||'.'||((tempo_movimentacao%60))/ROUND(REPLACE(distancia,',','.'),2)*1000) AS PACE
FROM atividades_gerais
WHERE tipo_atividade <> 'Treino'
ORDER BY Segundo DESC



SELECT tipo_atividade,
(ROUND(REPLACE(distancia,',','.'),2)*1000)/1000 AS distaciaConvertida,
tempo_movimentacao/60 AS minuto,
REPLACE(distancia,',','.')*1000 AS distancia_nova,
(CAST(tempo_movimentacao AS INTEGER)*16.6667)/(CAST(REPLACE(distancia,',','.') AS REAL)*1000) AS pace,
ROUND(((CAST(tempo_movimentacao AS INTEGER)*16.6667)/(CAST(REPLACE(distancia,',','.') AS REAL)*1000)),2) AS paceReal,
CAST(ROUND(((CAST(tempo_movimentacao AS INTEGER)*16.6667)/(CAST(REPLACE(distancia,',','.') AS REAL)*1000)),2) AS INTEGER) AS pace_inteiro,
CAST(ROUND(((CAST(tempo_movimentacao AS INTEGER)*16.6667)/(CAST(REPLACE(distancia,',','.') AS REAL)*1000)),2) AS INTEGER) AS segundo_inteiro
FROM atividades_gerais
WHERE tipo_atividade <> 'Treino'

--- Pace de Corrida
SELECT tipo_atividade,
REPLACE(distancia,',','.') AS distancia_ponto,
CAST(((tempo_movimentacao/60.0)+((tempo_movimentacao%60)/60.0))/REPLACE(distancia,',','.') AS INT) ||':'||Cast((((tempo_movimentacao/60.0)+((tempo_movimentacao%60)/60.0))/REPLACE(distancia,',','.') - cast(((tempo_movimentacao/60)+((tempo_movimentacao%60)/60.0))/REPLACE(distancia,',','.')AS INT))*60 AS INT) AS pace
FROM atividades_gerais
WHERE tipo_atividade = 'Corrida'
ORDER BY tipo_atividade DESC

--- Pace de Corrida
SELECT tipo_atividade,
REPLACE(distancia,',','.') AS distancia_ponto,
CAST(((tempo_movimentacao/60.0)+((tempo_movimentacao%60)/60.0))/
REPLACE(distancia,',','.') AS INT) ||':'||
Cast((((tempo_movimentacao/60.0)+((tempo_movimentacao%60)/60.0))/
REPLACE(distancia,',','.') - 
cast(((tempo_movimentacao/60)+((tempo_movimentacao%60)/60.0))/
REPLACE(distancia,',','.')AS INT))*60 AS INT) AS pace
FROM atividades_gerais
WHERE tipo_atividade = 'Corrida'
ORDER BY tipo_atividade DESC

--- Ritmo Pedalada
SELECT tipo_atividade,
REPLACE(distancia,',','.') AS distancia_ponto,
tempo_movimentacao AS segundos,
(CAST(REPLACE(distancia,',','.')AS REAL)*3600.00)/tempo_movimentacao AS ritmo_medio
FROM atividades_gerais
WHERE tipo_atividade = 'Pedalada'
ORDER BY ritmo_medio ASC


SELECT id_atividade,
TIME(tempo_movimentacao, 'unixepoch')/CAST(distancia AS REAL) AS minuto
FROM atividades_gerais

SELECT id_atividade,
tempo_movimentacao,
distancia,
time(ritmo,'unixepoch') AS pace_ritmo
FROM(
    SELECT
    id_atividade,
    tempo_movimentacao,
    distancia,
    tempo_movimentacao/
        CAST(REPLACE(distancia,',','.') AS REAL) AS ritmo
FROM atividades_gerais) AS sub;


SELECT id_atividade,
tempo_movimentacao,
distancia,
time((tempo_movimentacao/
        CAST(REPLACE(distancia,',','.') AS REAL)),'unixepoch') AS pace_ritmo
FROM atividades_gerais

SELECT id_atividade,
Round((CAST(REPLACE(distancia,',','.')AS REAL)*3600.00)/tempo_movimentacao,2)
AS tempo
FROM atividades_gerais

SELECT id_atividade,
tipo_atividade,
        time((tempo_movimentacao/
                    CAST(REPLACE(distancia,',','.') AS REAL)),'unixepoch')
                    AS pace,
         ROUND((CAST(REPLACE(distancia,',','.')AS REAL)*3600.00)/tempo_movimentacao,2) AS ritmo_medio
FROM atividades_gerais
WHERE tipo_atividade = 'Corrida' OR tipo_atividade = 'Pedalada'

