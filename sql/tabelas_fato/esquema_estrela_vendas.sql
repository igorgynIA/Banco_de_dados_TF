CREATE OR REPLACE TABLE `db-2025-igor.trabalho_final.dim_jogos` AS
SELECT
    j.jogo_id,
    j.titulo,
    j.data_lancamento,
    j.preco_base,
    d.nome AS desenvolvedora,
    d.pais_origem AS pais_desenvolvedora,
    p.nome AS publicadora,
    p.pais_origem AS pais_publicadora
FROM
    `db-2025-igor.trabalho_final.jogos` AS j
LEFT JOIN `db-2025-igor.trabalho_final.desenvolvedoras` AS d ON j.desenvolvedora_id = d.desenvolvedora_id
LEFT JOIN `db-2025-igor.trabalho_final.publicadoras`  AS p ON j.publicadora_id = p.publicadora_id;

CREATE OR REPLACE TABLE `db-2025-igor.trabalho_final.dim_clientes` AS
SELECT
    cliente_id,
    nome_usuario,
    data_cadastro,
    pais
FROM
    `db-2025-igor.trabalho_final.clientes`;

CREATE OR REPLACE TABLE `db-2025-igor.trabalho_final.dim_tempo` AS
SELECT
  DISTINCT
  data_venda AS data_completa,
  EXTRACT(YEAR FROM data_venda) AS ano,
  EXTRACT(MONTH FROM data_venda) AS mes,
  EXTRACT(DAY FROM data_venda) AS dia,
  EXTRACT(QUARTER FROM data_venda) AS trimestre,
  FORMAT_DATE('%A', data_venda) as dia_da_semana
FROM
  `db-2025-igor.trabalho_final.vendas`;

CREATE OR REPLACE TABLE `db-2025-igor.trabalho_final.fato_vendas` AS
SELECT
    iv.venda_id,
    iv.jogo_id,         -- Chave para a dim_jogos
    v.cliente_id,       -- Chave para a dim_clientes
    v.data_venda AS fk_data, -- Chave para a dim_tempo
    iv.preco_pago,
    1 AS quantidade_vendida,
    j.preco_base,
    (j.preco_base - iv.preco_pago) AS desconto_aplicado
FROM
    `db-2025-igor.trabalho_final.itens_venda` AS iv
JOIN
    `db-2025-igor.trabalho_final.vendas` AS v ON iv.venda_id = v.venda_id
JOIN
    `db-2025-igor.trabalho_final.jogos` AS j ON iv.jogo_id = j.jogo_id;