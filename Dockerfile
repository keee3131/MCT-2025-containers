FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y wait-for-it && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

#waittng db port
CMD ["sh", "-c", "wait-for-it db:5432 --timeout=30 -- python manage.py migrate --noinput && python manage.py runserver 0.0.0.0:8000"]