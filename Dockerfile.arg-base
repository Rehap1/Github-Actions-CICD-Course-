ARG BASE_IMAGE=python:3.12-slim
FROM ${BASE_IMAGE}

WORKDIR /app

COPY app ./app

EXPOSE 8000

CMD ["python", "app/app.py"]
