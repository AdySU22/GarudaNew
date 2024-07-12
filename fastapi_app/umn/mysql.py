import mysql.connector

class MySQL:
    def __init__(self, host, user, password, database):
        self.password = password
        self.database = database
        self.connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
        self.cursor = self.connection.cursor()

    def insert(self, table, columns: tuple, values: list):
        placeholders = ', '.join(['%s'] * len(columns))
        columns_formatted = ', '.join(columns)
        sql = f"INSERT INTO {table} ({columns_formatted}) VALUES ({placeholders})"
        try:
            self.cursor.executemany(sql, values)
            self.connection.commit()
        except mysql.connector.Error as err:
            print(f"Error: {err}")
            self.connection.rollback()

    def fetch_all(self, query: str):
        try:
            self.cursor.execute(query)
            return self.cursor.fetchall()
        except mysql.connector.Error as err:
            print(f"Error: {err}")
            return None

    def fetch_one(self, query: str):
        try:
            self.cursor.execute(query)
            return self.cursor.fetchone()
        except mysql.connector.Error as err:
            print(f"Error: {err}")
            return None

    def delete(self, query: str):
        try:
            self.cursor.execute(query)
            self.connection.commit()
            print(f"Query: {query}; {self.cursor.rowcount} record(s) has been deleted")
        except mysql.connector.Error as err:
            print(f"Error: {err}")
            self.connection.rollback()

    def close(self):
        self.cursor.close()
        self.connection.close()
        