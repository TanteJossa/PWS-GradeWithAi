# syntax=docker/dockerfile:1

FROM python:3.10-slim-buster

WORKDIR /pws-scanner

COPY requirements.txt requirements.txt
# COPY --from=pws-base /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
# COPY --from=pws-base /usr/local/bin /usr/local/bin
RUN pip3 install -r requirements.txt

RUN apt-get update && \
    apt-get install ffmpeg libsm6 libxext6 zbar-tools wkhtmltopdf -y
    
COPY . .


CMD [ "python", "main.py"]