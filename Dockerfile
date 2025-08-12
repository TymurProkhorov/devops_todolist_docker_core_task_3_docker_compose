ARG PYTHON_VERSION=3.8
FROM python:${PYTHON_VERSION} as builder

WORKDIR /app

COPY . .

FROM python:${PYTHON_VERSION} as run

WORKDIR /app

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "until nc -z $DB_HOST $DB_PORT; do echo 'Waiting for MySQL...'; sleep 2; done && python manage.py migrate && python manage.py runserver 0.0.0.0:8080"]
