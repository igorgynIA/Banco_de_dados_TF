CREATE OR REPLACE TABLE `db-2025-igor.trabalho_final.dim_tempo` AS
WITH all_dates AS (
  SELECT DISTINCT data_venda AS a_date FROM `seu-projeto.seu_dataset_bruto.raw_vendas`
  UNION DISTINCT
  SELECT DISTINCT data_avaliacao AS a_date FROM `seu-projeto.seu_dataset_bruto.raw_avaliacoes`
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
CREATE OR REPLACE TABLE `seu-projeto.steam_dw.fato_avaliacoes` AS
SELECT
    a.avaliacao_id,
    a.jogo_id,
    a.cliente_id,
    a.data_avaliacao AS fk_data, -- Chave para a dim_tempo

    a.nota,
    1 AS quantidade_avaliacoes -- Uma métrica simples para contagem
FROM
    `seu-projeto.seu_dataset_bruto.raw_avaliacoes` AS a;