-- -----------------------------------------------------
-- Tabela Dim_Tempo
-- -----------------------------------------------------
CREATE TABLE Dim_Tempo (
    ID_Tempo INT64 NOT NULL, -- ID numérico (formato YYYYMMDD)
    Data DATE NOT NULL       -- Data completa
);

-- -----------------------------------------------------
-- Tabela Dim_Cliente
-- Colunas: cliente_id, nome_usuario, email, data_cadastro, pais
-- -----------------------------------------------------
CREATE TABLE Dim_Cliente (
    ID_Cliente INT64 NOT NULL,
    Nome_Usuario_Cliente STRING,
    Email_Cliente STRING,
    Data_Cadastro_Cliente DATE,
    Pais_Cliente STRING
);

-- -----------------------------------------------------
-- Tabela Dim_Jogo
-- Colunas: jogo_id, titulo, data_lancamento, preco_base,
--          desenvolvedora_id, publicadora_id, generos (concatenados)
-- -----------------------------------------------------
CREATE TABLE Dim_Jogo (
    ID_Jogo INT64 NOT NULL,
    Titulo_Jogo STRING NOT NULL,
    Data_Lancamento_Jogo DATE,
    Preco_Base_Jogo NUMERIC,
    Nome_Desenvolvedora STRING,
    Pais_Origem_Desenvolvedora STRING,
    Nome_Publicadora STRING,
    Pais_Origem_Publicadora STRING,
    Generos_Jogo STRING
);

-- -----------------------------------------------------
-- Tabela Fato_Vendas_Jogos
-- Medidas: preco_pago
-- Chaves Estrangeiras: ID_Tempo, ID_Jogo, ID_Cliente
-- A integridade deve ser gerenciada no processo de ETL.
-- -----------------------------------------------------
CREATE TABLE Fato_Vendas_Jogos (
    ID_VendaItem INT64 NOT NULL, -- Será gerado e preenchido durante o ETL, garantindo unicidade
    ID_Tempo INT64 NOT NULL,
    ID_Jogo INT64 NOT NULL,
    ID_Cliente INT64 NOT NULL,
    Preco_Pago NUMERIC NOT NULL  -- Medida: Preço real pago pelo jogo
);