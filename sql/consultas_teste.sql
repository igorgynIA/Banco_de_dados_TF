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
SELECT
    j.titulo,
    g.nome_genero
FROM jogos AS j
JOIN jogo_genero AS jg ON j.jogo_id = jg.jogo_id 
JOIN generos AS g ON jg.genero_id = g.genero_id   
ORDER BY j.titulo, g.nome_genero;


-- Consulta 3: Quais foram as avaliações dadas, por quem e para qual jogo?
SELECT
    j.titulo,
    c.nome_usuario AS avaliador,
    a.nota
FROM avaliacoes AS a
JOIN jogos AS j ON a.jogo_id = j.jogo_id          -- Conecta a avaliação ao jogo
JOIN clientes AS c ON a.cliente_id = c.cliente_id  -- Conecta a avaliação ao cliente
ORDER BY j.titulo;