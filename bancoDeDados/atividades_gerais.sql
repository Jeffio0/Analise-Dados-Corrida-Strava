CREATE TABLE atividades_gerais(
    id_atividade INTEGER PRIMARY KEY,       -- Coluna 01: identificação da atividade
    data_atividade DATETIME,                -- Coluna 02: data e horário da atividade
    tipo_atividade VARCHAR(50) NOT NULL,    -- Coluna 04: tipo de atividade
    tempo_movimentacao INTEGER,            -- Coluna 17: tempo de movimentação
    distancia DECIMAL(10,1),                -- Coluna 07: distancia percorrida
    ganho_elevacao INTEGER,                 -- Coluna 21: ganho de elevação
    equipamento VARCHAR(50),                 -- Coluna 12: Equipamento utilizado
    calorias INTEGER);                      -- Coluna 35: Calorias

SELECT * FROM atividades_gerais;

INSERT INTO atividades_gerais (id_atividade, data_atividade, tipo_atividade, tempo_movimentacao, distancia, ganho_elevacao, equipamento, calorias)
SELECT id_da_atividade, data_da_atividad, tipo_de_atividad, tempo_de_movimen, dist_ncia, ganho_de_eleva_o, equipamento_da_a, calorias
FROM dadosAtividadesStrava;


SELECT equipamento_da_a, equipamento_da_atividade FROM dadosAtividadesStrava;

DROP TABLE atividades_gerais;
