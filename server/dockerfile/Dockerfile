# # STAGE 1
# FROM ubuntu:16.04 as shellStage
# #COPY serverScript.sh .
# COPY . .
# RUN chmod +x /serverScript.sh && /serverScript.sh
# # CMD ["Finished!"]

## STAGE 1
FROM python:3.8-slim-buster
LABEL "PURPOSE"="Get python base image from hub."
VOLUME "/servervol"
WORKDIR /serverdata
#COPY --from=shellStage . /serverdata

COPY . /serverdata

#RUN apk add --no-cache bash

#RUN chmod +x ./serverScript.sh

#RUN ["./serverScript.sh"]

CMD ["python", "server.py","8000"]

###########
