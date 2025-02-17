# flask-nginx

This project demonstrates how to deploy a Flask application using Docker and Nginx as a reverse proxy.

## Project Structure

flask-nginx/
app.py
Dockerfile
nginx/
nginx.conf
requirements.txt
README.md

## Prerequisites

- Docker
- Docker Compose

## Setup

1. **Clone the repository:**

   ```sh
   git clone https://github.com/v3l0z/flask-nginx.git
   cd flask-nginx
   ```

2. **Create a [requirements.txt](http://_vscodecontentref_/4) file:**

   ```sh
   pip freeze > requirements.txt
   ```

3. **Build and run the Docker containers:**

   ```sh
   docker-compose up --build
   ```

## Nginx Configuration

The Nginx configuration is located in [nginx.conf](http://_vscodecontentref_/5). It sets up a reverse proxy to forward requests from Nginx to the Flask application.

```properties
events {}

http {
    server {
        listen 8080;
        server_name localhost;

        location / {
            root /usr/local/Cellar/nginx/1.27.4/html;
            index index.html;
        }

        location /flask {
            proxy_pass http://localhost:3000/;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
}
```
