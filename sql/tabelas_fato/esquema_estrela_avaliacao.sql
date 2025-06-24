CREATE OR REPLACE TABLE `db-2025-igor.trabalho_final.dim_tempo` AS
WITH all_dates AS (
  SELECT DISTINCT data_venda AS a_date FROM `db-2025-igor.trabalho_final.vendas`
  UNION DISTINCT
  SELECT DISTINCT data_avaliacao AS a_date FROM `db-2025-igor.trabalho_final.avaliacoes`
)
SELECT
  a_date AS data_completa,
  EXTRACT(YEAR FROM a_date) AS ano,
  EXTRACT(MONTH FROM a_date) AS mes,
  EXTRACT(DAY FROM a_date) AS dia,
  EXTRACT(QUARTER FROM a_date) AS trimestre,
  FORMAT_DATE('%A', a_date) as dia_da_semana
FROM
  all_dates
WHERE a_date IS NOT NULL;

-- Esta tabela armazena os fatos sobre o evento de "um cliente avaliar um jogo".
CREATE OR REPLACE TABLE `db-2025-igor.trabalho_final.avaliacoes_fato` AS
SELECT
    a.avaliacao_id,
    jo.titulo,
    c.nome_usuario,
    ge.nome_genero,
    a.data_avaliacao AS fk_data, -- Chave para a dim_tempo

    a.nota,
    1 AS quantidade_avaliacoes -- Uma métrica simples para contagem
FROM
    `db-2025-igor.trabalho_final.avaliacoes` AS a
INNER JOIN `db-2025-igor.trabalho_final.clientes` c ON c.cliente_id = a.cliente_id
INNER JOIN `db-2025-igor.trabalho_final.jogos` jo ON jo.jogo_id = a.jogo_id
INNER JOIN `db-2025-igor.trabalho_final.jogo_genero` jg ON jg.jogo_id = jo.jogo_id
INNER JOIN `db-2025-igor.trabalho_final.genero` ge ON ge.genero_id = jg.genero_id

