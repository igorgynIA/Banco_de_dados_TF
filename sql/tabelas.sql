CREATE TABLE desenvolvedoras (
    desenvolvedora_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    pais_origem VARCHAR(100)
);

CREATE TABLE publicadoras (
    publicadora_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    pais_origem VARCHAR(100)
);

CREATE TABLE generos (
    genero_id SERIAL PRIMARY KEY,
    nome_genero VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome_usuario VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    data_cadastro DATE NOT NULL,
    pais VARCHAR(100)
);

-- Tabela Principal de Jogos (com chaves estrangeiras)

CREATE TABLE jogos (
    jogo_id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    data_lancamento DATE,
    -- Usamos NUMERIC para preços para evitar erros de arredondamento de float.
    preco_base NUMERIC(10, 2) NOT NULL,
    desenvolvedora_id INTEGER NOT NULL,
    publicadora_id INTEGER NOT NULL,
    CONSTRAINT fk_desenvolvedora FOREIGN KEY (desenvolvedora_id) REFERENCES desenvolvedoras(desenvolvedora_id),
    CONSTRAINT fk_publicadora FOREIGN KEY (publicadora_id) REFERENCES publicadoras(publicadora_id)
);

-- Tabelas de Eventos e Junção

CREATE TABLE vendas (
    venda_id SERIAL PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    data_venda DATE NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE itens_venda (
    -- Uma chave primária composta garante que um mesmo jogo não seja listado duas vezes na mesma venda.
    venda_id INTEGER NOT NULL,
    jogo_id INTEGER NOT NULL,
    preco_pago NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (venda_id, jogo_id),
    CONSTRAINT fk_venda FOREIGN KEY (venda_id) REFERENCES vendas(venda_id),
    CONSTRAINT fk_jogo FOREIGN KEY (jogo_id) REFERENCES jogos(jogo_id)
);

CREATE TABLE jogo_genero (
    jogo_id INTEGER NOT NULL,
    genero_id INTEGER NOT NULL,
    PRIMARY KEY (jogo_id, genero_id),
    CONSTRAINT fk_jogo FOREIGN KEY (jogo_id) REFERENCES jogos(jogo_id),
    CONSTRAINT fk_genero FOREIGN KEY (genero_id) REFERENCES generos(genero_id)
);

CREATE TABLE avaliacoes (
    avaliacao_id SERIAL PRIMARY KEY,
    jogo_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    -- A constraint CHECK garante a integridade do dado de nota.
    nota INTEGER NOT NULL CHECK (nota >= 1 AND nota <= 5),
    data_avaliacao DATE NOT NULL,
    -- Um cliente só pode avaliar um jogo uma única vez.
    UNIQUE (jogo_id, cliente_id),
    CONSTRAINT fk_jogo FOREIGN KEY (jogo_id) REFERENCES jogos(jogo_id),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);