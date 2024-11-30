from pprint import pprint

import psycopg2
class DataBase:
    def __init__(self):
        self.database = psycopg2.connect(
            database='fn27',
            user='postgres',
            host='localhost',
            password='1'
        )

    def manager(self, sql, *args, commit=False, fetchone=False, fetchall=False):
        with self.database as db:
            with db.cursor() as cursor:
                cursor.execute(sql, args)
                if commit:
                    result = db.commit()
                elif fetchone:
                    result = cursor.fetchone()
                elif fetchall:
                    result = cursor.fetchall()
            return result

    def create_table_employes(self):
        sql = '''create table if not exists employees(
                employes_id serial primary key not null,
                full_name varchar(100) not null,
                age integer not null,
                email varchar(100) not null,
                phone integer,
                address varchar(200)
            );'''
        self.manager(sql,commit=True)

    def insert_data(self):
        sql = '''insert into employees(full_name,age,email,phone,address) VALUES
                    ('ali',15,'ali@gmail.com',333333333,'toshkent'),
                    ('vali',12,'vali@gmail.com',333333333,'toshkent'),
                    ('bali',54,'bali@gmail.com',333333333,'toshkent'),
                    ('tohir',22,'tohir@gmail.com',333333333,'toshkent'),
                    ('tohirbek',876,'tohirbek@gmail.com',333333333,'toshkent');
                    '''
        self.manager(sql,commit=True)
    def insert_data2(self):
        sql = '''insert into employees(full_name,age,email,phone,address)VALUES
                    ('ali aliyev',15,'ali@gmail.com',444444444,'toshkent'),
                    ('vali vliyev',15,'vali@gmail.com',33333333333,'toshkent'),
                    ('bali bliyev',15,'bali@gmail.com',11111111,'toshkent'),
                    ('fali fliyev',15,'fali@gmail.com',22222222,'toshkent'),
                    ('dali dliyev',15,'dali@gmail.com',5555555,'toshkent');'''
        self.manager(sql,commit=True)

    def select_employes(self):
        sql = '''select * from employees'''
        return self.manager(sql,fetchall=True)


db = DataBase()
db.create_table_employes()
db.insert_data()
db.insert_data2()
db.select_employes()

