FROM python:slim

RUN apt-get update
RUN apt-get install -y gcc musl-dev

COPY dev-requirements.txt .
RUN pip3 install -r dev-requirements.txt

WORKDIR /usr/src/app

COPY . .
RUN pip3 install .

VOLUME /data
ENV ZEROBIN_CONFIG_DIR=/config

CMD ["zerobin"]
