--- CRIAÇÃO DE VIEWS PARA ATIVIDADES GERAIS DE CORRIDA E PEDALADA
--- VIEW PARA ATIVIDADES GERAIS DE CORRIDA E PEDALADA

DROP VIEW IF EXISTS vmAtividadesGerais;
CREATE VIEW vmAtividadesGeraisCorrida AS
SELECT
     id_da_atividade,
    data_da_atividad AS data_da_Atividade,
    tipo_de_atividad AS tipo_de_Atividade,
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
    data_da_atividad AS data_da_Atividade,
    tipo_de_atividad AS tipo_de_Atividade,
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
    data_da_atividad AS data_da_Atividade,
    tipo_de_atividad AS tipo_de_Atividade,
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
