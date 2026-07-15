FROM python:3.11-slim

WORKDIR /opt/dagster/app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 3000
