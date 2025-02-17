# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install dependencies
RUN pip install flask

# Expose port 3000
EXPOSE 3000

# Run Flask app
CMD ["python", "app.py"]
