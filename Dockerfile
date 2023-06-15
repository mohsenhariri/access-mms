FROM python:latest
WORKDIR /app
COPY requirements.txt .
RUN python -m pip install --no-cache-dir --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
COPY matrixMult_dynamic.py .
CMD ["python", "matrixMult_dynamic.py"]
