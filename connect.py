import sqlite3
import pandas as pd

# Load raw dataset
df = pd.read_csv("events.csv")

# Remove exact duplicate rows found during EDA (655 duplicate rows)
df = df.drop_duplicates()

# Label missing brand values as 'Unknown' for reporting consistency
df["brand"] = df["brand"].fillna("Unknown")

# Connect to SQLite database and write cleaned data into events table
conn = sqlite3.connect("funnel.db") # connecting funnel.db
df.to_sql("events", conn, if_exists="replace", index=False)
conn.close() # closing the connection