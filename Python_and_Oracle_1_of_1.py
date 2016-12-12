#
# Python and Oracle - 1 of 1
#

import cx_Oracle
connection = cx_Oracle.connect('username/password@localhost/orcl')
print("Oracle RDBMS version " + connection.version)

cursor = connection.cursor()

sql_statement = """DROP TABLE ships2"""
cursor.execute(sql_statement)

sql_statement = """CREATE TABLE ships2 (ship_id NUMBER, ship_name VARCHAR2(20))"""
cursor.execute(sql_statement)


sql_insert = """INSERT INTO ships2 VALUES(1, 'Codd Crystal')""";
cursor.execute(sql_insert);
sql_insert = """INSERT INTO ships2 VALUES(2, 'Codd Elegance')""";
cursor.execute(sql_insert);
sql_insert = """INSERT INTO ships2 VALUES(3, 'Codd Champion')""";
cursor.execute(sql_insert);

connection.commit()

cursor.execute("SELECT ship_id, ship_name FROM ships2")
print("fetchall:")
result = cursor.fetchall()
for r in result:
  print(r)

connection.close()

print("End of script, database connection closed.");
