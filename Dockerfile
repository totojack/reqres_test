FROM python:3.9-slim

WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

COPY ./src .

CMD [ "python", "./client.py" ]
