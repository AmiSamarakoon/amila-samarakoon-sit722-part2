# Dockerfile for book_catalog microservice

# Use the official Python image from the slim variant to keep the image lightweight
FROM python:3.11-slim

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the requirements file from the host to the working directory in the container
COPY book_catalog/requirements.txt .

# Install Python dependencies listed in the requirements file without caching the packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire book_catalog directory from the host to the working directory in the container
COPY book_catalog/ .

# Set environment variable for the PostgreSQL database URL connection string
ENV DATABASE_URL="postgresql://sit722_task2_er1b_user:8fgFJ23wnygfqou7h6AGovkrqkxpwwZ5@dpg-crdh1al6l47c73aum270-a.oregon-postgres.render.com/sit722_task2_er1b"

# Expose port 8000 to allow external connections to the FastAPI application
EXPOSE 8000

# Specify the command to run the FastAPI application with Uvicorn as the ASGI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
