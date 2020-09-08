FROM ubuntu
<<<<<<< HEAD
RUN apt-get update -qq
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip
ADD . /simpleApp
=======

RUN apt-get update -qq
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip
COPY . /simpleApp
>>>>>>> 996e29921865c409dc53be91bb2d0a972e285e18
WORKDIR /simpleApp
RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]