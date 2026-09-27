FROM python:3.10-slim

COPY . /app
WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

# Render assigns the port dynamically, so we fetch it using shell execution syntax
CMD gunicorn --workers=4 --bind 0.0.0.0:${PORT} app:app
