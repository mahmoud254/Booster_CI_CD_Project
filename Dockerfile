FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y python3.6 && \
    apt-get install -y python3-pip

COPY . /booster/

WORKDIR /booster/

RUN  pip3 install -r requirements.txt

ENTRYPOINT python3.6 manage.py makemigrations;\
    python3.6 manage.py migrate;\
    python3.6 manage.py runserver 0.0.0.0:8000