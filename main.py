import psycopg2
import os
from dotenv import load_dotenv
load_dotenv()

username = os.environ['bd_username']
password = os.environ['bd_password']

# Connect to your postgres DB
conn = psycopg2.connect(f"dbname=InvestigacaoElemental user={username} password={password}")

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
