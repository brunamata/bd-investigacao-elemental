import psycopg2
import os
from dotenv import load_dotenv
load_dotenv()

username = os.environ['bd_username']
password = os.environ['bd_password']


def teste(): 
    # Conecta no Banco de Dados
    conn = psycopg2.connect(f"dbname=InvestigacaoElemental user={username} password={password}")

    # Abre um cursor para realizar as operações do BD
    cur = conn.cursor()

    # Executando uma query
    cur.execute("SELECT * FROM amostra")

    # Recuperando os resultados
    records = cur.fetchall()
    print(records)

    # Fecha a comunicação e conexão com o banco de dados
    cur.close()
    conn.close()


def inserirDados():
    conn = psycopg2.connect(f"dbname=InvestigacaoElemental user={username} password={password}")
    cur = conn.cursor()


    #   Bruna aqui, provavelmente vou arrumar esse tratamento, preciso saber melhor 
    # o que vai ser inserido e como para fazer certinho, o mesmo para o select :) 
    try:
        
        cur.execute("insert into ELEMENTO_QUIMICO(num_atomico, estado, radioatividade, nome, classificacao) values('0', 'solido', '6.000 mSv', 'elementoX', 'metal');")
    
    except Exception as ex:
        if isinstance(ex, psycopg2.errors.NotNullViolation):
            print("Um dos valores inseridos não pode ser null. Atribua um valor concreto para ele.")
            print(ex)

        elif isinstance(ex, psycopg2.errors.UniqueViolation):
            print(ex)
            print("Este valor de chave já existe no banco, por favor, insira um valor válido e único")
        
        elif isinstance(ex, psycopg2.errors.CheckViolation):
            print(ex)
            print("Opa, cuidado! Para esse valor existir, precisa seguir umas regrinhas, tente novamente")
        
        elif isinstance(ex, psycopg2.errors.ForeignKeyViolation):
            print(ex)
            print("ops, um dos valores é chave estrangeira e precisa existir em outra tabela. Tente um valor já existente")
        
        else:
            print("Eita, erro desconhecido, reporta pra gente ae")
        
        pass
    
    conn.commit()
    cur.close()
    conn.close()


if __name__ == '__main__':
    teste()
    inserirDados()
    
    # TODO: interface para o usuário
    # TODO: decidir como vai ser
        # [OPÇÃO 1] múltipla escolha: 
    #      1 - Inserir nova pesquisa
    #      2 - Consultar 
    
    #     se 2: 
    #         1 - consultar planeta
    #         2 - consultar funcionarios
    #         3 - consultar equipamentos
    #         4 - consultar descobertas

    #     se 1: 
    #         1 - planeta com mais de uma lua
    #         2 - todos os planetas
    #     se 2: 
    #     ...
    #     se 3: 
    #     ...
    #     se 4: 
    #     ...
    # e sempre a opção do 0 para sair
    # (talvez n precise ser tão elaborado assim com muuitas opções, talvez 2 já tá bom)
        # [OPÇÃO 2] deixar o usuário escrever:
    #       inserir <tabela> <dados>
    #       consultar <tabela> <condições>
    #           obs. condição aqui não seria o where direto, teria que manipular, poderia
    #           ser algo tipo "consultar coordenador media de viagens" - teria q fazer um group by


    # TODO (Rafa): cuidar da manipulação dos dados para enviar corretamente para as funções e evitar erros

