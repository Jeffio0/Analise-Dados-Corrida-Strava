SELECT tipo_atividade,
tempo_movimentacao,
distancia,
ROUND(CAST((tempo_movimentacao/60) AS INTEGER),2) AS ritmo
FROM atividades_gerais
WHERE tipo_atividade <> 'Treino'

SELECT tipo_atividade,
tempo_movimentacao,
distancia,
tempo_movimentacao/60 AS tempo
FROM atividades_gerais
WHERE tipo_atividade <> 'Treino'

SELECT tipo_atividade,
tempo_movimentacao,
distancia,
(CAST(tempo_movimentacao AS REAL))/(REPLACE(distancia,',','')*10) AS pace
FROM atividades_gerais
WHERE tipo_atividade <> 'Treino'

SELECT tipo_atividade,
tempo_movimentacao,
distancia,
CAST((tempo_movimentacao/60) AS INTEGER) ||':'||
CAST((SUBSTR(PRINTF('%.2f',(tempo_movimentacao/60/distancia)),-2,2)*0.6) AS INTEGER) AS tempo2
FROM atividades_gerais
WHERE tipo_atividade <> 'Treino'

SELECT tipo_atividade,
tempo_movimentacao,
distancia,
tempo_movimentacao/60,
SUBSTR(PRINTF('%.2f',(tempo_movimentacao/60/distancia)),-2,2)*0.6 AS tempo2
FROM atividades_gerais
WHERE tipo_atividade <> 'Treino'