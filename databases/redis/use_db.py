import redis

##################################################   DATABASE CONFIG   ##################################################
redis_config = {'host':"localhost",
			    'port':6379,
				'password': '929884aec44464e94d14647d4891f50f3339f836062d5a5cf6ab67a18b72670a',
				 'charset':"utf-8",
				 'decode_responses':True,
				'db':0}

##################################################   CONTEXT MANAGER   #################################################
class RedisContextManager:
	"""Диспетчер контекста для подключения БД"""
	def __init__(self, config: dict) -> None:
		"""Инициализация атрибутов класса UseDatabase"""
		self.config = config # параметры соеденения с базой данных

	def __enter__(self) -> 'redis client':
		self.redis_client = redis.Redis(**self.config)
		return self.redis_client

	def __exit__(self, exc_type, exc_value, exc_trace) -> None:
		self.redis_client.close()


##################################################   DATABASE CONNECTION   #############################################
class RadisDatabase:
	"""Инициализция инструмента для передачи запросов к БД, основной базывый класс"""
	def __init__(self, config=redis_config, context_manager=RedisContextManager):
		self.config = config # параметры подключения к БД
		self.context_manager = context_manager # менеджер контекста БД

	##################################################   DATA MANIPULATION   #####################################################

	def insert_into_test_hash(self, name, phone, email):
		with self.context_manager(self.config) as redis_client:
			keys = redis_client.keys('id*')
			if not keys:
				redis_client.set('counter', '1')
			else:
				redis_client.incr('counter')

			counter = redis_client.get('counter')

			id_ = f"id {counter}"

			redis_client.hset(id_, 'id', counter)
			redis_client.hset(id_, 'name', name)
			redis_client.hset(id_, 'phone', phone)
			redis_client.hset(id_, 'email', email)

	def get_test_data(self):
		with self.context_manager(self.config) as redis_client:
			list_ = []
			for key in redis_client.keys('id*'):
				list_.append(tuple(redis_client.hvals(key)))
			return sorted(list_)

	def flushall(self):
		with self.context_manager(self.config) as redis_client:
			redis_client.flushall()



redis_db = RadisDatabase()


if __name__ == '__main__':
	redis_db.insert_into_test_hash('Василий',  '+79218838866', 'test@test.ru')
	print(redis_db.get_test_data())
	# redis_db.flushall()

