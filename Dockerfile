FROM python:3.11-slim

WORKDIR /app

# Cài Chromium, ChromeDriver và Tesseract
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    tesseract-ocr \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements và cài
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ code
COPY . .

# Chạy ứng dụng
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "app:app"]
