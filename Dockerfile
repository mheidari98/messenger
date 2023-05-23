ARG tag="2.7"
FROM python:${tag}

LABEL maintainer="mheidari98 <mahdih3idari@gmail.com>"
LABEL description="Simple Messenger Dockerfile"
LABEL Name=messenger Version=0.0.1

EXPOSE 8080

ENV DEBIAN_FRONTEND=noninteractive
ENV DB_HOST="127.0.0.1"
ENV DB_PORT="3306"
ENV DB_NAME="messenger"
ENV DB_USER="root"
ENV DB_PASS=":D"

WORKDIR /usr/src/app

RUN apt-get update \
    && apt-get -o APT::Immediate-Configure=0 install -qqy --no-install-recommends netcat \
    # clean cache and temporary files
    && apt-get --yes clean \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && sed  '/st_mysql_options options;/a unsigned int reconnect;' /usr/include/mysql/mysql.h -i.bkp

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

COPY main.py ./

ENTRYPOINT ["./entrypoint.sh"]

CMD ["python", "main.py"]
