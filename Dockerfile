FROM python:3.11.10

# Set working directory
WORKDIR /code

# Copy requirements.txt
COPY requirements.txt /code/

# Install dependencies, including fastapi[standard] and uvicorn
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the entire project to the container
COPY . /code/

# Expose the FastAPI port (8000 by default)
EXPOSE 8000

# Start the FastAPI application using Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
