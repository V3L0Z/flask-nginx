# Step 1: Use an official Python image as a base
FROM python:3.9-slim

# Step 2: Set the working directory for Flask
WORKDIR /app

# Step 3: Copy the Flask app and requirements.txt into the container
COPY app.py /app/
COPY requirements.txt /app/

# Step 4: Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    nginx \
    supervisor 

# Step 5: Install Flask dependencies
RUN pip install -r requirements.txt

# Step 6: Copy Nginx configuration
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Step 7: Copy Supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Step 8: Expose the Flask port (3000) and Nginx port (8080)
EXPOSE 3000 8080

# Step 9: Start Supervisor to manage both Nginx and Flask
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]