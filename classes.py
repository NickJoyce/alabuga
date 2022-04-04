class Townsman:
    def __init__(self, id_, first_name, last_name, age, income=0, townsman_type=None):
        self.id = id_
        self.first_name = first_name
        self.last_name = last_name
        self.age = age
        self.income = income
        self.townsman_type = townsman_type

        self.boss = None

        self.subodinates = []

    def __str__(self):
        fst = f'{self.__class__.__name__}('
        snd = f'{self.id}, {self.first_name}, {self.last_name}, {self.age}, {self.income}, {self.townsman_type})'
        return fst + snd

    def add_boss(self):
        ...

class Duke(Townsman):
    def __init__(self, id_, first_name, last_name, age,  income=1000, townsman_type='герцог'):
        super().__init__(id_, first_name, last_name, age, income, townsman_type)



class Baron(Townsman):
    def __init__(self, id_, first_name, last_name, age,  income=600, townsman_type='барон'):
        super().__init__(id_, first_name, last_name, age,  income, townsman_type)

    def add_boss(self, duke):
        if isinstance(duke, Duke):
            # Назначаем босса текущему инстансу
            self.boss = duke
            # Добавляем назначенноу боссу в список подчиненных текущий инстанс
            duke.subodinates.append(self)
        else:
            raise TypeError ('instance of class Duke only')

class Knight(Townsman):
    def __init__(self, id_, first_name, last_name, age, income=200, townsman_type='рыцарь'):
        super().__init__(id_, first_name, last_name, age, income, townsman_type)

    def add_boss(self, baron):
        if isinstance(baron, Baron):
            # Назначаем босса текущему инстансу
            self.boss = baron

            # Добавляем назначенноу боссу в список подчиненных текущий инстанс
            baron.subodinates.append(self)
        else:
            raise TypeError ('instance of class Baron only')


if __name__ == '__main__':
    duke = Duke('1', 'richard1', 'hersh1', 43)
    baron = Baron('2', 'борон1', 'hersh2', 43)
    knight = Knight('3', 'richard3', 'hersh3', 43)
    print(duke)
    print(baron)
    print(knight)



    baron.add_boss(duke)
    knight.add_boss(baron)

    print(duke.subodinates[0].last_name)

    duke.add_boss()

