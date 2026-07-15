#!/bin/bash

# Cài Chromium và Tesseract cho Railway
apt-get update
apt-get install -y chromium chromium-driver tesseract-ocr

# Cài thư viện Python
pip install -r requirements.txt

# Chạy ứng dụng
gunicorn --bind 0.0.0.0:$PORT app:app
