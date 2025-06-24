import pandas as pd
from faker import Faker
import random
from datetime import datetime, timedelta

# =============================================================================
# CONFIGURAÇÃO INICIAL
# =============================================================================
# Inicializa o Faker para gerar dados em português do Brasil
fake = Faker('pt_BR')

# Define a quantidade de registros para cada tabela principal
# Vamos gerar mais vendas e avaliações do que outros itens para simular um ambiente real
NUM_DESENVOLVEDORAS = 100
NUM_PUBLICADORAS = 150
NUM_CLIENTES = 2000
NUM_JOGOS = 500
NUM_VENDAS = 4000  # Mais vendas do que clientes, pois um cliente pode comprar várias vezes
NUM_AVALIACOES = 3000

# Lista de gêneros de jogos para manter a consistência
GENEROS_LISTA = ['RPG', 'Ação', 'Mundo Aberto', 'Simulação', 'Indie', 'Estratégia', 'Puzzle', 'Sobrevivência', 'Terror', 'Esportes', 'Plataforma', 'Luta']

print("--- Iniciando a geração de dados sintéticos ---")

# =============================================================================
# FUNÇÕES DE GERAÇÃO PARA CADA TABELA
# =============================================================================

def generate_desenvolvedoras(n):
    """Gera uma lista de desenvolvedoras de jogos."""
    data = []
    for i in range(1, n + 1):
        data.append({
            'desenvolvedora_id': i,
            'nome': fake.company(),
            'pais_origem': fake.country()
        })
    print(f"-> {n} desenvolvedoras geradas.")
    return pd.DataFrame(data)

def generate_publicadoras(n):
    """Gera uma lista de publicadoras de jogos."""
    data = []
    for i in range(1, n + 1):
        data.append({
            'publicadora_id': i,
            'nome': fake.company(),
            'pais_origem': fake.country()
        })
    print(f"-> {n} publicadoras geradas.")
    return pd.DataFrame(data)

def generate_generos(lista_generos):
    """Cria a tabela de gêneros a partir de uma lista pré-definida."""
    data = [{'genero_id': i + 1, 'nome_genero': genero} for i, genero in enumerate(lista_generos)]
    print(f"-> {len(data)} gêneros gerados.")
    return pd.DataFrame(data)

def generate_clientes(n):
    """Gera uma lista de clientes."""
    data = []
    for i in range(1, n + 1):
        data.append({
            'cliente_id': i,
            'nome_usuario': fake.user_name(),
            'email': fake.unique.email(),
            'data_cadastro': fake.date_between(start_date='-4y', end_date='-1y'),
            'pais': fake.country()
        })
    print(f"-> {n} clientes gerados.")
    return pd.DataFrame(data)

def generate_jogos(n, dev_ids, pub_ids):
    """Gera uma lista de jogos, referenciando desenvolvedoras e publicadoras existentes."""
    data = []
    for i in range(1, n + 1):
        data.append({
            'jogo_id': i,
            'titulo': fake.catch_phrase(),
            'data_lancamento': fake.date_between(start_date='-8y', end_date='today'),
            'preco_base': round(random.uniform(5, 70), 2),
            'desenvolvedora_id': random.choice(dev_ids),
            'publicadora_id': random.choice(pub_ids)
        })
    print(f"-> {n} jogos gerados.")
    return pd.DataFrame(data)

def generate_jogo_genero(jogo_ids, genero_ids):
    """Associa cada jogo a 1-3 gêneros aleatórios, evitando duplicatas."""
    data = []
    associacoes = set() # Usar um set para garantir que os pares (jogo, genero) sejam únicos
    for jogo_id in jogo_ids:
        num_generos = random.randint(1, 3)
        generos_escolhidos = random.sample(genero_ids, num_generos)
        for genero_id in generos_escolhidos:
            if (jogo_id, genero_id) not in associacoes:
                data.append({
                    'jogo_id': jogo_id,
                    'genero_id': genero_id
                })
                associacoes.add((jogo_id, genero_id))
    print(f"-> {len(data)} associações jogo-gênero geradas.")
    return pd.DataFrame(data)

def generate_vendas(n, clientes_df):
    """Gera uma lista de vendas, garantindo que a data da venda seja posterior ao cadastro do cliente."""
    data = []
    for i in range(1, n + 1):
        cliente = clientes_df.sample(1).iloc[0]
        cliente_id = cliente['cliente_id']
        data_cadastro = cliente['data_cadastro']
        
        # A data da venda deve ser entre a data de cadastro e hoje
        data_venda = fake.date_between(start_date=data_cadastro, end_date='today')
        
        data.append({
            'venda_id': i,
            'cliente_id': cliente_id,
            'data_venda': data_venda
        })
    print(f"-> {n} vendas geradas.")
    return pd.DataFrame(data)

