# Use Slim 3.8 as the base image
FROM python:3.8-slim

LABEL maintainer="Miguel Salinas Ganedo <salinasmiguel@uniovi.es>"

# Set a working directory
WORKDIR /app

# Install dependencies required for building and installing Python packages
RUN apt-get update && apt-get install -y git

# Upgrade pip and setuptools to ensure compatibility
RUN pip3 install --upgrade pip

# Install python modules
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY ./src/wearablepermed_hmc /app

# Command to run when the container starts
CMD [ "sh" ]