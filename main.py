import psycopg2
import os
from dotenv import load_dotenv
load_dotenv()
from tabulate import tabulate

dbname = os.environ['bd_name']
username = os.environ['bd_username']
password = os.environ['bd_password']

def exec_insertion_funcionario(cpf, cargo, nome, endereco, telefone, t_sanguineo):
    sql = "INSERT INTO funcionario (cpf, cargo, nome, endereco, telefone, tipo_sanguineo) VALUES (%s, %s, %s, %s, %s, %s);"
    data = (cpf, cargo, nome, endereco, telefone, t_sanguineo, )
    
    # Inicia transacao
    conn = psycopg2.connect(f"dbname={dbname} user={username} password={password}")
    cur = conn.cursor()
    try:
        cur.execute(sql, data)
        print("Funcionario inserido com sucesso!")
        print(cpf, cargo, nome, endereco, telefone, t_sanguineo)

    #Tratamento de Erros
    except psycopg2.errors.NotNullViolation as ex:        
        print("[ERRO] Um dos valores inseridos não pode ser null. Atribua um valor concreto para ele.")
        print(ex)
        pass
    except psycopg2.errors.UniqueViolation as ex:
        print("[ERRO] Este valor de chave já existe no banco, por favor, insira um valor válido e único")
        print(ex)
        pass
    except psycopg2.errors.CheckViolation as ex:
        print("[ERRO] Opa, cuidado! Para esse valor existir, precisa seguir umas regrinhas, tente novamente")
        print(ex)
        pass
    except psycopg2.errors.ForeignKeyViolation as ex:
        print("[ERRO] ops, um dos valores é chave estrangeira e precisa existir em outra tabela. Tente um valor já existente")
        print(ex)
        pass
    except Exception as ex:
        print("[ERRO] Erro de origem desconhecida.")
        print(ex)

    conn.commit()
    cur.close()
    conn.close()
    # Encerra transacao

def consultar(tabela):
    menu_base()
    print(f"\nConsulta de {tabela}:\n")
    print(f"Aqui estão os detalhes de {tabela}.")

    conn = psycopg2.connect(f"dbname={dbname} user={username} password={password}")
    cur = conn.cursor()
    sql = f"select * from {tabela}"

    #definindo esquemas para pegar os headers das tabelas
    esquemas = {
        "planeta": ['Coordenada', 'Nome', 'Tipo', 'Sistema', 'N de Luas'],
        "funcionario": ['CPF', 'Cargo', 'Nome', 'Endereço', 'Telefone', 'Tipo Sanguíneo'],
        "equipamento_exploracao": ['Num de patrimonio', 'Nome', 'Data Fabricaçao', 'Funçao'],
        "descoberta": ['Codigo da Pesquisa', 'Elemento Quimico']
    }

    headers = esquemas[tabela]

    try:
        cur.execute(sql)
        records = cur.fetchall()

        #montando tabela para apresentacao
        table = tabulate(records, headers=headers, tablefmt='fancy_grid', missingval="-")
        print(table)

    except psycopg2.DatabaseError as ex:        
        print("[ERRO] Erro interno na consulta do banco")
        print(ex)
        pass

    conn.commit()
    cur.close()
    conn.close()

    input("Pressione enter para retornar ao menu: ")

def inserir_funcionario():
    print("\n============= CADASTRAR FUNCIONARIO =============\n")
    cpf = str(input("Insira o CPF: "))
    cargo = str(input("Insira o cargo: "))
    nome = str(input("Insira o nome: "))
    endereco = str(input("Insira o endereço: "))
    telefone = str(input("Insira o telefone: "))
    t_sanguineo = str(input("Insira o tipo sanguineo: "))
    exec_insertion_funcionario(cpf, cargo, nome, endereco, telefone, t_sanguineo)

def limpar_terminal():
    if os.name == 'posix':  # Para sistemas Unix/Linux/Mac
        os.system('clear')
    elif os.name == 'nt':  # Para sistemas Windows
        os.system('cls')

def menu_base():
    print("\n============= MENU =============\n")

def menu_principal():
    menu_base()
    print("    1 - Inserir novo funcionario")
    print("    2 - Consultar tabelas")
    print("    0 - Sair\n")

def menu_consultar():
    menu_base()
    print("    1 - Consultar planetas")
    print("    2 - Consultar funcionários")
    print("    3 - Consultar equipamentos")
    print("    4 - Consultar descobertas")
    print("    0 - Retornar\n")

def processar_opcao(opcao):
    
    # Inserir pesquisa
    if opcao == 1: 
        inserir_funcionario()

    # Realizar Consulta
    elif opcao == 2:
        menu_consultar()
        sub_opcao = int(input("Escolha uma opção de consulta: "))
        limpar_terminal()

        if sub_opcao == 0:
            print("Retornando")

        # Consultar planeta
        elif sub_opcao == 1:
            consultar("planeta")

        # Todos funcionario
        elif sub_opcao == 2:
            consultar("funcionario")

        # Consultar Equipamentos
        elif sub_opcao == 3:
            consultar("equipamento_exploracao")
        
        # Consultar Descobertas
        elif sub_opcao == 4:
            consultar("descoberta")

    # Sair do programa
    elif opcao == 0:
        print("Saindo do programa.")

    # Opcao nao valida
    else:
        print("Opção inválida. Tente novamente.")
        opcao = int(input("Escolha uma opção: "))

if __name__ == '__main__':
    opcao = 1
    while opcao:
        #limpar_terminal()
        menu_principal()
        opcao = int(input("Escolha uma opção: "))
        processar_opcao(opcao)
        # limpar_terminal()