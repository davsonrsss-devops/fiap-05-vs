FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Práticas de Segurança: rodar com usuário sem privilégios root
RUN addgroup --system appgroup && adduser --system --group appuser
USER appuser

EXPOSE 5000
CMD ["python", "app.py"]
