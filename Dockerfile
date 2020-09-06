FROM ubuntu

RUN apt-get update  -qq  
RUN apt-get -y install python3.6 \
     && apt -y install python3-pip \
     && apt-get install python-is-python3
COPY .  /Booster_CI_CD_Project/
# check pip3
RUN  pip3 install -r  /Booster_CI_CD_Project/requirements \ 
     && python3 /Booster_CI_CD_Project/manage.py makemigrations\
     &&  python3 /Booster_CI_CD_Project/manage.py migrate
CMD [ "python3"," manage.py","runserver","0.0.0.0:8000"]
