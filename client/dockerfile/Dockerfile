# STAGE - 1

FROM python:3.8-slim-buster as initial-stage  

LABEL "PURPOSE"="Get python base image from hub."

VOLUME "/clientvol"

COPY . /app/clientdata

WORKDIR /app/clientdata
  
CMD ["python", "./client.py","172.16.0.22","8000"]  
