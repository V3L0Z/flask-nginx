# Use an official Python image as the base
FROM python:3.9

# Install dependencies
RUN apt-get update && apt-get install -y nginx supervisor

# Set working directory
WORKDIR /app

# Copy Flask app
COPY app /app

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy Nginx configuration
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copy Supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose port 8080 for Google Cloud Run
EXPOSE 8080

# Start Supervisor (manages both Nginx & Flask)
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
