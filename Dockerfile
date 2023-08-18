FROM python:3.8-slim-buster     
# base image

WORKDIR /app 
# Change Work Directory

COPY requirements.txt requirements.txt
# Copy requirements.txt

RUN pip3 install -r requirements.txt
# Run the requirements.txt to install dependencies

COPY . . 
# Copy all files to the working directory

CMD ["python3", "manage.py", "runserver"]
# Command to run when the container is started