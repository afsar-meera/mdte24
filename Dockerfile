# Use official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy dependency file first (faster rebuilds)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code and model
COPY app.py .
COPY model.pkl .

# Expose API port
EXPOSE 5000

# Start API on container run
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]
