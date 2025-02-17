# Step 1: Use an official Python image as a base
FROM python:3.9-slim

# Step 2: Set the working directory for Flask
WORKDIR /app

# Step 3: Copy the Flask app and requirements.txt into the container
COPY app.py /app/
COPY requirements.txt /app/

# Step 4: Install Flask dependencies
RUN pip install -r requirements.txt

# Step 5: Expose the Flask port (3000)
EXPOSE 3000

# Step 6: Start the Flask app
CMD ["python", "app.py"]
