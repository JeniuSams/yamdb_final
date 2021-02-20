#
![Build Status](https://github.com/JeniuSams/yamdb_final/workflows/yamdb.yml/badge.svg)

# Описание проекта
Проект YaMDb собирает отзывы пользователей на произведения. Произведения делятся на категории: «Книги», «Фильмы», «Музыка».
Приложение написано на основе `fullREST` архитектуры на фреймворке `django-rest-framework`. База данных `postgresssql`.
<br><br>Проект доступен по адресу: http://jeniusams.tk
Документация: http://jeniusams.tk/redoc/


### Развертывание проекта:
#### 1. Клонирование репозитория на локальный хост  
```
git clone https://github.com/JeniuSams/infra_sp2.git
```
#### 2. Добавление структуры проекта YaMDb
Содержимое группового финального задания api_yamdb копируем в склонированный репозиторий.
Структура проекта должна выглядеть так: api, api_yamdb, manage.py, requirements.txt, reviews, templates, titles, users.

#### 3. Сборка проекта
Чтобы упаковать проект в контейнер, необходим Dockerfile.

#### 4. Установка ПО docker и docker-compose
Для запуска проекта необходим `docker-compose`. В docker-compose.yaml присутствует определённая зависимость. В нашем случае сначала должна подняться база данных, только потом сам проект.

#### 5. Директория Data
Directory data в проекте отсутствует, так как база данных у нас вынесена отдельно - отдельный контейнер, который запускается на порту 5432.

#### 6. Создание .ENV файла
Файл .env
 с переменными окружения для работы с базой данных на основе шаблона
```
DB_NAME=postgres # имя базы данных
POSTGRES_USER=postgres # логин для подключения к базе данных
POSTGRES_PASSWORD=postgres # пароль для подключения к БД (установите свой)
DB_HOST=db # название сервиса (контейнера)
DB_PORT=5432 # порт для подключения к БД 
```

#### 7. Создание образа и запуск контейнера
```
docker-compose up --build -d
```
подключиться к контейнеру:
```
infra_sp2_web_1: docker-exec -it infra_sp2_web_1 bash
```
#### 8. Создание и применение миграций базы данных
приглашение root@f04d1d6ad63c:/code# показывает, что это оболочка контейнера, теперь можно выполнить миграции:
```
root@f04d1d6ad63c:/code# python manage.py makemigrations
root@f04d1d6ad63c:/code# python manage.py migrate
```
#### 9. Создание суперпользователя
```
root@f04d1d6ad63c:/code# python manage.py createsuperuser
```

#### 10. Запуск тестов
Установите пакет pytest командой `pip3 install -U pytest`
<br>Запустите тесторование командой `pytest`


## Установка (деплой) на удаленном сервере
## Деплой с использованием git actions
Создание переменных окружения в github
 в разделе `secrets`
```
DOCKER_PASSWORD # Пароль от Docker Hub
DOCKER_USERNAME # Логин от Docker Hub
HOST # Публичный ip адрес сервера
USER # Пользователь сервера
SSH_KEY # Приватный ssh-ключ
TELEGRAM_TO # ID телеграм-аккаунта (для оправки уведомления об успешном деплое)
TELEGRAM_TOKEN # Токен бота (для оправки уведомления об успешном деплое)
```
При каждом деплое будет происходить:
- проверка кода соответствие страндарту `pep8`
- выполнение тестов `pytest`
- сборка и обновление образа на сервисе `docker-hub`
- автоматический деплой на сервер, указанный в `secrets`
- отправка уведомления в телеграм

### Использованные технологии
Django Rest Framework https://www.django-rest-framework.org/ <br>
Django https://www.djangoproject.com/ <br>
PostgreSQL https://www.postgresql.org/ <br>
Docker https://www.docker.com/ <br>

### Авторы проекта
Алексей Драгунов - Python Developer <br>
Евгения Самсонова - Python Developer <br>
Алексей Сухачевский - Python Developer <br>
