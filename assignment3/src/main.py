import mysql
import pandas as pd
import mysql.connector as mysql
from mysql.connector import Error
empdata = pd.read_csv('/Users/nadinalqarawi/Desktop/evidence.csv', index_col=False, delimiter = ',')
empdata.head()

# this try/except is for connecting to db, import data from csv, put into sql table
try:
    conn = mysql.connect(host='localhost',database='police',user='root',password='******')
    if conn.is_connected():
        cursor = conn.cursor()
        cursor.execute("select database();")
        record = cursor.fetchone()

        for i, row in empdata.iterrows():

            sql = "INSERT INTO police.evidence VALUES (%s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(sql, tuple(row))
            print("Record inserted")

            conn.commit()

except Error as e:
    print("Error while connecting to MySQL", e)
