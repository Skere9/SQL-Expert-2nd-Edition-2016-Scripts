#
# Python and SQLite3 - 2 of 2
#

import sqlite3
connection = sqlite3.connect("ships.db")
cursor = connection.cursor();
sql_statement = """SELECT ship_id, ship_name FROM ships;"""
cursor.execute(sql_statement)
print("fetchall:")
result = cursor.fetchall()
for r in result:
  print(r)
