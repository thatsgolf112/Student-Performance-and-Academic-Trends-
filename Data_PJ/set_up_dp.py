import pandas as pd
import sqlite3

csv_file = 'ai_dataset.csv' 
df = pd.read_csv(csv_file)
conn = sqlite3.connect("ai_dataset.db")
df.to_sql('students', conn, if_exists='replace', index=False)
print("Done")
conn.close()