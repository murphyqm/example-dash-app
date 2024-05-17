
FROM python:3.12.3-slim-bookworm

# set working directory in container
WORKDIR /usr/src/app

# Copy and install packages
COPY requirements.txt /
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

# Copy app folder to app folder in container
COPY /app /usr/src/app/

# Changing to non-root user
RUN useradd -m appUser
USER appUser

# Run locally on port 8000
CMD gunicorn --bind 0.0.0.0:8000 app:server