import psycopg2
import random

##################################################   DATABASE CONFIG   ##################################################
db_config = {'host': 'localhost',
             'user': 'nick',   
             'password': 'Ff3#g127',
             'port': '5432',
             'database':'main_db'}


##################################################   CONTEXT MANAGER   #################################################
class DBContext_Manager: 
	"""Диспетчер контекста для подключения БД"""
	def __init__(self, config: dict) -> None:
		"""Инициализация атрибутов класса UseDatabase"""
		self.config = config # параметры соеденения с базой данных

	def __enter__(self) -> 'cursor':
		self.conn = psycopg2.connect(**self.config) 
		self.cursor = self.conn.cursor()
		return self.cursor

	def __exit__(self, exc_type, exc_value, exc_trace) -> None:
		self.conn.commit() # запись в БД всех значений присвоенных атрибутам
		self.cursor.close() # закрываем курсор
		self.conn.close() # закрываем соеденение


##################################################   DATABASE CONNECTION   #############################################
class Database:
	"""Инициализция инструмента для передачи запросов к БД, основной базывый класс"""
	def __init__(self, config=db_config, context_manager=DBContext_Manager):
		self.config = config # параметры подключения к БД
		self.context_manager = context_manager # менеджер контекста БД

	##################################################   DATA DEFINITION   ##################################################

	# горожане
	def create_townsmen(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""CREATE TABLE IF NOT EXISTS townsmen (id SERIAL NOT NULL CONSTRAINT townsmen_pk PRIMARY KEY,
															       first_name VARCHAR(200) NOT NULL,
															       last_name VARCHAR(200) NOT NULL,
															       age INTEGER NOT NULL,     
															       income FLOAT,
															       townsman_type VARCHAR(200) NOT NULL											           													       
																   )""")

	# герцоги
	def create_dukes(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""CREATE TABLE IF NOT EXISTS dukes (id SERIAL NOT NULL CONSTRAINT dukes_pk PRIMARY KEY,
																townsman_id INTEGER NOT NULL,  
      															FOREIGN KEY (townsman_id)
  	  																REFERENCES townsmen(id)
  	  																ON DELETE CASCADE
  	  																ON UPDATE CASCADE																	 
															    )""")

	# бароны
	def create_barons(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""CREATE TABLE IF NOT EXISTS barons (id SERIAL NOT NULL CONSTRAINT barons_pk PRIMARY KEY,
																 townsman_id INTEGER NOT NULL,  
	      														 FOREIGN KEY (townsman_id)
	  	  														 	REFERENCES townsmen(id)
	  	  															ON DELETE CASCADE
	  	  															ON UPDATE CASCADE																	 
																 )""")

	# рыцари
	def create_knights(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""CREATE TABLE IF NOT EXISTS knights (id SERIAL NOT NULL CONSTRAINT knights_pk PRIMARY KEY,
																  townsman_id INTEGER NOT NULL,  
		      													      FOREIGN KEY (townsman_id)
		  	  														      REFERENCES townsmen(id)
		  	  															  ON DELETE CASCADE
		  	  															  ON UPDATE CASCADE																	 
																  )""")


	#связь руководители-подчиненные: герцоги и бароны
	def create_dukes_barons(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""CREATE TABLE IF NOT EXISTS dukes_barons (id SERIAL NOT NULL CONSTRAINT dukes_barons_pk PRIMARY KEY,
																	   duke_id INTEGER NOT NULL,
																	   baron_id INTEGER NOT NULL,
		      													       FOREIGN KEY (duke_id)
		  	  														      REFERENCES dukes(id)
		  	  															  ON DELETE CASCADE
		  	  															  ON UPDATE CASCADE,															   
		      													       FOREIGN KEY (baron_id)
		  	  														      REFERENCES barons(id)
		  	  															  ON DELETE CASCADE
		  	  															  ON UPDATE CASCADE																	 
																       )""")

	# связь руководители-подчиненные: бароны и рыцари
	def create_barons_knights(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""CREATE TABLE IF NOT EXISTS barons_knights (id SERIAL NOT NULL CONSTRAINT barons_knights_pk PRIMARY KEY,
																		 baron_id INTEGER NOT NULL,
																		 knight_id INTEGER NOT NULL,																	   
		      													         FOREIGN KEY (baron_id)
		  	  														        REFERENCES barons(id)
		  	  															    ON DELETE CASCADE
		  	  															    ON UPDATE CASCADE,
		      													         FOREIGN KEY (knight_id)
		  	  														        REFERENCES knights(id)
		  	  															    ON DELETE CASCADE
		  	  															    ON UPDATE CASCADE		  	  															  															 
																         )""")

	def create_all_tables(self):
		self.create_townsmen()
		self.create_dukes()
		self.create_barons()
		self.create_knights()
		self.create_dukes_barons()
		self.create_barons_knights()

	def drop_all_tables(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""DROP TABLE IF EXISTS dukes_barons""")
			cursor.execute("""DROP TABLE IF EXISTS barons_knights""")
			cursor.execute("""DROP TABLE IF EXISTS dukes""")
			cursor.execute("""DROP TABLE IF EXISTS barons""")
			cursor.execute("""DROP TABLE IF EXISTS knights""")
			cursor.execute("""DROP TABLE IF EXISTS townsmen""")



	##################################################   DATA MANIPULATION   #####################################################
	def add_townsman(self, first_name, last_name, age, income, townsman_type):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""INSERT INTO  townsmen (first_name, last_name, age, income, townsman_type) 
						      VALUES (%s, %s, %s, %s, %s)""", (first_name, last_name, age, income, townsman_type))

			cursor.execute("""SELECT id FROM townsmen WHERE id=(SELECT max(id) from townsmen)""")
			last_townsman_id = cursor.fetchall()[0][0]

			if townsman_type == 'герцог':
				cursor.execute("""INSERT INTO  dukes (townsman_id) VALUES (%s)""",(last_townsman_id,))
				cursor.execute("""SELECT id FROM dukes WHERE id=(SELECT max(id) from dukes)""")
				id_ = cursor.fetchall()[0][0]

			elif townsman_type == 'барон':
				cursor.execute("""INSERT INTO  barons (townsman_id) VALUES (%s)""",(last_townsman_id,))
				cursor.execute("""SELECT id FROM barons WHERE id=(SELECT max(id) from barons)""")
				id_ = cursor.fetchall()[0][0]

			elif townsman_type == 'рыцарь':
				cursor.execute("""INSERT INTO  knights (townsman_id) VALUES (%s)""",(last_townsman_id,))
				cursor.execute("""SELECT id FROM knights WHERE id=(SELECT max(id) from knights)""")
				id_ = cursor.fetchall()[0][0]
			return id_

	def create_duke_baron_rel(self, duke_id, baron_id):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""INSERT INTO dukes_barons (duke_id, baron_id) VALUES (%s, %s)""",(duke_id, baron_id))


	def create_baron_knight_rel(self, baron_id, knight_id):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""INSERT INTO barons_knights (baron_id, knight_id) VALUES (%s, %s)""",(baron_id, knight_id))

	def get_townsmen(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""SELECT id, first_name, last_name, age, income, townsman_type FROM townsmen""")
			return cursor.fetchall()

	def get_townsmen_sorted(self, column, sort_type):
		with self.context_manager(self.config) as cursor:
			if sort_type == 'ASC':
				cursor.execute(f"""SELECT id, first_name, last_name, age, income, townsman_type FROM townsmen ORDER BY {column}""")
			elif sort_type == 'DESC':
				cursor.execute(f"""SELECT id, first_name, last_name, age, income, townsman_type FROM townsmen ORDER BY {column} DESC""")
			return cursor.fetchall()

	def get_rows_number(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""SELECT count(*) FROM townsmen""")
			return cursor.fetchall()[0][0]

postgresql_db = Database()

if __name__ == '__main__':
	...
	# postgresql_db.drop_all_tables()
	# postgresql_db.create_all_tables()
	# postgresql_db.drop_all_tables()
	# postgresql_db.add_townsman('Irving', 'Strong', 79, 200, 'герцог')
	# postgresql_db.add_townsman('Irving', 'Strong', 79, 200, 'барон')
	print(postgresql_db.get_rows_number())
