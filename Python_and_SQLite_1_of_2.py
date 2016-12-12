#
# Python and SQLite3 - 1 of 2
#

import sqlite3
connection = sqlite3.connect("ships.db")
cursor = connection.cursor();
sql_statement = """CREATE TABLE ships (ship_id INTEGER, ship_name TEXT);"""
cursor.execute(sql_statement)
sql_insert = """INSERT INTO ships VALUES(1, 'Codd One');"""
cursor.execute(sql_insert)
sql_insert = """INSERT INTO ships VALUES(2, 'Codd Two');"""
cursor.execute(sql_insert)
sql_insert = """INSERT INTO ships VALUES(3, 'Codd Three');"""
cursor.execute(sql_insert)
connection.commit()
