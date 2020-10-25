
FROM python:3.8

# Create app directory
WORKDIR /app

# Install app dependencies
COPY requirements.txt ./


RUN pip install --upgrade setuptools && pip install -r requirements.txt

# Bundle app source
COPY . /app

EXPOSE 5000

CMD ["python", "run.py"]