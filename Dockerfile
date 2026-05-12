FROM python:3.9.6-slim
WORKDIR /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000

CMD sh -c "gunicorn url_shortner.wsgi:application --bind 0.0.0.0:${PORT:-8000}"

