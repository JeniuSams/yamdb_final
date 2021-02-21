FROM python:3.8.5
WORKDIR /code
COPY . .
RUN pip install -r requirements.txt
CMD python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py collectstatic --noinput && \
    gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000

