# this code is just a snippet of the whole insertion program. All of our data was generated using
# online data generators and put into csv files. From there, we used the pandas and mysql library
# to transfer the data from the csv files to the database. 
import mysql
import pandas as pd
import mysql.connector as mysql
from mysql.connector import Error
empdata = pd.read_csv('location_of_file.csv', index_col=False, delimiter = ',')
empdata.head()


try: #try connecting to mysql database
    conn = mysql.connect(host='localhost',database='police',user='root',password='******')
    if conn.is_connected():
        cursor = conn.cursor()
        cursor.execute("select database();")
        record = cursor.fetchone()

        for i, row in empdata.iterrows(): #for every entry in csv file, add it to appropriate relation

            sql = "INSERT INTO police.evidence VALUES (%s, %s, %s, %s, %s, %s, %s)" #sql query
            cursor.execute(sql, tuple(row))
            print("Record inserted") #console confirmation that data is being inserted

            conn.commit()

except Error as e: #if db connection fails, print out to console and the relevant error
    print("Error while connecting to MySQL", e)
