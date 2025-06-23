INSERT INTO desenvolvedoras (desenvolvedora_id, nome, pais_origem) VALUES
(101, 'CD Projekt Red', 'Polonia'),
(102, 'Rockstar Games', 'EUA'),
(103, 'FromSoftware', 'Japao'),
(104, 'ConcernedApe', 'EUA');

INSERT INTO publicadoras (publicadora_id, nome, pais_origem) VALUES
(201, 'CD Projekt', 'Polonia'),
(202, 'Take-Two Interactive', 'EUA'),
(203, 'Bandai Namco Entertainment', 'Japao'),
(204, 'ConcernedApe', 'EUA');

INSERT INTO generos (genero_id, nome_genero) VALUES
(1, 'RPG'),
(2, 'Acao'),
(3, 'Mundo Aberto'),
(4, 'Simulacao'),
(5, 'Indie');

INSERT INTO clientes (cliente_id, nome_usuario, email, data_cadastro, pais) VALUES
(1, 'alice_gamer', 'alice@email.com', '2024-01-15', 'Brasil'),
(2, 'bento_plays', 'bento@email.com', '2024-02-20', 'Portugal'),
(3, 'carla_streams', 'carla@email.com', '2024-03-10', 'Brasil'),
(4, 'duda_rpg', 'duda@email.com', '2024-04-05', 'Mexico');

INSERT INTO jogos (jogo_id, titulo, data_lancamento, preco_base, desenvolvedora_id, publicadora_id) VALUES
(1001, 'The Witcher 3: Wild Hunt', '2015-05-19', 39.99, 101, 201),
(1002, 'Red Dead Redemption 2', '2018-10-26', 59.99, 102, 202),
(1003, 'Elden Ring', '2022-02-25', 59.99, 103, 203),
(1004, 'Stardew Valley', '2016-02-26', 14.99, 104, 204),
(1005, 'Cyberpunk 2077', '2020-12-10', 49.99, 101, 201);

INSERT INTO jogo_genero (jogo_id, genero_id) VALUES
(1001, 1), (1001, 2), (1001, 3),
(1002, 2), (1002, 3),
(1003, 1), (1003, 2),
(1004, 4), (1004, 5), (1004, 1),
(1005, 1), (1005, 3);

INSERT INTO vendas (venda_id, cliente_id, data_venda) VALUES
(501, 1, '2025-01-20'),
(502, 2, '2025-02-15'),
(503, 1, '2025-03-05'),
(504, 3, '2025-04-10'),
(505, 4, '2025-05-22'),
(506, 2, '2025-06-01');

INSERT INTO itens_venda (venda_id, jogo_id, preco_pago) VALUES
(501, 1001, 35.99),
(502, 1003, 59.99),
(502, 1004, 12.99),
(503, 1005, 49.99),
(504, 1004, 14.99),
(505, 1002, 59.99),
(506, 1001, 39.99);

INSERT INTO avaliacoes (avaliacao_id, jogo_id, cliente_id, nota, data_avaliacao) VALUES
(901, 1001, 1, 5, '2025-02-01'),
(902, 1003, 2, 5, '2025-03-10'),
(903, 1004, 2, 4, '2025-03-11'),
(904, 1005, 1, 4, '2025-04-15'),
(905, 1004, 3, 5, '2025-05-01');

-- Resetando as sequências para que os próximos IDs gerados automaticamente com SERIAL comecem do valor correto.
-- É uma boa prática após inserção manual de IDs.
SELECT setval('desenvolvedoras_desenvolvedora_id_seq', (SELECT MAX(desenvolvedora_id) FROM desenvolvedoras));
SELECT setval('publicadoras_publicadora_id_seq', (SELECT MAX(publicadora_id) FROM publicadoras));
SELECT setval('generos_genero_id_seq', (SELECT MAX(genero_id) FROM generos));
SELECT setval('clientes_cliente_id_seq', (SELECT MAX(cliente_id) FROM clientes));
SELECT setval('jogos_jogo_id_seq', (SELECT MAX(jogo_id) FROM jogos));
SELECT setval('vendas_venda_id_seq', (SELECT MAX(venda_id) FROM vendas));
SELECT setval('avaliacoes_avaliacao_id_seq', (SELECT MAX(avaliacao_id) FROM avaliacoes));
