FROM python:3.11-slim

WORKDIR /app
COPY ./app /app

RUN pip install fastapi uvicorn redis psycopg2-binary

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]