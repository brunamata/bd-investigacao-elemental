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

def menu_inserir_funcionario():
        print("    1 - Inserir funcionario")
        print("    0 - Retornar ao menu anterior")

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
    print("    1 - Inserir nova pesquisa")
    print("    2 - Inserir novo funcionario")
    print("    3 - Consultar tabelas")
    print("    0 - Sair\n")

def menu_consultar():
    menu_base()
    print("    1 - Consultar planeta")
    print("    2 - Consultar funcionários")
    print("    3 - Consultar equipamentos")
    print("    4 - Consultar descobertas")
    print("    0 - Retornar\n")

def menu_inserir_pesquisa():
    print("Selecione uma opção de inserção de pesquisa:")
    print("1 - Planetas com mais de uma lua")
    print("2 - Todos os planetas")

def consultar_planeta():
    menu_base()
    print("\nConsulta de Planetas:\n")
    print("Aqui estão os detalhes dos planetas.")

    conn = psycopg2.connect(f"dbname={dbname} user={username} password={password}")
    cur = conn.cursor()
    sql = "select * from planeta"
    try:
        cur.execute(sql)
        records = cur.fetchall()
        headers = ['Coordenada', 'Nome', 'Tipo', 'Sistema', 'N de Luas']
        table = tabulate(records, headers=headers, tablefmt='fancy_grid', missingval="-")
        print(table)

    except Exception as ex:        
        print(ex)
        print(type(ex))
        print("[ERRO] Eita, erro desconhecido")
        pass
    conn.commit()
    cur.close()
    conn.close()

    input("Pressione enter para sair: ")

def consultar_funcionario():
    menu_base()
    print("\nConsulta de Funcionários:\n")
    print("Aqui estão os detalhes dos funcionários.")

    conn = psycopg2.connect(f"dbname={dbname} user={username} password={password}")
    cur = conn.cursor()
    sql = "select * from funcionario"
    try:
        cur.execute(sql)
        records = cur.fetchall()
        headers = ['CPF', 'Cargo', 'Nome', 'Endereço', 'Telefone', 'Tipo Sanguíneo']
        table = tabulate(records, headers=headers, tablefmt='fancy_grid', missingval="-")
        print(table)

    except Exception as ex:        
        print(ex)
        print(type(ex))
        print("[ERRO] Eita, erro desconhecido")
        pass
    conn.commit()
    cur.close()
    conn.close()

    input("Pressione enter para sair: ")


def consultar_equipamentos():
    menu_base()
    print("\nConsulta de Equipamentos:\n")
    print("Aqui estão os detalhes dos equipamentos.")

    conn = psycopg2.connect(f"dbname={dbname} user={username} password={password}")
    cur = conn.cursor()
    sql = "select * from equipamento_exploracao"
    try:
        cur.execute(sql)
        records = cur.fetchall()
        headers = ['Num de patrimonio', 'Nome', 'Data Fabricaçao', 'Funçao']
        table = tabulate(records, headers=headers, tablefmt='fancy_grid', missingval="-")
        print(table)

    except Exception as ex:        
        print(ex)
        print(type(ex))
        print("[ERRO] Eita, erro desconhecido")
        pass
    conn.commit()
    cur.close()
    conn.close()
    
    input("Pressione enter para sair: ")


def consultar_descobertas():
    menu_base()
    print("\nConsulta de Descobertas:\n")
    print("Aqui estão os detalhes das descobertas.")

    conn = psycopg2.connect(f"dbname={dbname} user={username} password={password}")
    cur = conn.cursor()
    sql = "select * from descoberta"
    try:
        cur.execute(sql)
        records = cur.fetchall()
        headers = ['Codigo da Pesquisa', 'Elemento Quimico']
        table = tabulate(records, headers=headers, tablefmt='fancy_grid', missingval="-")

        print(table)

    except Exception as ex:        
        print(ex)
        print(type(ex))
        print("[ERRO] Eita, erro desconhecido")
        pass
    conn.commit()
    cur.close()
    conn.close()
    input("Pressione enter para sair: ")

def processar_opcao(opcao):
    
    # Inserir pesquisa
    if opcao == 1: 
        menu_inserir_pesquisa()
        # Chame a função apropriada para lidar com a inserção de pesquisa
    elif opcao == 2:
        menu_inserir_funcionario()
        sub_opcao = int(input("Escolha uma opção: "))
        limpar_terminal()

        if sub_opcao == 0:
            print("Retornando")
        elif sub_opcao == 1:
            inserir_funcionario()

    # Realizar Consulta
    elif opcao == 3:
        menu_consultar()
        sub_opcao = int(input("Escolha uma opção de consulta: "))
        limpar_terminal()

        if sub_opcao == 0:
            print("Retornando")

        # Consultar planeta
        elif sub_opcao == 1:
            consultar_planeta()

        # Todos funcionario
        elif sub_opcao == 2:
            consultar_funcionario()

        # Consultar Equipamentos
        elif sub_opcao == 3:
            consultar_equipamentos()
        
        # Consultar Descobertas
        elif sub_opcao == 4:
            consultar_descobertas()

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