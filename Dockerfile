FROM python:3.9-slim
RUN apt-get update && apt-get install -y python3-venv && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt .
RUN python -m venv venv && ./venv/bin/pip install --no-cache-dir -r requirements.txt
COPY . .
ENV FLASK_APP=app.py
CMD ["./venv/bin/flask", "run", "--host=0.0.0.0", "--port=5000"]
