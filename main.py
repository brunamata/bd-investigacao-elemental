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
            print("[ERRO] Um dos valores inseridos não pode ser null. Atribua um valor concreto para ele.")
            print(ex)

        elif isinstance(ex, psycopg2.errors.UniqueViolation):
            print(ex)
            print("[ERRO] Este valor de chave já existe no banco, por favor, insira um valor válido e único")
        
        elif isinstance(ex, psycopg2.errors.CheckViolation):
            print(ex)
            print("[ERRO] Opa, cuidado! Para esse valor existir, precisa seguir umas regrinhas, tente novamente")
        
        elif isinstance(ex, psycopg2.errors.ForeignKeyViolation):
            print(ex)
            print("[ERRO] ops, um dos valores é chave estrangeira e precisa existir em outra tabela. Tente um valor já existente")
        
        else:
            print(ex)
            print(type(ex))
            print("[ERRO] Eita, erro desconhecido, reporta pra gente ae")
        
        pass
    
    conn.commit()
    cur.close()
    conn.close()


# if __name__ == '__main__':
#     teste()
#     inserirDados()
    
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

def limpar_terminal():
    if os.name == 'posix':  # Para sistemas Unix/Linux/Mac
        os.system('clear')
    elif os.name == 'nt':  # Para sistemas Windows
        os.system('cls')

def menu_principal():
    print("\n============= MENU =============\n")
    print("    1 - Inserir nova pesquisa")
    print("    2 - Consultar")
    print("    0 - Sair\n")

def menu_consultar():
    print("\n============= MENU =============\n")
    print("    1 - Consultar planeta")
    print("    2 - Consultar funcionários")
    print("    3 - Consultar equipamentos")
    print("    4 - Consultar descobertas")
    print("    0 - Retornar\n")

def menu_inserir_pesquisa():
    print("Selecione uma opção de inserção de pesquisa:")
    print("1 - Planetas com mais de uma lua")
    print("2 - Todos os planetas")

def processar_opcao(opcao):
    
    # Inserir pesquisa
    if opcao == 1: 
        menu_inserir_pesquisa()
        # Chame a função apropriada para lidar com a inserção de pesquisa

    # Realizar Consulta
    elif opcao == 2:
        menu_consultar()
        sub_opcao = int(input("Escolha uma opção de consulta: "))

        if sub_opcao == 0:
            print("Retornando")

        # Consultar planeta
        elif sub_opcao == 1:
            consultar_planeta()

        # Todos funcionario
        elif sub_opcao == 2:
            consultar_funcionario()

        elif sub_opcao == 3:
            consultar_equipamentos()
        
        elif sub_opcao == 4:
            consultar_descobertas()

        # Adicionar mais?
    
    # Sair do programa
    elif opcao == 0:
        print("Saindo do programa.")

    # Opcao nao valida
    else:
        print("Opção inválida. Tente novamente.")

if __name__ == '__main__':
    opcao = 1
    while opcao:
        limpar_terminal()
        menu_principal()
        opcao = int(input("Escolha uma opção: "))
        limpar_terminal()
        processar_opcao(opcao)