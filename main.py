# Генерация фиктивных данных
from mimesis import Person
from mimesis.enums import Gender

from flask import Flask, render_template, request, url_for, redirect, session, flash, abort, make_response

# создание экземпляра объекта Flask и присваивание его переменной "app"
app = Flask(__name__)

# настройки приложения
app.config['SECRET_KEY'] = 'd1269dcb5c175acb12678fa83e66e9ca1a707cb4'
app.config['PERMANENT_SESSION_LIFETIME'] = 604800

# взаимодействие с mysql
from databases.mysql.use_db import mysql_db

# взаимодействие с postgresql
from databases.postgresql.use_db import postgresql_db

# взаимодействие с redis
from databases.redis.use_db import redis_db

from classes import Townsman, Duke, Baron, Knight



@app.route('/', methods=['POST', 'GET'])
def index() -> 'html':
    the_title = "CV"

    return render_template('index.html', the_title=the_title)



@app.route('/hierarchy', methods=['POST', 'GET'])
def hierarchy() -> 'html':
    the_title = "Иерархия"
    rows_number = postgresql_db.get_rows_number()
    columns = ['id', 'first_name', 'last_name', 'age']
    townsman_types = ['герцог', 'барон', 'рыцарь']

    # сортировки
    if request.method == "POST":
        column = request.form['column']

        try:
            session[column]
        except KeyError:
            session[column] = None

        if session[column] == None or session[column] == 'DESC':
            session[column] = 'ASC'
        elif session[column] == 'ASC':
            session[column] = 'DESC'

        townsmen = []
        for townsman in postgresql_db.get_townsmen_sorted(column, session[column]):
            townsmen.append(Townsman(*townsman))


    else:
        townsmen = []
        for townsman in postgresql_db.get_townsmen():
            townsmen.append(Townsman(*townsman))

    return render_template('hierarchy.html', rows_number=rows_number, townsmen=townsmen, the_title=the_title,
                                                 columns=columns, townsman_types=townsman_types )




@app.route('/gen', methods=['POST', 'GET'])
def gen() -> 'html':
    """Создает таблицы, генерирует и добавляет данные в таблицы, создает иерархически связи"""

    # если кол-во строк в бд строго меньше 500
    if postgresql_db.get_rows_number() < 500:

        # создание всех таблиц
        postgresql_db.create_all_tables()

        # генерация рандомных личных данных
        person = Person('en')
        def random_personal_data():
            """"Возвращает случайные имя, фамилию и возраст в списке"""
            first_name = person.full_name(gender=Gender.MALE).split(' ')[0]
            last_name = person.full_name(gender=Gender.MALE).split(' ')[1]
            age = person.age(18, 80)
            return [first_name, last_name, age]

        # количество герцогов
        dukes_num = 50
        # количество баронов в подчинении у 1 герцога
        barons_num_per_duke = 3
        # количество рыцерей в подчинении у 1 барона
        knights_num_per_baron = 2

        # запись персональных данных и иерархических свзей горажан в таблицу
        for i in range(dukes_num):
            duke = Duke(None, *random_personal_data())
            # записываем герцога в БД и получем его id
            duke_id = postgresql_db.add_townsman(duke.first_name, duke.last_name, duke.age, duke.income, duke.townsman_type)
            for j in range(barons_num_per_duke):
                baron = Baron(None, *random_personal_data())
                # записываем барона в БД и получем его id
                baron_id = postgresql_db.add_townsman(baron.first_name, baron.last_name, baron.age, baron.income,
                                                      baron.townsman_type)
                # Отмечаем иерархическую связь барона с герцегом в БД
                postgresql_db.create_duke_baron_rel(duke_id, baron_id)
                for k in range(knights_num_per_baron):
                    knight = Knight(None, *random_personal_data())
                    # записываем рыцаря в БД и получем его id
                    knight_id = postgresql_db.add_townsman(knight.first_name, knight.last_name, knight.age, knight.income,
                                                           knight.townsman_type)
                    # Отмечаем иерархическую связь рыцаря с бароном в БД
                    postgresql_db.create_baron_knight_rel(baron_id, knight_id)

        flash('Таблицы созданы, сгенерированы и добавлены персональные данные, добавлены иерархические связи',
              category='success')
        return redirect(url_for('hierarchy'))
    else:
        flash('Ошибка генерации: Количество строк в БД больше 500', category='error')
        return redirect(url_for('hierarchy'))




# __________ОРАБОТКА ОШИБКИ 404________
@app.errorhandler(404)
def page_not_found(error):
    return render_template('page404.html', the_title='Страница не найдена'), 404


# __________ОРАБОТКА ОШИБКИ 401________
@app.errorhandler(401)
def page_not_found(error):
    return render_template('page401.html', the_title='Доступ запрещен'), 401


if __name__ == '__main__':
    app.run(debug=True)