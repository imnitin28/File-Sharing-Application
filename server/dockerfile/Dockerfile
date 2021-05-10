# STAGE 1

FROM python:3.8-slim-buster

LABEL "PURPOSE"="Get python base image from hub."

VOLUME "/servervol"

WORKDIR /serverdata

COPY . /serverdata

CMD ["python", "server.py","8000"]


