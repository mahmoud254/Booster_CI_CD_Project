FROM ubuntu


RUN apt-get update  -qq  
RUN apt-get -y install python3.6 \
     && apt -y install python3-pip \
     && apt-get install python-is-python3

ADD . /simpleApp

WORKDIR /simpleApp
COPY  .  .
# check pip3
RUN  pip3 install -r  requirements \ 
     && python3 manage.py makemigrations\
     &&  python3 manage.py migrate
     
EXPOSE 8000

CMD [ "python3"," manage.py","runserver","0.0.0.0:8000"]
