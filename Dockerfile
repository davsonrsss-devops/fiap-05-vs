FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN opentelemetry-bootstrap -a install

COPY . .

# Práticas de Segurança: rodar com usuário sem privilégios root
RUN addgroup --system appgroup && adduser --system --group appuser
USER appuser

EXPOSE 8083

CMD ["opentelemetry-instrument", "python", "app.py"]
