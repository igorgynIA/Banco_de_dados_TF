SELECT
    c.nome_usuario,
    j.titulo AS jogo_comprado,
    iv.preco_pago,
    v.data_venda
FROM vendas AS v
JOIN clientes AS c ON v.cliente_id = c.cliente_id -- Conecta a venda ao cliente
JOIN itens_venda AS iv ON v.venda_id = iv.venda_id -- Conecta a venda aos itens dela
JOIN jogos AS j ON iv.jogo_id = j.jogo_id          -- Conecta o item ao jogo correspondente
ORDER BY v.data_venda;


-- Consulta 2: Quais são os gêneros de cada jogo?
-- Esta consulta testa a nossa tabela de junção "muitos-para-muitos" (jogo_genero).
SELECT
    j.titulo,
    g.nome_genero
FROM jogos AS j
JOIN jogo_genero AS jg ON j.jogo_id = jg.jogo_id -- Conecta o jogo à tabela de junção
JOIN generos AS g ON jg.genero_id = g.genero_id   -- Conecta a junção ao nome do gênero
ORDER BY j.titulo, g.nome_genero;


-- Consulta 3: Quais foram as avaliações dadas, por quem e para qual jogo?
-- Esta consulta valida a tabela 'avaliacoes' que você sugeriu, mostrando
-- o nome do usuário, o título do jogo e a nota que ele deu.
SELECT
    j.titulo,
    c.nome_usuario AS avaliador,
    a.nota,
    a.comentario
FROM avaliacoes AS a
JOIN jogos AS j ON a.jogo_id = j.jogo_id          -- Conecta a avaliação ao jogo
JOIN clientes AS c ON a.cliente_id = c.cliente_id  -- Conecta a avaliação ao cliente
ORDER BY j.titulo;