def generate_itens_venda(vendas_df, jogos_df):
    """Gera os itens para cada venda. Cada venda pode ter de 1 a 4 jogos."""
    data = []
    compras_validas_para_avaliacao = [] # Armazena pares (cliente_id, jogo_id)
    
    for _, venda in vendas_df.iterrows():
        num_itens = random.randint(1, 4)
        jogos_na_venda = jogos_df.sample(num_itens)
        
        for _, jogo in jogos_na_venda.iterrows():
            preco_base = jogo['preco_base']
            desconto = random.uniform(0, 0.5) # Aplica até 50% de desconto
            preco_pago = round(preco_base * (1 - desconto), 2)
            
            data.append({
                'venda_id': venda['venda_id'],
                'jogo_id': jogo['jogo_id'],
                'preco_pago': preco_pago
            })
            # Adiciona a compra à lista de candidatas para avaliação
            compras_validas_para_avaliacao.append({'cliente_id': venda['cliente_id'], 'jogo_id': jogo['jogo_id'], 'data_venda': venda['data_venda']})
            
    print(f"-> {len(data)} itens de venda gerados.")
    return pd.DataFrame(data), compras_validas_para_avaliacao

def generate_avaliacoes(n, compras_validas):
    """Gera avaliações, garantindo que um cliente só pode avaliar um jogo que comprou."""
    data = []
    avaliacoes_unicas = set() # Garante que um cliente avalie um jogo apenas uma vez
    
    # Embaralha as compras para garantir aleatoriedade
    random.shuffle(compras_validas)
    
    avaliacao_id_counter = 1
    for compra in compras_validas:
        if avaliacao_id_counter > n:
            break

        par_cliente_jogo = (compra['cliente_id'], compra['jogo_id'])
        if par_cliente_jogo not in avaliacoes_unicas:
            data_avaliacao = fake.date_between(start_date=compra['data_venda'], end_date='today')
            data.append({
                'avaliacao_id': avaliacao_id_counter,
                'jogo_id': compra['jogo_id'],
                'cliente_id': compra['cliente_id'],
                'nota': random.randint(1, 5),
                'comentario': fake.sentence(nb_words=10),
                'data_avaliacao': data_avaliacao
            })
            avaliacoes_unicas.add(par_cliente_jogo)
            avaliacao_id_counter += 1
            
    print(f"-> {len(data)} avaliações geradas.")
    return pd.DataFrame(data)


# =============================================================================
# BLOCO DE EXECUÇÃO PRINCIPAL
# =============================================================================
if __name__ == "__main__":
    # Gerar tabelas independentes
    df_desenvolvedoras = generate_desenvolvedoras(NUM_DESENVOLVEDORAS)
    df_publicadoras = generate_publicadoras(NUM_PUBLICADORAS)
    df_generos = generate_generos(GENEROS_LISTA)
    df_clientes = generate_clientes(NUM_CLIENTES)
    
    # Extrair IDs para usar como chaves estrangeiras
    dev_ids = df_desenvolvedoras['desenvolvedora_id'].tolist()
    pub_ids = df_publicadoras['publicadora_id'].tolist()
    genero_ids = df_generos['genero_id'].tolist()
    cliente_ids = df_clientes['cliente_id'].tolist()
    
    # Gerar tabelas dependentes
    df_jogos = generate_jogos(NUM_JOGOS, dev_ids, pub_ids)
    jogo_ids = df_jogos['jogo_id'].tolist()
    
    df_jogo_genero = generate_jogo_genero(jogo_ids, genero_ids)
    df_vendas = generate_vendas(NUM_VENDAS, df_clientes)
    
    # A geração de itens de venda retorna os itens e a lista de compras válidas
    df_itens_venda, compras_validas = generate_itens_venda(df_vendas, df_jogos)
    
    df_avaliacoes = generate_avaliacoes(NUM_AVALIACOES, compras_validas)
    
    # Salvar todos os DataFrames em arquivos CSV
    print("\n--- Salvando os dataframes em arquivos CSV ---")
    
    # Dicionário para facilitar o loop de salvamento
    dataframes_to_save = {
        "desenvolvedoras.csv": df_desenvolvedoras,
        "publicadoras.csv": df_publicadoras,
        "generos.csv": df_generos,
        "clientes.csv": df_clientes,
        "jogos.csv": df_jogos,
        "jogo_genero.csv": df_jogo_genero,
        "vendas.csv": df_vendas,
        "itens_venda.csv": df_itens_venda,
        "avaliacoes.csv": df_avaliacoes,
    }
    
    for filename, df in dataframes_to_save.items():
        df.to_csv(filename, index=False, encoding='utf-8')
        print(f"Arquivo '{filename}' salvo com sucesso!")
        
    print("\n--- Processo de geração de dados concluído! ---")
