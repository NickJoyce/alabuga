# подключение драйвера MySql Connector
import mysql.connector

##################################################   DATABASE CONFIG   ##################################################
db_config = {'host': 'localhost',
			 'user': '',
			 'password': '',
			 'database': 'main_db'}


##################################################   CONTEXT MANAGER   ##################################################
class DBContext_Manager: 
	"""Диспетчер контекста для подключения БД"""
	def __init__(self, config: dict) -> None:
		"""Инициализация атрибутов класса UseDatabase"""
		self.configuration = config # параметры соеденения с базой данных

	def __enter__(self) -> 'cursor':
		self.conn = mysql.connector.connect(**self.configuration) # используем словарь с параметрами, чтобы подключиться к MySQL
		self.cursor = self.conn.cursor() # Создаем курсор БД
		return self.cursor

	def __exit__(self, exc_type, exc_value, exc_trace) -> None:
		self.conn.commit() # запись в БД всех значений присвоенных атрибутам
		self.cursor.close() # закрываем курсор
		self.conn.close() # закрываем соеденение


##################################################   DATABASE CONNECTION   ##################################################
class Database:
	"""Инициализция инструмента для передачи запросов к БД, основной базывый класс"""
	def __init__(self, config=db_config, context_manager=DBContext_Manager):
		self.config = config # параметры подключения к БД
		self.context_manager = context_manager # менеджер контекста БД

	##################################################   DATA DEFINITION   ##################################################			
	def create_test_table(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""CREATE TABLE IF NOT EXISTS test_table (id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
																	 name VARCHAR(100),
																	 phone VARCHAR(50), 
																	 email VARCHAR(1000)
																	 ) ENGINE = InnoDB""" )	


	##################################################   DATA MANIPULATION   #####################################################
	def insert_into_test_table(self, name, phone, email):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""INSERT INTO  test_table(name, phone, email) 
							  VALUES (%s, %s, %s)""",(name, phone, email))

	def get_test_data(self):
		with self.context_manager(self.config) as cursor:
			cursor.execute("""SELECT * FROM test_table""")
			return cursor.fetchall()

# создаем экземпляр для импорта
mysql_db = Database()

if __name__ == '__main__':
	mysql_db.create_test_table()
	mysql_db.insert_into_test_table('Василий', '+79218887777', 'test@test.ru')
	print(mysql_db.get_test_data())