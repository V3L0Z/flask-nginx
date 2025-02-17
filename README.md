# flask-nginx

This project demonstrates how to deploy a Flask application using Docker and Nginx as a reverse proxy.

How this will function is that Nginx wi0ll act as a middleman between the client(browser) and the server(flask). Nginx can act as a load balancer by taking in requests and sending them to the appropriate service.

Project can be found here: https://flask-nginx-production.up.railway.app/
By default the Nginx server will display its index.html file.
For the flask app, traverse to https://flask-nginx-production.up.railway.app/flask

## Project Structure

## 📂 Project Structure

- 📁 **project-root/**
  - 📁 **app/** (Flask application)
    - 📄 `app.py` – Flask app code
    - 📄 `requirements.txt` – Python dependencies
    - 📄 `wsgi.py` – Gunicorn entry point
  - 📁 **nginx/** (Nginx configuration)
    - 📄 `nginx.conf` – Nginx config file
    - 📄 `index.html` – Sample HTML page
  - 📄 `Dockerfile` – Docker configuration
  - 📄 `.gitignore` – Ignore unnecessary files
  - 📄 `README.md` – Project documentation
