# Use a lightweight Python image
FROM python:slim

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -e .

# Train the model
RUN python pipeline/training_pipeline.py

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python", "application.py"]
