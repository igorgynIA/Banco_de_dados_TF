INSERT INTO desenvolvedoras (desenvolvedora_id, nome, pais_origem) VALUES
(1, 'CD Projekt Red', 'Polonia'),
(2, 'Rockstar Games', 'EUA'),
(3, 'FromSoftware', 'Japao'),
(4, 'ConcernedApe', 'EUA'),
(5, 'Naughty Dog', 'EUA'),
(6, 'Blizzard Entertainment', 'EUA'),
(7, 'Valve', 'EUA'),
(8, 'Nintendo EPD', 'Japao'),
(9, 'Ubisoft Montreal', 'Canada'),
(10, 'Larian Studios', 'Belgica'),
(11, 'Mojang Studios', 'Suecia'),
(12, 'Bethesda Game Studios', 'EUA'),
(13, 'Guerrilla Games', 'Holanda'),
(14, 'Capcom', 'Japao'),
(15, 'Square Enix', 'Japao'),
(16, 'BioWare', 'Canada'),
(17, 'Insomniac Games', 'EUA'),
(18, 'Sucker Punch Productions', 'EUA'),
(19, 'Remedy Entertainment', 'Finlandia'),
(20, 'Atlus', 'Japao'),
(21, 'Kojima Productions', 'Japao'),
(22, 'Arkane Studios', 'Franca'),
(23, 'id Software', 'EUA'),
(24, 'Respawn Entertainment', 'EUA'),
(25, 'Team Cherry', 'Australia'),
(26, 'Supergiant Games', 'EUA'),
(27, 'Playdead', 'Dinamarca'),
(28, 'Coffee Stain Studios', 'Suecia'),
(29, 'Obsidian Entertainment', 'EUA'),
(30, 'Hello Games', 'Reino Unido'),
(31, 'Moon Studios', 'Austria'),
(32, 'Studio MDHR', 'Canada'),
(33, 'Sega', 'Japao'),
(34, 'PlatinumGames', 'Japao'),
(35, 'Epic Games', 'EUA'),
(36, '343 Industries', 'EUA'),
(37, 'Asobo Studio', 'Franca'),
(38, '4A Games', 'Malta'),
(39, 'Crytek', 'Alemanha'),
(40, 'Double Fine Productions', 'EUA');

INSERT INTO publicadoras (publicadora_id, nome, pais_origem) VALUES
INSERT INTO publicadoras (publicadora_id, nome, pais_origem) VALUES
(1, 'CD Projekt', 'Polonia'),
(2, 'Take-Two Interactive', 'EUA'),
(3, 'Bandai Namco Entertainment', 'Japao'),
(4, 'ConcernedApe', 'EUA'),
(5, 'Sony Interactive Entertainment', 'Japao'),
(6, 'Activision Blizzard', 'EUA'),
(7, 'Valve', 'EUA'),
(8, 'Nintendo', 'Japao'),
(9, 'Ubisoft', 'Franca'),
(10, 'Larian Studios', 'Belgica'),
(11, 'Xbox Game Studios', 'EUA'),
(12, 'Bethesda Softworks', 'EUA'),
(13, 'Capcom', 'Japao'),
(14, 'Square Enix', 'Japao'),
(15, 'Electronic Arts', 'EUA'),
(16, '505 Games', 'Italia'),
(17, 'Sega', 'Japao'),
(18, 'Devolver Digital', 'EUA'),
(19, 'Annapurna Interactive', 'EUA'),
(20, 'Team Cherry', 'Australia'),
(21, 'Supergiant Games', 'EUA'),
(22, 'Playdead', 'Dinamarca'),
(23, 'Coffee Stain Publishing', 'Suecia'),
(24, 'Private Division', 'EUA'),
(25, 'Hello Games', 'Reino Unido'),
(26, 'Focus Entertainment', 'Franca'),
(27, 'Paradox Interactive', 'Suecia'),
(28, 'Epic Games Publishing', 'EUA'),
(29, 'Deep Silver', 'Alemanha'),
(30, 'Crytek', 'Alemanha'),
(31, 'Humble Games', 'EUA'),
(32, 'tinyBuild', 'EUA'),
(33, 'Gearbox Publishing', 'EUA'),
(34, 'Warner Bros. Games', 'EUA'),
(35, 'Team17', 'Reino Unido'),
(36, 'Microsoft', 'EUA'),
(37, 'Atlus', 'Japao'),
(38, 'Remedy Entertainment', 'Finlandia'),
(39, 'PlatinumGames', 'Japao'),
(40, 'Studio MDHR', 'Canada');

INSERT INTO generos (genero_id, nome_genero) VALUES
(1, 'RPG'),
(2, 'Acao'),
(3, 'Mundo Aberto'),
(4, 'Simulacao'),
(5, 'Indie'),
(6, 'Estrategia'),
(7, 'Puzzle'),
(8, 'Sobrevivencia'),
(9, 'Terror'),
(10, 'Esportes'),
(11, 'Aventura'),
(12, 'Plataforma'),
(13, 'Luta'),
(14, 'Corrida'),
(15, 'Tiro em Primeira Pessoa (FPS)'),
(16, 'Tiro em Terceira Pessoa (TPS)'),
(17, 'Roguelike'),
(18, 'Metroidvania'),
(19, 'Construcao de Cidades'),
(20, 'Soulslike'),
(21, 'Hack and Slash'),
(22, 'Stealth'),
(23, 'Visual Novel'),
(24, 'Ritmo'),
(25, 'Sandbox');

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
