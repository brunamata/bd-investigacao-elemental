import psycopg2

# Connect to your postgres DB
conn = psycopg2.connect("dbname=InvestigacaoElemental user=postgres password=COLOQUESUASENHAAQUI")

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a query
cur.execute("SELECT * FROM amostra")

# Retrieve query results
records = cur.fetchall()
print(records)

print("\n\n -------------- FUNCIONARIOOOOO ---------------------\n")
cur.execute("SELECT * FROM funcionario")
x = cur.fetchall()
for i in x: 
    print(i)
